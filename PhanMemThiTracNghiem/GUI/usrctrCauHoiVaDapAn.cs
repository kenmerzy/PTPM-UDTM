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
    public partial class usrctrCauHoiVaDapAn : UserControl
    {
        List<CauHoi> lstCH;
        List<List<DapAn>> lstDA;
        int dapAnChon;
        int cauHoiHienTai;
        public usrctrCauHoiVaDapAn()
        {
            InitializeComponent();
        }
        public usrctrCauHoiVaDapAn(List<CauHoi>listCH ,List<List<DapAn>> listDa)
        {
            InitializeComponent();
            lstCH = new List<CauHoi>();
            lstDA = new List<List<DapAn>>();
            lstCH = listCH;
            lstDA = listDa;
            loadCHvaDA(lstCH, lstDA, 0);
            cauHoiHienTai = 0;
        }


        private void loadCHvaDA(List<CauHoi> lstCH, List<List<DapAn>> lstDA, int position)
        {

            loadCauHoi(lstCH[position].NoiDung);
            loadDapAn(lstDA[position][0].NoiDung, lstDA[position][1].NoiDung, lstDA[position][2].NoiDung, lstDA[position][3].NoiDung);
        }
        private void loadCHvaDA(List<CauHoi> lstCH, List<List<DapAn>> lstDA, int position,int dapAnChon)
        {
            loadCauHoi(lstCH[position].NoiDung);
            loadDapAn(lstDA[position][0].NoiDung, lstDA[position][1].NoiDung, lstDA[position][2].NoiDung, lstDA[position][3].NoiDung);
            chonDapAn(dapAnChon);
        }
        private void chonDapAn(int dapAn)
        {
            if (dapAn == 1)
                rdBtnDapAnA.Checked = true;
            else if (dapAn == 2)
                rdBtnDapAnB.Checked = true;
            else if (dapAn == 3)
                rdBtnDapAnC.Checked = true;
            else if (dapAn == 4)
                rdBtnDapAnD.Checked = true;
        }
         private void loadCauHoi(string cauHoi)
        {
                lblCauHoi.Text = cauHoi;
        }

         private void loadDapAn( string dapAnA, string dapAnB, string dapAnC, string dapAnD)
         {
             rdBtnDapAnA.Text = dapAnA;
             rdBtnDapAnB.Text = dapAnB;
             rdBtnDapAnC.Text = dapAnC;
             rdBtnDapAnD.Text = dapAnD;
         }
    }
}
