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
        int soCauDung, soCauSai, soCauChuaLam,second, minute,sc;
        string mn, scd;
        double diem;
        public usrctrKetQuaThi()
        {
            InitializeComponent();
        }
        public usrctrKetQuaThi(int soCauDung, int soCauSai, int soCauChuaLam, double diem,int second)
        {
            InitializeComponent();
            this.soCauDung = soCauDung;
            this.soCauSai = soCauSai;
            this.soCauChuaLam = soCauChuaLam;
            this.diem = diem;
            this.second = second;
        }

        private void usrctrKetQuaThi_Load(object sender, EventArgs e)
        {
            minute = second  / 60;
            sc = second % 60;
            if (minute < 10)
                mn = "0"+ minute.ToString();
            else
                mn =  minute.ToString();
            if (sc < 10)
                scd = "0" + sc.ToString();
            else
                scd =  sc.ToString();
            lblThoiGianHoanThanh.Text = mn + ":" + scd;
            lblSoCauDung.Text = "SỐ CÂU ĐÚNG: " + soCauDung.ToString();
            lblSoCauSai.Text = "SỐ CÂU SAI: " + soCauSai.ToString();
            lblSoCauChuaLam.Text = "SỐ CÂU CHƯA LÀM: " + soCauChuaLam.ToString();
            lbltxtDiem.Text = diem.ToString();
        }

    }
}
