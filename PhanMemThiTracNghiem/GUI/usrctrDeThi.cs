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
    public partial class usrctrDeThi : UserControl
    {
        TableLayoutPanel layoutThi;
        string tsc = null;
        int tglb = 0;
        frmMain ma;
        string maMon ;
        string tenKyThi;
        public usrctrDeThi()
        {
            InitializeComponent();
        }
        public usrctrDeThi(string tenKyThi, string moTa, string tongSoCau, string thoiGianLamBai, string thoiGianMoDe, TableLayoutPanel layoutT,string maMon,string hinhAnh)
        {
            InitializeComponent();
            lblMonThi.Text = tenKyThi;
            lblMoTa.Text = moTa;
            lblSoCau.Text =  tongSoCau +"  "+"Câu hỏi";
            pictureHinhAnh.Image = Image.FromFile("E:\\PTPM-UDTM\\PhanMemThiTracNghiem\\GUI\\Resources\\" + hinhAnh);
            lblThoiGianLamBai.Text = thoiGianLamBai.ToString() +" "+"phút" ;
            lblThoiGianMoDe.Text = thoiGianMoDe;
            layoutThi = layoutT;
            tglb = int.Parse(thoiGianLamBai);  
            tsc = tongSoCau;
            this.tenKyThi = tenKyThi;
            this.maMon = maMon;   
        }

        private void lblMonThi_Click(object sender, EventArgs e)
        {
            layoutThi.Controls.Clear();
            usrctrTrangThi th = new usrctrTrangThi(tsc,tglb,maMon,tenKyThi);
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
