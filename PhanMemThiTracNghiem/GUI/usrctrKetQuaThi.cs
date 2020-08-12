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
    public partial class usrctrKetQuaThi : UserControl
    {
        int soCauDung, soCauSai, soCauChuaLam;
        double diem;
        public usrctrKetQuaThi()
        {
            InitializeComponent();
        }
        public usrctrKetQuaThi(int soCauDung, int soCauSai, int soCauChuaLam, double diem)
        {
            InitializeComponent();
            this.soCauDung = soCauDung;
            this.soCauSai = soCauSai;
            this.soCauChuaLam = soCauChuaLam;
            this.diem = diem;
        }

        private void usrctrKetQuaThi_Load(object sender, EventArgs e)
        {
            lblSoCauDung.Text = "SỐ CÂU ĐÚNG: " + soCauDung.ToString()  ;
            lblSoCauSai.Text = "SỐ CÂU SAI: " + soCauSai.ToString();
            lblSoCauChuaLam.Text = "SỐ CÂU CHƯA LÀM: " + soCauChuaLam.ToString();
            lbltxtDiem.Text = diem.ToString();
        }

    }
}
