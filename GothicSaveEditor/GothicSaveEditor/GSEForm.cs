using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using Microsoft.VisualBasic;

namespace GothicSaveEditor
{
    public partial class GSEForm : Form
    {
        private GothicSave Sav;

        public GSEForm()
        {
            InitializeComponent();
        }

        public void PopulateFields(GothicSave GSave)
        {
            string InstancesText = String.Empty;
            string JournalText = String.Empty;
            string CCSManagerText = String.Empty;
            string DialogsText = String.Empty;
            string GuildsText = String.Empty;
            string SymbolsText = String.Empty;
            int i, j;

            HeadTextBox.Text = Encoding.GetEncoding(1251).GetString(GSave.SavHead).Replace(((char)10).ToString(), Environment.NewLine);

            PHI1TextBox.Text = GSave.PostHeadInts[0].ToString();
            PHI2TextBox.Text = GSave.PostHeadInts[1].ToString();
            PHI3TextBox.Text = GSave.PostHeadInts[2].ToString();

            DaysTextBox.Text = GSave.SavTime.Days.Value.ToString();
            HoursTextBox.Text = GSave.SavTime.Hours.Value.ToString();
            MinutesTextBox.Text = GSave.SavTime.Minutes.Value.ToString();

            for (i = 0; i < GSave.Instances.Items.Count; i++)
            {
                InstancesText += GSave.Instances.Items[i].Caption + "=" + GSave.Instances.Items[i].Told.Value.ToString() + Environment.NewLine;
            }
            InstancesTextBox.Text = InstancesText;

            for (i = 0; i < GSave.Journal.Quests.Count; i++)
            {
                JournalText += "Quest: " + GSave.Journal.Quests[i].Caption + Environment.NewLine;
                for (j = GSave.Journal.Quests[i].Notes.Count; j > 0; j--)
                {
                    JournalText += "Note: " + GSave.Journal.Quests[i].Notes[j - 1].Note + Environment.NewLine;
                }
                JournalText += Environment.NewLine;
            }
            JournalTextBox.Text = JournalText;

            CCSManagerText = GSave.CCSManagerBlock.BeginBlock + "I:" + GSave.CCSManagerBlock.PoolCount.VarIndex.ToString() + "V:" + GSave.CCSManagerBlock.PoolCount.Value.ToString() + GSave.CCSManagerBlock.EndBlock;
            CCSManagerTextBox.Text = CCSManagerText;

            for (i = 0; i < GSave.Dialogs.Items.Count; i++)
            {
                DialogsText += GSave.Dialogs.Items[i].Caption + " [";
                DialogsText += String.Join(",", GSave.Dialogs.Items[i].VarValues.Select(a => (a.VarIndex.ToString() + ":" + a.Value.ToString())));
                DialogsText += "]" + Environment.NewLine;
            }
            DialogsTextBox.Text = DialogsText;


            j = 0;
            for (i = 0; i < GSave.Guilds.ContentArray.Length; i++)
            {
                GuildsText += GSave.Guilds.ContentArray[i].ToString();
                j += 1;
                if (j == 66)
                {
                    GuildsText += Environment.NewLine;
                    j = 0;
                }
            }
            GuildsTextBox.Text = GuildsText;

            for (i = 0; i < GSave.Symbols.Items.Count; i++)
            {
                //SymbolsText += "[N:" + GSave.Symbols.Items[i].SymNumber().ToString() + "]\t[L:" + GSave.Symbols.Items[i].VarLink.ToString() + "]\t[V:" + GSave.Symbols.Items[i].StrangeInt.ToString() + "]\t" + GSave.Symbols.Items[i].Caption + Environment.NewLine;
                SymbolsText += GSave.Symbols.Items[i].SymNumber().ToString() + "\t" + GSave.Symbols.Items[i].VarLink.ToString() + "\t" + GSave.Symbols.Items[i].StrangeInt.ToString() + "\t" + GSave.Symbols.Items[i].Caption + "\t" + ValueByLink(GSave, GSave.Symbols.Items[i].VarLink) + Environment.NewLine;
            }
            SymbolsTextBox.Text = SymbolsText;
        }

        public string ValueByLink(GothicSave gs, short lnk)
        {
            foreach (VarStruct vs in gs.Dialogs.Items)
            {
                if (vs.CaptionLength.VarIndex == lnk)
                {
                    return vs.Caption;
                }
                else if (vs.VarValuesCount.VarIndex == lnk)
                {
                    return vs.VarValuesCount.Value.ToString();
                }
                else
                {
                    foreach (IntVar iv in vs.VarValues)
                    {
                        if (iv.VarIndex == lnk)
                        {
                            return iv.Value.ToString();
                        }                        
                    }
                }
            }
            return "";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenSavDialog.InitialDirectory = @"D:\Games\Gothic II\Saves";
            if (OpenSavDialog.ShowDialog() == DialogResult.OK)
            {
                SavPathLabel.Text = "[please wait]";
                Sav = new GothicSave(OpenSavDialog.FileName);
                Application.DoEvents();
                PopulateFields(Sav);
                SavPathLabel.Text = OpenSavDialog.FileName;
                SaveSavButton.Enabled = true;
            }                       
        }

        private void SaveSavButton_Click(object sender, EventArgs e)
        {
            // time
            Sav.SavTime.Days.Value = Convert.ToInt32(DaysTextBox.Text);
            Sav.SavTime.Hours.Value = Convert.ToInt32(HoursTextBox.Text);
            Sav.SavTime.Minutes.Value = Convert.ToInt32(MinutesTextBox.Text);

            // instances
            string name;
            int told;
            Sav.Instances.Items = new List<InstVar>();
            foreach (string s in InstancesTextBox.Lines)
            {
                if (!String.IsNullOrEmpty(s))
                {
                    name = Regex.Replace(s, "=.*", "");
                    told = Convert.ToInt32(Regex.Replace(s, ".*=", ""));
                    Sav.Instances.Items.Add(GothicGenerator.GenerateInstVar(name, told));
                }
            }

            Sav.Save(SavPathLabel.Text);
            MessageBox.Show("Saved");
        }

        
    }    
}
