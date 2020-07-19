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
            linkLblMonHoc.Text = tenKyThi;
            //Image image = Image.FromFile("D:\\DAPT\\PhanMemThiTracNghiem\\GUI\\Resources");
            lblMoTa.Text = moTa;
            lblSoCauHoi.Text =  tongSoCau +"  "+"Câu hỏi";
            lblThoiGianLamBai.Text = thoiGianLamBai +" "+"Phút" ;
            lblThoiGianMoDe.Text = thoiGianMoDe;
            //pictureHinhAnh.Image = image;

            lblMoTa.Font = new Font("Times New Roman", (float)14, FontStyle.Bold);
            linkLblMonHoc.Font = new Font("Times New Roman", (float)16, FontStyle.Bold);
            lblSoCauHoi.Font = new Font("Times New Roman", (float)13, FontStyle.Bold);
            lblThoiGianLamBai.Font = new Font("Times New Roman", (float)13, FontStyle.Bold);
            lblThoiGianMoDe.Font = new Font("Times New Roman", (float)13, FontStyle.Bold);
        }


    }
}
