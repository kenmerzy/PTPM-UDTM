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
        public usrctrDeThi()
        {
            InitializeComponent();
        }
        public usrctrDeThi(string tenKyThi, string moTa, string tongSoCau, string thoiGianLamBai, string thoiGianMoDe)
        {
            InitializeComponent();
            lblMonThi.Text = tenKyThi;
            //Image image = Image.FromFile("D:\\DAPT\\PhanMemThiTracNghiem\\GUI\\Resources");
            lblMoTa.Text = moTa;
            lblSoCau.Text =  tongSoCau +"  "+"Câu hỏi";
            lblThoiGianLamBai.Text = thoiGianLamBai +" "+"Phút" ;
            lblThoiGianMoDe.Text = thoiGianMoDe;
            //pictureHinhAnh.Image = image;          
        }

        private void lblMonThi_Click(object sender, EventArgs e)
        {

        }

        private void pictureHinhAnh_Click(object sender, EventArgs e)
        {

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
