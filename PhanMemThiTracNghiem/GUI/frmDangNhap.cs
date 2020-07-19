using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void lblDangKy_Click(object sender, EventArgs e)
        {
            frmDangKy dk = new frmDangKy();
            dk.ShowDialog();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {

        }
    }
}
