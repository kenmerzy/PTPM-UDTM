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
    public partial class usrctrDeThiMoi : UserControl
    {
        List<KyThi> kt;
        DeThiBLL_DAL dethi;
        TableLayoutPanel layoutT;
        ThiSinh thiSinh;
        usrctrSearch us;

       public usrctrDeThiMoi(TableLayoutPanel layoutT, ThiSinh thiSinh, usrctrSearch us)
        {
            InitializeComponent();
            kt = new List<KyThi>();
            dethi = new DeThiBLL_DAL();
            this.layoutT = layoutT;
            this.thiSinh = thiSinh;
            this.us = us;
            loadDeThiMoi();
        }
        
        private List<KyThi> getDeThiMoi()
        {
            List<KyThi> list = dethi.getDeThiMoi();
            return list;
        }

        public void loadDeThiMoi()
        {
            kt = getDeThiMoi();
            for (int i = 0; i < 3; i++)
            {
                usrctrItemsDeThiMoi item = new usrctrItemsDeThiMoi(kt[i].MaKyThi, kt[i].TenKyThi, kt[i].MoTa, kt[i].TongSoCau.ToString()
                    , kt[i].ThoiGianLamBai.ToString(), kt[i].ThoiGianMoDe.ToString(), layoutT, kt[i].MaMon.ToString(), kt[i].HinhAnh.ToString(), thiSinh.MaThiSinh, us);
                item.Dock = DockStyle.Top;
                flowLayoutPanelDeThi.Controls.Add(item);
                flowLayoutPanelDeThi.SetFlowBreak(item, true);
            }
        }

        private void kryptonLabel1_Click(object sender, EventArgs e)
        {

        }
    }
}
