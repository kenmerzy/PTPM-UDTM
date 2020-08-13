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
        TableLayoutPanel layoutThi;
        usrctrSearch us;
        string tsc = null;
        int tglb = 0;
        int maKyThi;
        frmMain ma;
        int maThiSinh;
        string maMon;
        string tenKyThi;

        public usrctrItemsDeThiMoi()
        {
            InitializeComponent();
        }
        public usrctrItemsDeThiMoi(int maKyThi, string tenKyThi, string moTa, string tongSoCau, string thoiGianLamBai, string thoiGianMoDe, TableLayoutPanel layoutT, string maMon, string hinhAnh, int maThiSinh, usrctrSearch us)
        {
            InitializeComponent();
            lblMonThi.Text = tenKyThi;
            pictureHinhAnh.Image = Image.FromFile("E:\\PTPM-UDTM\\PhanMemThiTracNghiem\\GUI\\Resources\\" + hinhAnh);
            lblThoiGianMoDe.Text = thoiGianMoDe;
            layoutThi = layoutT;
            tglb = int.Parse(thoiGianLamBai);
            tsc = tongSoCau;
            this.tenKyThi = tenKyThi;
            this.maMon = maMon;
            this.maKyThi = maKyThi;
            this.maThiSinh = maThiSinh;
            this.us = us;
        }

        private void lblMonThi_Click(object sender, EventArgs e)
        {
            layoutThi.Controls.Clear();
            usrctrTrangThi th = new usrctrTrangThi(tsc, tglb, maMon, tenKyThi, maKyThi, maThiSinh, us);
            layoutThi.Controls.Add(th);
            th.Dock = DockStyle.Fill;
            layoutThi.SetColumnSpan(th, 2);
        }

        private void lblMonThi_MouseHover(object sender, EventArgs e)
        {
            lblMonThi.StateNormal.ShortText.Color1 = Color.SaddleBrown;
        }

        private void lblMonThi_MouseLeave(object sender, EventArgs e)
        {
            lblMonThi.StateNormal.ShortText.Color1 = Color.Black;
        }

    }
}
