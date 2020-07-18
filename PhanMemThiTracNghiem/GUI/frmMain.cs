using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Navigator;

namespace GUI
{
    public partial class frmMain : Form
    {
        Color defaultSearch_BackGround;
        public frmMain()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            

           
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            usrctrDeThi dt = new usrctrDeThi();
            dt.Dock = DockStyle.Top;
            flowLayoutLeft.Controls.Add(dt);
            flowLayoutLeft.SetFlowBreak(dt, true);

            usrctrSearch us = new usrctrSearch();
            us.Dock = DockStyle.Top;
            tableLayoutPanel4.Controls.Add(us);

           

            usrctrThanhVien u = new usrctrThanhVien();
            u.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(u);
            flowLayoutRight.SetFlowBreak(u, true);

            usrctrXepHang xh = new usrctrXepHang();
            xh.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(xh);
            flowLayoutRight.SetFlowBreak(xh, true);



        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            tableLayoutPanel2.Controls.Clear();
            usrctrThi th = new usrctrThi();
            tableLayoutPanel2.Controls.Add(th);
            th.Dock = DockStyle.Fill;
            tableLayoutPanel2.SetColumnSpan(th, 2);

            //Button btn = new Button();
            //btn.Text = "Buttonnnnn";
            //tableLayoutPanel2.Controls.Add(btn);
            //btn.Dock = DockStyle.Fill;
            //tableLayoutPanel2.SetColumnSpan(btn, 2);
            
           

        }



     

      







  


    }
}
