using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
namespace GUI
{
    public partial class usrctrThanhVien : UserControl
    {
        ThiSinh thiSinh;
        public usrctrThanhVien()
        {
            InitializeComponent();
            lblDateTime.Text = Convert.ToString(DateTime.Now);
        }
        public usrctrThanhVien(ThiSinh thiSinh)
        {
            InitializeComponent();
            this.thiSinh = thiSinh;
            lblDateTime.Text = Convert.ToString(DateTime.Now);
            lblTaiKhoan.Text = "Tài khoản: " + thiSinh.TenThiSinh;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {

        }

    }
}
