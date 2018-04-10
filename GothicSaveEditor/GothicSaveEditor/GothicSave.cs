using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace GothicSaveEditor
{
    public class GothicSave
    {
        private MemoryStream SavStream;
        private BinaryReader SavReader;

        public byte[] SavHead;
        public int[] PostHeadInts;
        public TimeClass SavTime;
        public InstancesClass Instances;
        public JournalClass Journal;
        public CCSManager CCSManagerBlock;
        public DialogsClass Dialogs;
        public GuildData Guilds;
        public SymData Symbols;

        public GothicSave(string FilePath)
        {
            this.Load(FilePath);
        }

        public ShortVarWithoutIndex ReadShortVarWithoutIndex()
        {
            ShortVarWithoutIndex short_var = new ShortVarWithoutIndex();
            short_var.FirstByte = SavReader.ReadByte();
            short_var.Value = SavReader.ReadInt16();
            return short_var;
        }

        public ShortVar ReadShortVar()
        {
            ShortVar short_var = new ShortVar();
            short_var.FirstByte = SavReader.ReadByte();
            short_var.VarIndex = SavReader.ReadInt32();
            short_var.DelimeterByte = SavReader.ReadByte();
            short_var.Value = SavReader.ReadInt16();
            return short_var;
        }

        public IntVar ReadIntVar()
        {
            IntVar int_var = new IntVar();
            int_var.FirstByte = SavReader.ReadByte();
            int_var.VarIndex = SavReader.ReadInt32();
            int_var.DelimeterByte = SavReader.ReadByte();
            int_var.Value = int_var.DelimeterByte == 1 ? SavReader.ReadInt16() : SavReader.ReadInt32();
            return int_var;
        }

        public VarStruct ReadVarStruct()
        {
            VarStruct var_struct = new VarStruct();
            var_struct.CaptionLength = ReadIntVar();
            var_struct.CaptionBytes = SavReader.ReadBytes(var_struct.CaptionLength.Value);
            var_struct.VarValuesCount = ReadIntVar();
            while (var_struct.VarValues.Count < var_struct.VarValuesCount.Value)
            {
                var_struct.VarValues.Add(ReadIntVar());
            }
            return var_struct;
        }

        public InstVar ReadInstVar()
        {
            InstVar inst_var = new InstVar();
            inst_var.Told = ReadIntVar();
            inst_var.CaptionLength = ReadIntVar();
            inst_var.CaptionBytes = SavReader.ReadBytes(inst_var.CaptionLength.Value);
            return inst_var;
        }

        public QuestNote ReadQuestNote()
        {
            QuestNote quest_note = new QuestNote();
            quest_note.NoteLength = ReadIntVar();
            quest_note.NoteBytes = SavReader.ReadBytes(quest_note.NoteLength.Value);
            return quest_note;
        }

        public Quest ReadQuest()
        {
            Quest quest = new Quest();
            quest.CaptionLength = ReadIntVar();
            quest.CaptionBytes = SavReader.ReadBytes(quest.CaptionLength.Value);
            quest.TopicDecription = ReadIntVar();
            quest.TopicSection = ReadIntVar();
            quest.TopicStatus = ReadIntVar();
            quest.NotesCount = ReadIntVar();
            while (quest.Notes.Count < quest.NotesCount.Value)
            {
                quest.Notes.Add(ReadQuestNote());
            }
            return quest;
        }

        public SymItem ReadSymItem()
        {
            SymItem sym = new SymItem();
            sym.CaptionLength = SavReader.ReadInt16();
            sym.VarLink = SavReader.ReadInt16();
            sym.StrangeInt = SavReader.ReadInt32();
            sym.CaptionBytes = SavReader.ReadBytes(sym.CaptionLength);
            return sym;
        }

        public void Load(string FilePath)
        {
            this.SavStream = new MemoryStream(File.ReadAllBytes(FilePath));
            this.SavReader = new BinaryReader(SavStream);
            this.PostHeadInts = new int[3] { 0, 0, 0 };
            this.SavTime = new TimeClass();
            this.Instances = new InstancesClass();
            this.Journal = new JournalClass();
            this.CCSManagerBlock = new CCSManager();
            this.Dialogs = new DialogsClass();
            this.Guilds = new GuildData();
            this.Symbols = new SymData();

            // seek to begin
            this.SavStream.Seek(0, SeekOrigin.Begin);

            // read head    
            List<byte> lb = new List<byte>();
            while (true)
            {
                lb.Add(this.SavReader.ReadByte());
                if (lb[lb.Count - 1] == 10)
                {
                    // if '\nEND\n' found then break
                    if ((lb[lb.Count - 5] == 10) && (lb[lb.Count - 4] == 69) && (lb[lb.Count - 3] == 78) && (lb[lb.Count - 2] == 68))
                    {
                        break;
                    }
                }
            }

            this.SavHead = lb.ToArray();

            // read post head integer variables
            this.PostHeadInts[0] = this.SavReader.ReadInt32();
            this.PostHeadInts[1] = this.SavReader.ReadInt32();
            this.PostHeadInts[2] = this.SavReader.ReadInt32();

            //read time
            this.SavTime.Days = this.ReadIntVar();
            this.SavTime.Hours = this.ReadIntVar();
            this.SavTime.Minutes = this.ReadIntVar();

            // read instances
            this.Instances.InstancesCount = this.ReadIntVar();
            while (this.Instances.Items.Count < this.Instances.InstancesCount.Value)
            {
                this.Instances.Items.Add(ReadInstVar());
            }

            // read journal
            this.Journal.EntriesVar = this.ReadIntVar();
            this.Journal.QuestsCount = this.ReadIntVar();
            while (this.Journal.Quests.Count < this.Journal.QuestsCount.Value)
            {
                this.Journal.Quests.Add(this.ReadQuest());
            }

            // read CCSManager block
            this.CCSManagerBlock.BeginBlockLength = this.ReadShortVarWithoutIndex();
            this.CCSManagerBlock.BeginBlockBytes = this.SavReader.ReadBytes(this.CCSManagerBlock.BeginBlockLength.Value);
            this.CCSManagerBlock.PoolCount = this.ReadIntVar();
            this.CCSManagerBlock.EndBlockLength = this.ReadShortVarWithoutIndex();
            this.CCSManagerBlock.EndBlockBytes = this.SavReader.ReadBytes(this.CCSManagerBlock.EndBlockLength.Value);

            //read dialogs
            this.Dialogs.DialogsCount = this.ReadIntVar();
            while (this.Dialogs.Items.Count < this.Dialogs.DialogsCount.Value)
            {
                this.Dialogs.Items.Add(this.ReadVarStruct());
            }

            // read guilds
            this.Guilds.CellsCount = this.ReadShortVar();
            this.Guilds.ContentArray = this.SavReader.ReadBytes(this.Guilds.CellsCount.Value);

            // read symbols block
            this.Symbols.Count = this.SavReader.ReadInt32();
            while (this.Symbols.Items.Count < this.Symbols.Count)
            {
                this.Symbols.Items.Add(this.ReadSymItem());
            }
        }

        public void Save(string FilePath)
        {
            MemoryStream sav_stream = new MemoryStream();
            BinaryWriter sav = new BinaryWriter(sav_stream);
            int index = 0; // 0x00

            // prepare new symbols list
            SymData symbols = new SymData();            

            // head
            sav.Write(this.SavHead);

            // post head ints
            sav.Write(this.PostHeadInts[0]);
            sav.Write(this.PostHeadInts[1]);
            int symbols_address = (int)sav_stream.Position;
            sav.Write((int)0);
            
            // time days
            int days_index = index++; // 0x00
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)days_index, 0, "day"));
            sav.Write(this.SavTime.Days.FirstByte);
            sav.Write(days_index);
            sav.Write(this.SavTime.Days.DelimeterByte);
            sav.Write(this.SavTime.Days.Value);
            // time hours
            int hours_index = index++; // 0x01
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)hours_index, 0, "hour"));
            sav.Write(this.SavTime.Hours.FirstByte);
            sav.Write(hours_index);
            sav.Write(this.SavTime.Hours.DelimeterByte);
            sav.Write(this.SavTime.Hours.Value);
            // time minutes
            int minutes_index = index++; // 0x02
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)minutes_index, 0, "min"));
            sav.Write(this.SavTime.Minutes.FirstByte);
            sav.Write(minutes_index);
            sav.Write(this.SavTime.Minutes.DelimeterByte);
            sav.Write(this.SavTime.Minutes.Value);

            // instances
            int num_of_entries_index = index++; // 0x03
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)num_of_entries_index, 0, "NumOfEntries"));
            sav.Write(this.Instances.InstancesCount.FirstByte);
            sav.Write(num_of_entries_index);
            sav.Write(this.Instances.InstancesCount.DelimeterByte);
            sav.Write(this.Instances.Items.Count);
            int told_index = index++; // 0x04
            int inst_name_index = index++; // 0x05
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)told_index, 0, "Told"));
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)inst_name_index, 0, "InstName"));
            foreach (InstVar inst_var in this.Instances.Items)
            {
                // told
                sav.Write(inst_var.Told.FirstByte);
                sav.Write(told_index);
                sav.Write(inst_var.Told.DelimeterByte);
                sav.Write(inst_var.Told.Value);
                // inst name
                sav.Write(inst_var.CaptionLength.FirstByte);
                sav.Write(inst_name_index);
                sav.Write(inst_var.CaptionLength.DelimeterByte);
                sav.Write((short)inst_var.CaptionLength.Value);
                // caption
                sav.Write(inst_var.CaptionBytes);
            }

            // journal
            int quests_count_index = index++; // 0x06
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)quests_count_index, 0, "LOGMANAGERTOPICCOUNT"));
            // journal entries var
            sav.Write(this.Journal.EntriesVar.FirstByte);
            sav.Write(num_of_entries_index);
            sav.Write(this.Journal.EntriesVar.DelimeterByte);
            sav.Write(this.Journal.EntriesVar.Value);
            // journal entries count
            sav.Write(this.Journal.QuestsCount.FirstByte);
            sav.Write(quests_count_index);
            sav.Write(this.Journal.QuestsCount.DelimeterByte);
            sav.Write(this.Journal.Quests.Count);
            // quests
            int quest_caption_index = index++;          // 0x07
            int topic_description_index = index++;      // 0x08
            int topic_section_index = index++;          // 0x09
            int topic_status_index = index++;           // 0x0A
            int quest_notes_count_index = index++;      // 0x0B
            int quest_note_length_index = index++;      // 0x0C
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)quest_caption_index, 0, "TOPICDESCRIPTION"));
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)topic_description_index, 0, "TOPICSECTION"));
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)topic_section_index, 0, "TOPICSTATUS"));
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)topic_status_index, 0, "LOGTOPICENTRYCOUNT"));
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)quest_notes_count_index, 0, "LOGMANAGERENTRYCOUNT"));
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)quest_note_length_index, 0, "ENTRYDESCRIPTION"));
            foreach (Quest quest in this.Journal.Quests)
            {
                // quest caption
                sav.Write(quest.CaptionLength.FirstByte);
                sav.Write(quest_caption_index);
                sav.Write(quest.CaptionLength.DelimeterByte);
                sav.Write((short)quest.CaptionLength.Value);
                sav.Write(quest.CaptionBytes);
                // quest topic description
                sav.Write(quest.TopicDecription.FirstByte);
                sav.Write(topic_description_index);
                sav.Write(quest.TopicDecription.DelimeterByte);
                sav.Write(quest.TopicDecription.Value);
                // quest topic section
                sav.Write(quest.TopicSection.FirstByte);
                sav.Write(topic_section_index);
                sav.Write(quest.TopicSection.DelimeterByte);
                sav.Write(quest.TopicSection.Value);
                // quest topic status
                sav.Write(quest.TopicStatus.FirstByte);
                sav.Write(topic_status_index);
                sav.Write(quest.TopicStatus.DelimeterByte);
                sav.Write(quest.TopicStatus.Value);
                // quest notes count
                sav.Write(quest.NotesCount.FirstByte);
                sav.Write(quest_notes_count_index);
                sav.Write(quest.NotesCount.DelimeterByte);
                sav.Write(quest.Notes.Count);
                // quest notes
                foreach (QuestNote quest_note in quest.Notes)
                {
                    // note length
                    sav.Write(quest_note.NoteLength.FirstByte);
                    sav.Write(quest_note_length_index);
                    sav.Write(quest_note.NoteLength.DelimeterByte);
                    sav.Write((short)quest_note.NoteLength.Value);
                    // note
                    sav.Write(quest_note.NoteBytes);
                }
            }

            // CCSManager
            int pool_count_index = index++; // 0x0D
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)pool_count_index, 0, "poolCount"));
            // CCSManager begin block
            sav.Write(this.CCSManagerBlock.BeginBlockLength.FirstByte);
            sav.Write(this.CCSManagerBlock.BeginBlockLength.Value);
            sav.Write(this.CCSManagerBlock.BeginBlockBytes);
            // CCSManager poll count
            sav.Write(this.CCSManagerBlock.PoolCount.FirstByte);
            sav.Write(pool_count_index);
            sav.Write(this.CCSManagerBlock.PoolCount.DelimeterByte);
            sav.Write(this.CCSManagerBlock.PoolCount.Value);
            // CCSManager end block
            sav.Write(this.CCSManagerBlock.EndBlockLength.FirstByte);
            sav.Write(this.CCSManagerBlock.EndBlockLength.Value);
            sav.Write(this.CCSManagerBlock.EndBlockBytes);

            // dialogs
            int num_symbols_index = index++; // 0x0E
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)num_symbols_index, 0, "numSymbols"));
            // dialogs count (numSymbols)
            sav.Write(this.Dialogs.DialogsCount.FirstByte);
            sav.Write(num_symbols_index);
            sav.Write(this.Dialogs.DialogsCount.DelimeterByte);
            sav.Write(this.Dialogs.Items.Count);
            foreach (VarStruct dialog in this.Dialogs.Items)
            {
                // dialog caption length
                sav.Write(dialog.CaptionLength.FirstByte);
                sav.Write(index++);
                sav.Write(dialog.CaptionLength.DelimeterByte);
                sav.Write((short)dialog.CaptionLength.Value);
                // dialog caption
                sav.Write(dialog.CaptionBytes);
                // dialog vars count
                sav.Write(dialog.VarValuesCount.FirstByte);
                sav.Write(index++);
                sav.Write(dialog.VarValuesCount.DelimeterByte);
                sav.Write(dialog.VarValues.Count);
                // dialog vars
                foreach (IntVar int_var in dialog.VarValues)
                {
                    sav.Write(int_var.FirstByte);
                    sav.Write(index++);
                    sav.Write(int_var.DelimeterByte);
                    sav.Write(int_var.Value);
                }
            }

            // guilds
            int guild_table_index = index++; // ~ 0x215A
            symbols.Items.Add(GothicGenerator.GenerateSymItem((short)guild_table_index, 0, "guildTable"));
            // guilds table cells count
            sav.Write(this.Guilds.CellsCount.FirstByte);
            sav.Write(guild_table_index);
            sav.Write(this.Guilds.CellsCount.DelimeterByte);
            sav.Write(this.Guilds.CellsCount.Value);
            // guilds table
            sav.Write(this.Guilds.ContentArray);
            int symbols_address_value = (int)sav_stream.Position;

            // symbols

            /* // write new items
            sav.Write(symbols.Items.Count + Dialogs.SubItemsCount());
            foreach (SymItem sym_item in symbols.Items)
            {
                sav.Write(sym_item.CaptionLength);
                sav.Write(sym_item.VarLink);
                sav.Write((int)0);
                sav.Write(sym_item.CaptionBytes);
            }
            string symName;
            string symNameCnt;
            string symValue;
            int symIndex = 0;
            int symValueIndex = 0;
            SymItem new_sym_item;
            foreach (VarStruct dialog in Dialogs.Items)
            {
                // symName0
                symName = "symName" + symIndex.ToString();
                new_sym_item = GothicGenerator.GenerateSymItem((short)dialog.CaptionLength.VarIndex, 0, symName);
                sav.Write(new_sym_item.CaptionLength);
                sav.Write(new_sym_item.VarLink);
                sav.Write((int)0);
                sav.Write(new_sym_item.CaptionBytes);
                // symName0cnt
                symNameCnt = symName + "cnt";
                new_sym_item = GothicGenerator.GenerateSymItem((short)dialog.VarValuesCount.VarIndex, 0, symNameCnt);
                sav.Write(new_sym_item.CaptionLength);
                sav.Write(new_sym_item.VarLink);
                sav.Write((int)0);
                sav.Write(new_sym_item.CaptionBytes);
                // symValue0_0
                symValueIndex = 0;
                foreach (IntVar dialog_var in dialog.VarValues)
                {
                    symValue = "symValue" + symIndex.ToString() + "_" + symValueIndex.ToString();
                    new_sym_item = GothicGenerator.GenerateSymItem((short)dialog_var.VarIndex, 0, symValue);
                    sav.Write(new_sym_item.CaptionLength);
                    sav.Write(new_sym_item.VarLink);
                    sav.Write((int)0);
                    sav.Write(new_sym_item.CaptionBytes);
                    symValueIndex++;
                }
                symIndex++;
            }
            */

            // write readed items
            //Symbols.Items.Sort((x, y) => x.VarLink.CompareTo(y.VarLink));
            sav.Write(Symbols.Count);
            foreach (SymItem symbols_item in Symbols.Items)
            {
                sav.Write(symbols_item.CaptionLength);
                sav.Write(symbols_item.VarLink);
                sav.Write(symbols_item.StrangeInt);
                sav.Write(symbols_item.CaptionBytes);
            }            

            // save symbols array address
            sav.Seek(symbols_address, SeekOrigin.Begin);
            sav.Write(symbols_address_value);

            // save results to file
            File.WriteAllBytes(FilePath, sav_stream.ToArray());
        }
    }

    public class ShortVarWithoutIndex
    {
        public byte FirstByte;
        public short Value;
    }

    public class ShortVar
    {
        public byte FirstByte;
        public Int32 VarIndex;
        public byte DelimeterByte;
        public short Value;
    }

    public class IntVar
    {
        public byte FirstByte;
        public Int32 VarIndex;
        public byte DelimeterByte;
        public Int32 Value;
    }

    public class InstVar
    {
        public IntVar Told;
        public IntVar CaptionLength;
        public byte[] CaptionBytes;

        public string Caption { get { return Encoding.GetEncoding(1251).GetString(this.CaptionBytes); } }

        public InstVar()
        {
            this.Told = new IntVar();
            this.CaptionLength = new IntVar();
        }
    }

    public class VarStruct
    {
        public IntVar CaptionLength;
        public byte[] CaptionBytes;
        public IntVar VarValuesCount;
        public List<IntVar> VarValues;

        public string Caption { get { return Encoding.GetEncoding(1251).GetString(this.CaptionBytes); } }

        public VarStruct()
        {
            this.CaptionLength = new IntVar();
            this.VarValuesCount = new IntVar();
            this.VarValues = new List<IntVar>();
        }
    }

    public class TimeClass
    {
        public IntVar Days;
        public IntVar Hours;
        public IntVar Minutes;

        public TimeClass()
        {
            this.Days = new IntVar();
            this.Hours = new IntVar();
            this.Minutes = new IntVar();
        }
    }

    public class InstancesClass
    {
        public IntVar InstancesCount;
        public List<InstVar> Items;

        public InstancesClass()
        {
            this.InstancesCount = new IntVar();
            this.Items = new List<InstVar>();
        }
    }

    public class QuestNote
    {
        public IntVar NoteLength;
        public byte[] NoteBytes;

        public string Note { get { return Encoding.GetEncoding(1251).GetString(this.NoteBytes); } }

        public QuestNote()
        {
            this.NoteLength = new IntVar();
        }
    }

    public class Quest
    {
        public IntVar CaptionLength;
        public byte[] CaptionBytes;
        public IntVar TopicDecription;
        public IntVar TopicSection;
        public IntVar TopicStatus;
        public IntVar NotesCount;
        public List<QuestNote> Notes;

        public string Caption { get { return Encoding.GetEncoding(1251).GetString(this.CaptionBytes); } }

        public Quest()
        {
            this.CaptionLength = new IntVar();
            this.TopicDecription = new IntVar();
            this.TopicSection = new IntVar();
            this.TopicStatus = new IntVar();
            this.NotesCount = new IntVar();
            this.Notes = new List<QuestNote>();
        }
    }

    public class JournalClass
    {
        public IntVar EntriesVar;
        public IntVar QuestsCount;
        public List<Quest> Quests;

        public JournalClass()
        {
            this.EntriesVar = new IntVar();
            this.QuestsCount = new IntVar();
            this.Quests = new List<Quest>();
        }
    }

    public class CCSManager
    {
        public ShortVarWithoutIndex BeginBlockLength;
        public byte[] BeginBlockBytes;
        public IntVar PoolCount;
        public ShortVarWithoutIndex EndBlockLength;
        public byte[] EndBlockBytes;

        public string BeginBlock { get { return Encoding.GetEncoding(1251).GetString(this.BeginBlockBytes); } }
        public string EndBlock { get { return Encoding.GetEncoding(1251).GetString(this.EndBlockBytes); } }

        public CCSManager()
        {
            this.BeginBlockLength = new ShortVarWithoutIndex();
            this.PoolCount = new IntVar();
            this.EndBlockLength = new ShortVarWithoutIndex();
        }
    }

    public class DialogsClass
    {
        public IntVar DialogsCount;
        public List<VarStruct> Items;

        public DialogsClass()
        {
            this.DialogsCount = new IntVar();
            this.Items = new List<VarStruct>();
        }

        public int SubItemsCount()
        {
            return this.Items.Select(a => (a.VarValues.Count+2)).Sum();
        }
    }

    public class GuildData
    {
        public ShortVar CellsCount;
        public byte[] ContentArray;

        public GuildData()
        {
            this.CellsCount = new ShortVar();
        }
    }

    public class SymItem
    {
        public short CaptionLength;
        public short VarLink;
        public Int32 StrangeInt;
        public byte[] CaptionBytes;

        public string Caption { get { return Encoding.GetEncoding(1251).GetString(this.CaptionBytes); } }

        public int SymNumber()
        {
            string caption = this.Caption;
            try
            {
                int result = Convert.ToInt32(Regex.Replace(caption, @"^\D+(\d+).*", @"$1"));
                return result;
            }
            catch
            {
                return -1;
            }
        }

        public int SymPostValue()
        {
            string caption = this.Caption;
            try
            {
                int result = Convert.ToInt32(Regex.Replace(caption, @"^.*?_(\d+).*", @"$1"));
                return result;
            }
            catch
            {
                return -1;
            }
        }

    }

    public class SymData
    {
        public Int32 Count;
        public List<SymItem> Items;

        public SymData()
        {
            this.Items = new List<SymItem>();
        }
    }

    public static class GothicGenerator
    {
        public static SymItem GenerateSymItem(short Index, int IntVar, string Name)
        {
            SymItem item = new SymItem();
            item.CaptionLength = (short)Name.Length;
            item.VarLink = Index;
            item.StrangeInt = IntVar;
            item.CaptionBytes = Encoding.GetEncoding(1251).GetBytes(Name);
            return item;
        }

        public static InstVar GenerateInstVar(string Name, int Told = 0)
        {
            InstVar item = new InstVar();
            item.CaptionBytes = Encoding.GetEncoding(1251).GetBytes(Name);
            item.Told = new IntVar() { FirstByte = 18, VarIndex = 4, DelimeterByte = 6, Value = Told };
            item.CaptionLength = new IntVar() { FirstByte = 18, VarIndex = 5, DelimeterByte = 1, Value = Name.Length };            
            return item;
        }
    }
}
