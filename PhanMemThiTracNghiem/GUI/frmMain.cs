using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Navigator;
using BLL_DAL;

namespace GUI
{
    public partial class frmMain : Form
    {
        ThiSinh thiSinh;
        DeThiBLL_DAL dethiBLL_DAL;
        public frmMain()
        {
            InitializeComponent();
            dethiBLL_DAL = new DeThiBLL_DAL();
        }
        public frmMain(ThiSinh thiSinh)
        {
            InitializeComponent();
            dethiBLL_DAL = new DeThiBLL_DAL();
            this.thiSinh = thiSinh;
        }


        private void frmMain_Load(object sender, EventArgs e)
        {

            loadDeThi();

            usrctrSearch us = new usrctrSearch(this);
            us.Dock = DockStyle.Top;
            tableLayoutPanel4.Controls.Add(us);
            
            usrctrThanhVien u = new usrctrThanhVien(thiSinh);
            u.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(u);
            flowLayoutRight.SetFlowBreak(u, true);

            usrctrXepHang xh = new usrctrXepHang();
            xh.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(xh);
            flowLayoutRight.SetFlowBreak(xh, true);

            usrctrDeThiMoi dtm = new usrctrDeThiMoi();
            dtm.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(dtm);
            flowLayoutRight.SetFlowBreak(dtm, true);

            usrctrHoTroTrucTuyen httt = new usrctrHoTroTrucTuyen();
            httt.Dock = DockStyle.Top;
            flowLayoutRight.Controls.Add(httt);
            flowLayoutRight.SetFlowBreak(httt, true);
        }

        public void loadDeThi()
        {
            flowLayoutLeft.Controls.Clear();
            try
            {
                List<KyThi> kt = dethiBLL_DAL.getDeThi();
                for (int i = 0; i < kt.Count; i++)
                {
                    usrctrDeThi dt = new usrctrDeThi(kt[i].MaKyThi,kt[i].TenKyThi, kt[i].MoTa, kt[i].TongSoCau.ToString()
                    , kt[i].ThoiGianLamBai.ToString(), kt[i].ThoiGianMoDe.ToString(),layout_Thi,kt[i].MaMon.ToString(),kt[i].HinhAnh.ToString(),thiSinh.MaThiSinh);
                    dt.Dock = DockStyle.Top; 
                    flowLayoutLeft.Controls.Add(dt);
                    flowLayoutLeft.SetFlowBreak(dt, true);
                }
            }
            catch
            {
                MessageBox.Show("Load đề thi Fail");
            }
        }
        public void loadDeThiTheoTen(string ten)
        {
            flowLayoutLeft.Controls.Clear();
            try
            {
                List<KyThi> kt = dethiBLL_DAL.getDeThiTheoTen(ten);
                for (int i = 0; i < kt.Count; i++)
                {
                    usrctrDeThi dt = new usrctrDeThi(kt[i].MaKyThi,kt[i].TenKyThi, kt[i].MoTa, kt[i].TongSoCau.ToString()
                    , kt[i].ThoiGianLamBai.ToString(), kt[i].ThoiGianMoDe.ToString(), layout_Thi, kt[i].MaMon.ToString(), kt[i].HinhAnh.ToString(),thiSinh.MaThiSinh);
                    dt.Dock = DockStyle.Top;
                    flowLayoutLeft.Controls.Add(dt);
                    flowLayoutLeft.SetFlowBreak(dt, true);
                }
            }
            catch
            {
                MessageBox.Show("Load đề thi Fail");
            }
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
                Application.Exit();
        }
    }
}
