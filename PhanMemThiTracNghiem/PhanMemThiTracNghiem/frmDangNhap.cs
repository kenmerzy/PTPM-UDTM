using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Toolkit;

namespace PhanMemThiTracNghiem
{
    public partial class frmDangNhap : KryptonForm
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }



        private void lblDangKy_LinkClicked(object sender, EventArgs e)
        {
            frmDangKy frmDK = new frmDangKy();
            frmDK.ShowDialog();
        }



    }
}
