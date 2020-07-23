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
        List<CauHoi> lstCH;
        List<DapAn> lstDA;
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
            ch = new usrctrCauHoiVaDapAn(lstCH,lstDA);
            layoutRight.Controls.Clear();
            ch.Dock = DockStyle.Fill;
            layoutRight.Controls.Add(ch);
            layoutTop.Visible = true;

            

        }
        private void getCauHoiDapAn()
        {
            dethiBLL_DAL = new DeThiBLL_DAL();
            lstCH = dethiBLL_DAL.getCauHois(maMon);
            MessageBox.Show(lstCH.Count.ToString());
            for(int i = 0 ; i< lstCH.Count ; i++)
            {
                    lstDA.AddRange(dethiBLL_DAL.getDapAns(lstCH[i].MaCauHoi));
                    
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
