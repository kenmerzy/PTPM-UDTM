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
        List<DapAn> listDapAnDung;
        List<DapAn> listDapAnChon;
        List<int> lstIntChon;
        List<int> lstViTriRadioButtonChon;
        int tongSoCau;
        int cauHoiHienTai;
        public usrctrCauHoiVaDapAn()
        {
            InitializeComponent();
        }
        public usrctrCauHoiVaDapAn(List<CauHoi>listCH ,List<List<DapAn>> listDa, List<DapAn> listDapAnDung)
        {
            InitializeComponent();
            lstCH = new List<CauHoi>();
            lstDA = new List<List<DapAn>>();
            lstCH = listCH;
            lstDA = listDa;
            this.listDapAnDung = listDapAnDung;
            tongSoCau = lstCH.Count;
            lstIntChon = new List<int>();
            lstIntChon = newlstIntChon(tongSoCau);
            lstViTriRadioButtonChon = new List<int>();
            lstViTriRadioButtonChon = createViTriRadioButton(tongSoCau);
            loadCHvaDA(lstCH, lstDA, 0);
            cauHoiHienTai = 0;
            listDapAnChon = new List<DapAn>();
            listDapAnChon =  createDapAnDaChon(tongSoCau);
        }

        
        private void loadCHvaDA(List<CauHoi> lstCH, List<List<DapAn>> lstDA, int position)
        {

            loadCauHoi(lstCH[position],position);
            loadDapAn(lstDA[position]);
        }
        private void loadCHvaDA(List<CauHoi> lstCH, List<List<DapAn>> lstDA, int position,int dapAnChon)
        {
            loadCauHoi(lstCH[position],position);
            loadDapAn(lstDA[position]);
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

        private List<DapAn> createDapAnDaChon(int tongSoCau)
        {
            List <DapAn>listDAC = new List<DapAn>();
            DapAn da;
            for (int i = 0; i < tongSoCau; i++)
            {
                da = new DapAn();
                listDAC.Add(da);
            }
            return listDAC;
        }
        private List<int> createViTriRadioButton(int tongSoCau)
        {
           List<int> listBtnChon = new List<int>();
            for (int i = 0; i < tongSoCau; i++)
            {
                listBtnChon.Add(0);
            }
            return listBtnChon;
        }
        private void checkDapAn(int viTriRadioButton)
        {
            switch (viTriRadioButton)
            {
                case 1:
                    {
                        rdBtnDapAnA.Checked = true;
                        break;
                    }
                case 2:
                    {
                        rdBtnDapAnB.Checked = true;
                        break;
                    }
                case 3:
                    {
                        rdBtnDapAnC.Checked = true;
                        break;
                    }
                case 4:
                    {
                        rdBtnDapAnD.Checked = true;
                        break;
                    }
                case 0:
                    {
                        break;
                    }
                default:
                    break;
            }
        }


         private void loadCauHoi(CauHoi cauHoi, int position)
        {
                lblCauHoi.Text = "Câu " +(position + 1).ToString() + ": " + cauHoi.NoiDung;
        }

         private void loadDapAn(List<DapAn> listDapAn)
         {
             rdBtnDapAnA.Text = "A. "+ listDapAn[0].NoiDung;
             rdBtnDapAnB.Text = "B. " + listDapAn[1].NoiDung;
             rdBtnDapAnC.Text = "C. " + listDapAn[2].NoiDung;
             rdBtnDapAnD.Text = "D. " + listDapAn[3].NoiDung;

             rdBtnDapAnA.Tag = getTag(listDapAn[0]);
             rdBtnDapAnB.Tag = getTag(listDapAn[1]);
             rdBtnDapAnC.Tag = getTag(listDapAn[2]);
             rdBtnDapAnD.Tag = getTag(listDapAn[3]);

         }
         private string getTag(DapAn da)
         {
             if (da.DungSai == true)
                 return "True";
             return "False";
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
            for(int i=0; i<soButton; i++)
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
            checkDapAn(lstViTriRadioButtonChon[cauHoiHienTai]);
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
             checkDapAn(lstViTriRadioButtonChon[cauHoiHienTai]);
         }

         private void btnKeTiep_Click(object sender, EventArgs e)
         {
             cauHoiHienTai++;
             loadCHvaDA(lstCH, lstDA, cauHoiHienTai, lstIntChon[cauHoiHienTai]);
             checkPreAndNextButton();
             checkDapAn(lstViTriRadioButtonChon[cauHoiHienTai]);
         }

         private void rdBtnDapAnA_CheckedChanged(object sender, EventArgs e)
         {
             KryptonRadioButton rd = (sender as KryptonRadioButton);
             if (rd.Checked)
             {
                 listDapAnChon[cauHoiHienTai].NoiDung = rd.Text.Trim();
                
                 switch (rd.Name.ToString())
                 {
                     case "rdBtnDapAnA":
                         {
                             lstViTriRadioButtonChon[cauHoiHienTai] = 1;
                             break;
                         }
                     case "rdBtnDapAnB":
                         {
                             lstViTriRadioButtonChon[cauHoiHienTai] = 2;
                             break;
                         }
                     case "rdBtnDapAnC":
                         {
                             lstViTriRadioButtonChon[cauHoiHienTai] = 3;
                             break;
                         }
                     case "rdBtnDapAnD":
                         {
                             lstViTriRadioButtonChon[cauHoiHienTai] = 4;
                             break;
                         }
                 }
             }
         }
    }
}
