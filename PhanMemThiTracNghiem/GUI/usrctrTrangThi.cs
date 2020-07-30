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
        int minute ;
        int second ;
        string mnl, scl,maMon;
        List<CauHoi> listCH;
        List<List<DapAn>> listDA;
        usrctrCauHoiVaDapAn ch;
        DeThiBLL_DAL dethiBLL_DAL;
        
        public usrctrTrangThi()
        {
            InitializeComponent();
        }
        public usrctrTrangThi(string soCau, int thoiGianLamBai,string maMon)
        {
            InitializeComponent();
            lbltxtSoCau.Text = soCau;
            lbltxtThoiGian.Text = thoiGianLamBai.ToString() + " phút";
            minute = thoiGianLamBai;
            second = 0;
            this.maMon = maMon;
            layoutTop.Visible = false; 

        }

        private void btnBatDauLamBai_Click(object sender, EventArgs e)
        {
            getCauHoiDapAn();

            countDown.Enabled = true;
            ch = new usrctrCauHoiVaDapAn(listCH, listDA);
            layoutRight.Controls.Clear();
            ch.Dock = DockStyle.Fill;
            layoutRight.Controls.Add(ch);
            layoutTop.Visible = true;

            

        }
        private void getCauHoiDapAn()
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
                lbltxtThoiGianConLai.Text = "00:00";
                countDown.Enabled = false;
            }
          
        }
     }
}
