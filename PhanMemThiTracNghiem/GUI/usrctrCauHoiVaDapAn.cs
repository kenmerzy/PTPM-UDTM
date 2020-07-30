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
        List<DapAn> lstDA;
        public usrctrCauHoiVaDapAn()
        {
            InitializeComponent();
        }
        public usrctrCauHoiVaDapAn(List<CauHoi>listCH ,List<DapAn> listDa)
        {
            InitializeComponent();
            lstCH = listCH;
            lstDA = listDa;
            loadCHvaDA(lstCH,lstDA);
        }

        private void loadCHvaDA(List<CauHoi> lstCH, List<DapAn> lstDA)
        {
            loadCauHoi(lstCH[0].NoiDung);
            loadDapAn(lstDA[0].NoiDung,lstDA[1].NoiDung,lstDA[2].NoiDung,lstDA[3].NoiDung);
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
