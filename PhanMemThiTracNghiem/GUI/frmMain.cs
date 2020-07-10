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
            

            usrctrDeThi dt = new usrctrDeThi();
            dt.Dock = DockStyle.Top;
            flowLayoutLeft.Controls.Add(dt);
            flowLayoutLeft.SetFlowBreak(dt, true);
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            usrctrSearch us = new usrctrSearch();
            us.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(us);
            flowLayoutRight.SetFlowBreak(us, true);

           

            usrctrThanhVien u = new usrctrThanhVien();
            u.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(u);
            flowLayoutRight.SetFlowBreak(u, true);

            usrctrXepHang xh = new usrctrXepHang();
            xh.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(xh);
            flowLayoutRight.SetFlowBreak(xh, true);



        }

     

      







  


    }
}
