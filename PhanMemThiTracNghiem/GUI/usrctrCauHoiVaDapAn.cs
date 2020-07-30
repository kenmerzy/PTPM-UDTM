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
using ComponentFactory.Krypton.Toolkit;
namespace GUI
{
    public partial class usrctrCauHoiVaDapAn : UserControl
    {
        List<CauHoi> lstCH;
        List<List<DapAn>> lstDA;
        List<DapAn> lstDapAnDaChon;
        List<int> lstIntChon;
        int tongSoCau;
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
            tongSoCau = lstCH.Count;
            lstIntChon = new List<int>();
            lstIntChon = newlstIntChon(tongSoCau);
            loadCHvaDA(lstCH, lstDA, 0);
            cauHoiHienTai = 0;
        }

        
        private void loadCHvaDA(List<CauHoi> lstCH, List<List<DapAn>> lstDA, int position)
        {

            loadCauHoi(lstCH[position].NoiDung,position);
            loadDapAn(lstDA[position][0].NoiDung, lstDA[position][1].NoiDung, lstDA[position][2].NoiDung, lstDA[position][3].NoiDung);
        }
        private void loadCHvaDA(List<CauHoi> lstCH, List<List<DapAn>> lstDA, int position,int dapAnChon)
        {
            loadCauHoi(lstCH[position].NoiDung,position);
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
            else
            {
                rdBtnDapAnA.Checked = false;
                rdBtnDapAnB.Checked = false;
                rdBtnDapAnC.Checked = false;
                rdBtnDapAnD.Checked = false;
            }

        }
         private void loadCauHoi(string cauHoi, int position)
        {
                lblCauHoi.Text = "Câu " +(position + 1).ToString() + ": " + cauHoi;
        }

         private void loadDapAn( string dapAnA, string dapAnB, string dapAnC, string dapAnD)
         {
             rdBtnDapAnA.Text = "A. "+ dapAnA;
             rdBtnDapAnB.Text = "B. " + dapAnB;
             rdBtnDapAnC.Text = "C. " + dapAnC;
             rdBtnDapAnD.Text = "D. " + dapAnD;
         }
         private void disableAllRadioButton()
         {
             rdBtnDapAnA.AutoCheck = false;
             rdBtnDapAnB.AutoCheck = false;
             rdBtnDapAnC.AutoCheck = false;
             rdBtnDapAnD.AutoCheck = false;

             rdBtnDapAnA.Cursor = Cursors.No;
             rdBtnDapAnB.Cursor = Cursors.No;
             rdBtnDapAnC.Cursor = Cursors.No;
             rdBtnDapAnD.Cursor = Cursors.No;

         }
        private void loadCacButtonCau(int soButton)
        {
             KryptonButton btn ;
            for(int i=0 ; i<soButton;i++)
            {
                btn = new KryptonButton();
                btn.Values.Text = "Câu " + (i + 1).ToString();
                btn.Tag = i.ToString();
                flowDanhSachCauHoi.Controls.Add(btn);
                btn.Click += btn_Click;
            }
        }

        void btn_Click(object sender, EventArgs e)
        {
            KryptonButton bt = (sender as KryptonButton);
            cauHoiHienTai = Convert.ToInt32(bt.Tag);
            loadCHvaDA(lstCH, lstDA, cauHoiHienTai, lstIntChon[cauHoiHienTai]);
            checkPreAndNextButton();
        }

         private void checkPreAndNextButton()
         {
             if (cauHoiHienTai == 0)
             {
                 btnTruocDo.Visible = false;
                 btnKeTiep.Visible = true;
             }
             else if (cauHoiHienTai == lstCH.Count-1)
             {
                  btnKeTiep.Visible = false;
                 btnTruocDo.Visible = true;
                
             }
             else
             {
                 btnTruocDo.Visible = true;
                 btnKeTiep.Visible = true;
             }

         }
        
         private void usrctrCauHoiVaDapAn_Load(object sender, EventArgs e)
         {
             checkPreAndNextButton();
             loadCacButtonCau(tongSoCau);
         }

         private List<int> newlstIntChon(int tongSoCau)
         {
             List<int> listDAC = new List<int>();
             for (int i=0; i< tongSoCau; i++)
             {
                 listDAC.Add(0);
             }
             return listDAC;
         }

         private void btnTruocDo_Click(object sender, EventArgs e)
         {
             
             cauHoiHienTai--;
             loadCHvaDA(lstCH, lstDA, cauHoiHienTai, lstIntChon[cauHoiHienTai]);
             checkPreAndNextButton();

         }

         private void btnKeTiep_Click(object sender, EventArgs e)
         {
             cauHoiHienTai++;
             loadCHvaDA(lstCH, lstDA, cauHoiHienTai, lstIntChon[cauHoiHienTai]);
             checkPreAndNextButton();
         }
    }
}
