using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class usrctrItemsDeThiMoi : UserControl
    {
        public usrctrItemsDeThiMoi()
        {
            InitializeComponent();
        }
        public usrctrItemsDeThiMoi(string tenKyThi, string thoiGianMoDe, string hinhAnh)
        {
            InitializeComponent();
            lblMonThi.Text = tenKyThi;
            pictureHinhAnh.Image = Image.FromFile("E:\\PTPM-UDTM\\PhanMemThiTracNghiem\\GUI\\Resources\\" + hinhAnh);
            lblThoiGianMoDe.Text = thoiGianMoDe;
        }

        private void lblMonThi_Click(object sender, EventArgs e)
        {
            //Lay.Controls.Clear();
            //usrctrTrangThi th = new usrctrTrangThi(tsc, tglb, maMon, tenKyThi);
            //layoutThi.Controls.Add(th);
            //th.Dock = DockStyle.Fill;
            //layoutThi.SetColumnSpan(th, 2);
        }

    }
}
