namespace GUI
{
    partial class usrctrDeThiMoi
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.kryptonPanelDeThiMoi = new ComponentFactory.Krypton.Toolkit.KryptonPanel();
            this.kryptonLabel1 = new ComponentFactory.Krypton.Toolkit.KryptonLabel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.flowLayoutPanelDeThi = new System.Windows.Forms.FlowLayoutPanel();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonPanelDeThiMoi)).BeginInit();
            this.kryptonPanelDeThiMoi.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // kryptonPanelDeThiMoi
            // 
            this.kryptonPanelDeThiMoi.Controls.Add(this.kryptonLabel1);
            this.kryptonPanelDeThiMoi.Dock = System.Windows.Forms.DockStyle.Fill;
            this.kryptonPanelDeThiMoi.Location = new System.Drawing.Point(3, 3);
            this.kryptonPanelDeThiMoi.Name = "kryptonPanelDeThiMoi";
            this.kryptonPanelDeThiMoi.Size = new System.Drawing.Size(424, 44);
            this.kryptonPanelDeThiMoi.TabIndex = 0;
            // 
            // kryptonLabel1
            // 
            this.kryptonLabel1.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.kryptonLabel1.Location = new System.Drawing.Point(0, 0);
            this.kryptonLabel1.Name = "kryptonLabel1";
            this.kryptonLabel1.Size = new System.Drawing.Size(112, 28);
            this.kryptonLabel1.StateNormal.ShortText.Color1 = System.Drawing.Color.Black;
            this.kryptonLabel1.StateNormal.ShortText.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.kryptonLabel1.TabIndex = 0;
            this.kryptonLabel1.Values.Text = "Đề Thi Mới";
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Controls.Add(this.kryptonPanelDeThiMoi, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.flowLayoutPanelDeThi, 0, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(430, 488);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // flowLayoutPanelDeThi
            // 
            this.flowLayoutPanelDeThi.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanelDeThi.Location = new System.Drawing.Point(3, 53);
            this.flowLayoutPanelDeThi.Name = "flowLayoutPanelDeThi";
            this.flowLayoutPanelDeThi.Size = new System.Drawing.Size(424, 432);
            this.flowLayoutPanelDeThi.TabIndex = 1;
            // 
            // usrctrDeThiMoi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "usrctrDeThiMoi";
            this.Size = new System.Drawing.Size(430, 488);
            ((System.ComponentModel.ISupportInitialize)(this.kryptonPanelDeThiMoi)).EndInit();
            this.kryptonPanelDeThiMoi.ResumeLayout(false);
            this.kryptonPanelDeThiMoi.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private ComponentFactory.Krypton.Toolkit.KryptonPanel kryptonPanelDeThiMoi;
        private ComponentFactory.Krypton.Toolkit.KryptonLabel kryptonLabel1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanelDeThi;

    }
}
