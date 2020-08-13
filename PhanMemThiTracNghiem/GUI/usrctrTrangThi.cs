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
    public partial class usrctrTrangThi : UserControl
    {
        double diem;
        int minute ;
        int second ;
        string mnl,scl,maMon,tenKyThi;
        string soCau;
        int thoiGianLamBai,maKyThi;
        int maThiSinh;
        List<CauHoi> listCH;
        List<List<DapAn>> listDA;
        List<DapAn> lstDapAnDung;
        usrctrCauHoiVaDapAn ch;
        usrctlHuongDanThi hdt;
        usrctrKetQuaThi kqt;
        DeThiBLL_DAL dethiBLL_DAL;
        usrctrSearch us;
        
        public usrctrTrangThi()
        {
            InitializeComponent();
        }
        public usrctrTrangThi(string soCau, int thoiGianLamBai,string maMon,string tenKyThi,int maKyThi,int maThiSinh, usrctrSearch us )
        {
            InitializeComponent();
            lbltxtSoCau.Text = soCau;
            lbltxtThoiGian.Text = thoiGianLamBai.ToString() + " phút";
            lblTenKyThi.Text = tenKyThi;
            minute = thoiGianLamBai;
            second = 0;
            this.maMon = maMon;
            this.soCau = soCau;
            this.thoiGianLamBai = thoiGianLamBai;
            layoutTop.Visible = false;
            this.tenKyThi = tenKyThi;
            lbltxtThoiGianConLai.StateNormal.ShortText.Color1 = Color.Black;
            this.maKyThi = maKyThi;
            this.maThiSinh = maThiSinh;
            this.us = us;
            us.Visible = false;
        }

        private void getCauHoiDapAn(string maMon)
        {
            List<DapAn> listTMP;
            listCH = new List<CauHoi>();
            listDA = new List<List<DapAn>>();
            dethiBLL_DAL = new DeThiBLL_DAL();
            listCH = dethiBLL_DAL.getCauHois(maMon);
            for(int i = 0 ; i< listCH.Count ; i++)
            {
                    listTMP = new List<DapAn>();
                    listTMP = dethiBLL_DAL.getDapAns(listCH[i].MaCauHoi);
                    listDA.Add(listTMP);
            }
        }

        private void countDown_Tick(object sender, EventArgs e)
        {
            if (second == 0)
            {
                minute--;
                second = 59;
            }

            mnl = minute.ToString();
            scl = second.ToString();

            if (minute < 5)
                lbltxtThoiGianConLai.StateNormal.ShortText.Color1 = Color.Red;

            if (second < 10)
                scl = "0" + second.ToString();
            if (minute < 10)
                mnl = "0" + minute.ToString();
            second--;

            lbltxtThoiGianConLai.Text = mnl + ":" + scl;
            if (minute < 0)
            {
                countDown.Enabled = false;
                lbltxtThoiGianConLai.Text = "00:00";
                ch.setDaThiXong(true);
                ch.ketThucBaiThi();
                diem = ch.chamDiem();
                kqt = new usrctrKetQuaThi(ch.getSoCauDung(), ch.getSoCauSai(), ch.getSoCauChuaLam(), ch.chamDiem(), thoiGianLamBai * 60 - (minute * 60 + second +1));
                kqt.Dock = DockStyle.Fill;
                layoutKetQua.Controls.Add(kqt);
                btnNopBai.Visible = false;
                if (dethiBLL_DAL.luuKetQua(maThiSinh, maKyThi, DateTime.Now, diem, thoiGianLamBai * 60 - (minute * 60 + second+1)))
                    MessageBox.Show("Kết thúc giờ làm bài. Bài thi của bạn đã được lưu !");
                else
                    MessageBox.Show("Nộp bài thất bại");
            }
          
        }

        private void usrctrTrangThi_Load(object sender, EventArgs e)
        {
            hdt = new usrctlHuongDanThi();
            layoutCauHoiDapAn.Controls.Clear();
            hdt.Dock = DockStyle.Fill;
            layoutCauHoiDapAn.Controls.Add(hdt);
            layoutNopBai.Visible = false;
        }

        private void getAllDapAnDung(string maMon)
        {
            lstDapAnDung = new List<DapAn>();
            lstDapAnDung .AddRange(dethiBLL_DAL.getAllDapAnDung(maMon));
        }
       
       
        private void btnBatDauLamBai_Click_1(object sender, EventArgs e)
        {
            btnNopBai.Visible = true;
            getCauHoiDapAn(maMon);
            getAllDapAnDung(maMon);
            countDown.Enabled = true;
            ch = new usrctrCauHoiVaDapAn(listCH, listDA,lstDapAnDung);
            layoutCauHoiDapAn.Controls.Clear();
          
   
            ch.Dock = DockStyle.Fill;
            lblTenKyThi.Text = tenKyThi;
            lbltxtThoiGianConLai.Text = minute.ToString() + ":00";
            layoutCauHoiDapAn.Controls.Add(ch);
         
            layoutTop.Visible = true;
            layoutNopBai.Visible = true;
            layoutBatDauLamBai.Visible = false;

            ch.setDaThiXong(false);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult rs;

            rs = MessageBox.Show("Bạn có chắc chắn muốn thoát ?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (rs == DialogResult.Yes)
            {
                lbltxtSoCau.Text = soCau;
                lbltxtThoiGian.Text = thoiGianLamBai.ToString() + " phút";
                minute = thoiGianLamBai;
                second = 0;
                layoutTop.Visible = false;
                layoutNopBai.Visible = false;
                layoutBatDauLamBai.Visible = true;

                hdt = new usrctlHuongDanThi();
                layoutCauHoiDapAn.Controls.Clear();
                hdt.Dock = DockStyle.Fill;
                layoutCauHoiDapAn.Controls.Add(hdt);
                lbltxtThoiGianConLai.StateNormal.ShortText.Color1 = Color.Black;
                layoutKetQua.Controls.Clear();
            }
        }

        private void btnNopBai_Click(object sender, EventArgs e)
        {
            countDown.Enabled = false;
            btnNopBai.Visible = false;
            ch.setDaThiXong(true);
            ch.ketThucBaiThi();
            diem = ch.chamDiem();
            kqt = new usrctrKetQuaThi(ch.getSoCauDung(), ch.getSoCauSai(), ch.getSoCauChuaLam(), ch.chamDiem(), thoiGianLamBai * 60 -( minute * 60 + second +1));
            kqt.Dock = DockStyle.Fill;
            layoutKetQua.Controls.Add(kqt);
            if (dethiBLL_DAL.luuKetQua(maThiSinh, maKyThi, DateTime.Now, diem, thoiGianLamBai * 60 - (minute * 60 + second+1)))
                MessageBox.Show("Nộp bài thành công");
            else
                MessageBox.Show("Nộp bài thất bại");
        }

     }
}
