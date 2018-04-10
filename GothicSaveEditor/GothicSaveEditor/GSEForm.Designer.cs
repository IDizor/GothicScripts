namespace GothicSaveEditor
{
    partial class GSEForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.LoadSavButton = new System.Windows.Forms.Button();
            this.HeadTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.InstancesTextBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.DialogsTextBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.GuildsTextBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.SymbolsTextBox = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.JournalTextBox = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.PHI1TextBox = new System.Windows.Forms.TextBox();
            this.PHI2TextBox = new System.Windows.Forms.TextBox();
            this.PHI3TextBox = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.DaysTextBox = new System.Windows.Forms.TextBox();
            this.HoursTextBox = new System.Windows.Forms.TextBox();
            this.MinutesTextBox = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.CCSManagerTextBox = new System.Windows.Forms.TextBox();
            this.SaveSavButton = new System.Windows.Forms.Button();
            this.OpenSavDialog = new System.Windows.Forms.OpenFileDialog();
            this.SavPathLabel = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // LoadSavButton
            // 
            this.LoadSavButton.Location = new System.Drawing.Point(11, 12);
            this.LoadSavButton.Name = "LoadSavButton";
            this.LoadSavButton.Size = new System.Drawing.Size(77, 23);
            this.LoadSavButton.TabIndex = 0;
            this.LoadSavButton.Text = "Load";
            this.LoadSavButton.UseVisualStyleBackColor = true;
            this.LoadSavButton.Click += new System.EventHandler(this.button1_Click);
            // 
            // HeadTextBox
            // 
            this.HeadTextBox.Location = new System.Drawing.Point(12, 103);
            this.HeadTextBox.Multiline = true;
            this.HeadTextBox.Name = "HeadTextBox";
            this.HeadTextBox.ReadOnly = true;
            this.HeadTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.HeadTextBox.Size = new System.Drawing.Size(184, 340);
            this.HeadTextBox.TabIndex = 1;
            this.HeadTextBox.WordWrap = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 87);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(33, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Head";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(199, 87);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Instances";
            // 
            // InstancesTextBox
            // 
            this.InstancesTextBox.Location = new System.Drawing.Point(202, 103);
            this.InstancesTextBox.MaxLength = 999999999;
            this.InstancesTextBox.Multiline = true;
            this.InstancesTextBox.Name = "InstancesTextBox";
            this.InstancesTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.InstancesTextBox.Size = new System.Drawing.Size(184, 340);
            this.InstancesTextBox.TabIndex = 3;
            this.InstancesTextBox.WordWrap = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(389, 87);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(42, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Dialogs";
            // 
            // DialogsTextBox
            // 
            this.DialogsTextBox.Location = new System.Drawing.Point(392, 103);
            this.DialogsTextBox.Multiline = true;
            this.DialogsTextBox.Name = "DialogsTextBox";
            this.DialogsTextBox.ReadOnly = true;
            this.DialogsTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.DialogsTextBox.Size = new System.Drawing.Size(184, 340);
            this.DialogsTextBox.TabIndex = 5;
            this.DialogsTextBox.WordWrap = false;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(579, 87);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(36, 13);
            this.label4.TabIndex = 8;
            this.label4.Text = "Guilds";
            // 
            // GuildsTextBox
            // 
            this.GuildsTextBox.Location = new System.Drawing.Point(582, 103);
            this.GuildsTextBox.Multiline = true;
            this.GuildsTextBox.Name = "GuildsTextBox";
            this.GuildsTextBox.ReadOnly = true;
            this.GuildsTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.GuildsTextBox.Size = new System.Drawing.Size(184, 340);
            this.GuildsTextBox.TabIndex = 7;
            this.GuildsTextBox.WordWrap = false;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(769, 87);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(46, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Symbols";
            // 
            // SymbolsTextBox
            // 
            this.SymbolsTextBox.Location = new System.Drawing.Point(772, 103);
            this.SymbolsTextBox.Multiline = true;
            this.SymbolsTextBox.Name = "SymbolsTextBox";
            this.SymbolsTextBox.ReadOnly = true;
            this.SymbolsTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.SymbolsTextBox.Size = new System.Drawing.Size(184, 340);
            this.SymbolsTextBox.TabIndex = 9;
            this.SymbolsTextBox.WordWrap = false;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(9, 446);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(41, 13);
            this.label6.TabIndex = 12;
            this.label6.Text = "Journal";
            // 
            // JournalTextBox
            // 
            this.JournalTextBox.Location = new System.Drawing.Point(12, 462);
            this.JournalTextBox.Multiline = true;
            this.JournalTextBox.Name = "JournalTextBox";
            this.JournalTextBox.ReadOnly = true;
            this.JournalTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.JournalTextBox.Size = new System.Drawing.Size(944, 152);
            this.JournalTextBox.TabIndex = 11;
            this.JournalTextBox.WordWrap = false;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(14, 63);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(74, 13);
            this.label7.TabIndex = 13;
            this.label7.Text = "PostHeadInts:";
            // 
            // PHI1TextBox
            // 
            this.PHI1TextBox.Location = new System.Drawing.Point(94, 60);
            this.PHI1TextBox.Name = "PHI1TextBox";
            this.PHI1TextBox.ReadOnly = true;
            this.PHI1TextBox.Size = new System.Drawing.Size(55, 20);
            this.PHI1TextBox.TabIndex = 14;
            // 
            // PHI2TextBox
            // 
            this.PHI2TextBox.Location = new System.Drawing.Point(155, 60);
            this.PHI2TextBox.Name = "PHI2TextBox";
            this.PHI2TextBox.ReadOnly = true;
            this.PHI2TextBox.Size = new System.Drawing.Size(55, 20);
            this.PHI2TextBox.TabIndex = 15;
            // 
            // PHI3TextBox
            // 
            this.PHI3TextBox.Location = new System.Drawing.Point(216, 60);
            this.PHI3TextBox.Name = "PHI3TextBox";
            this.PHI3TextBox.ReadOnly = true;
            this.PHI3TextBox.Size = new System.Drawing.Size(55, 20);
            this.PHI3TextBox.TabIndex = 16;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(324, 63);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(33, 13);
            this.label8.TabIndex = 17;
            this.label8.Text = "Time:";
            // 
            // DaysTextBox
            // 
            this.DaysTextBox.Location = new System.Drawing.Point(354, 60);
            this.DaysTextBox.Name = "DaysTextBox";
            this.DaysTextBox.Size = new System.Drawing.Size(33, 20);
            this.DaysTextBox.TabIndex = 18;
            // 
            // HoursTextBox
            // 
            this.HoursTextBox.Location = new System.Drawing.Point(393, 60);
            this.HoursTextBox.Name = "HoursTextBox";
            this.HoursTextBox.Size = new System.Drawing.Size(33, 20);
            this.HoursTextBox.TabIndex = 19;
            // 
            // MinutesTextBox
            // 
            this.MinutesTextBox.Location = new System.Drawing.Point(432, 60);
            this.MinutesTextBox.Name = "MinutesTextBox";
            this.MinutesTextBox.Size = new System.Drawing.Size(33, 20);
            this.MinutesTextBox.TabIndex = 20;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(507, 63);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(73, 13);
            this.label9.TabIndex = 21;
            this.label9.Text = "CCSManager:";
            // 
            // CCSManagerTextBox
            // 
            this.CCSManagerTextBox.Location = new System.Drawing.Point(582, 60);
            this.CCSManagerTextBox.Name = "CCSManagerTextBox";
            this.CCSManagerTextBox.ReadOnly = true;
            this.CCSManagerTextBox.Size = new System.Drawing.Size(356, 20);
            this.CCSManagerTextBox.TabIndex = 22;
            // 
            // SaveSavButton
            // 
            this.SaveSavButton.Enabled = false;
            this.SaveSavButton.Location = new System.Drawing.Point(94, 12);
            this.SaveSavButton.Name = "SaveSavButton";
            this.SaveSavButton.Size = new System.Drawing.Size(77, 23);
            this.SaveSavButton.TabIndex = 23;
            this.SaveSavButton.Text = "Save";
            this.SaveSavButton.UseVisualStyleBackColor = true;
            this.SaveSavButton.Click += new System.EventHandler(this.SaveSavButton_Click);
            // 
            // OpenSavDialog
            // 
            this.OpenSavDialog.FileName = "openFileDialog1";
            // 
            // SavPathLabel
            // 
            this.SavPathLabel.AutoSize = true;
            this.SavPathLabel.Location = new System.Drawing.Point(14, 38);
            this.SavPathLabel.Name = "SavPathLabel";
            this.SavPathLabel.Size = new System.Drawing.Size(41, 13);
            this.SavPathLabel.TabIndex = 24;
            this.SavPathLabel.Text = "[no file]";
            // 
            // GSEForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(968, 624);
            this.Controls.Add(this.SavPathLabel);
            this.Controls.Add(this.SaveSavButton);
            this.Controls.Add(this.CCSManagerTextBox);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.MinutesTextBox);
            this.Controls.Add(this.HoursTextBox);
            this.Controls.Add(this.DaysTextBox);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.PHI3TextBox);
            this.Controls.Add(this.PHI2TextBox);
            this.Controls.Add(this.PHI1TextBox);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.JournalTextBox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.SymbolsTextBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.GuildsTextBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.DialogsTextBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.InstancesTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.HeadTextBox);
            this.Controls.Add(this.LoadSavButton);
            this.Name = "GSEForm";
            this.Text = "Gothic Save Editor";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button LoadSavButton;
        private System.Windows.Forms.TextBox HeadTextBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox InstancesTextBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox DialogsTextBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox GuildsTextBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox SymbolsTextBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox JournalTextBox;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox PHI1TextBox;
        private System.Windows.Forms.TextBox PHI2TextBox;
        private System.Windows.Forms.TextBox PHI3TextBox;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox DaysTextBox;
        private System.Windows.Forms.TextBox HoursTextBox;
        private System.Windows.Forms.TextBox MinutesTextBox;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox CCSManagerTextBox;
        private System.Windows.Forms.Button SaveSavButton;
        private System.Windows.Forms.OpenFileDialog OpenSavDialog;
        private System.Windows.Forms.Label SavPathLabel;
    }
}

