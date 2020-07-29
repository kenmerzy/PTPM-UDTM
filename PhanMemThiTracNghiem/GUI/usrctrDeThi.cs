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
        public usrctrDeThi()
        {
            InitializeComponent();
        }
        public usrctrDeThi(string tenKyThi, string moTa, string tongSoCau, string thoiGianLamBai, string thoiGianMoDe, TableLayoutPanel layoutT,string maMon)
        {
            InitializeComponent();
            lblMonThi.Text = tenKyThi;
            //Image image = Image.FromFile("D:\\DAPT\\PhanMemThiTracNghiem\\GUI\\Resources");
            lblMoTa.Text = moTa;
            lblSoCau.Text =  tongSoCau +"  "+"Câu hỏi";
            lblThoiGianLamBai.Text = thoiGianLamBai.ToString() +" "+"phút" ;
            lblThoiGianMoDe.Text = thoiGianMoDe;
            layoutThi = layoutT;
            tglb = int.Parse(thoiGianLamBai);  
            tsc = tongSoCau;
            this.maMon = maMon;
            //pictureHinhAnh.Image = image;          
        }

        private void lblMonThi_Click(object sender, EventArgs e)
        {
            layoutThi.Controls.Clear();
            usrctrTrangThi th = new usrctrTrangThi(tsc,tglb,maMon);
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
