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
        public usrctrDeThiMoi()
        {
            InitializeComponent();
            kt = new List<KyThi>();
            dethi = new DeThiBLL_DAL();
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
                usrctrItemsDeThiMoi item = new usrctrItemsDeThiMoi(kt[i].TenKyThi, kt[i].ThoiGianMoDe.ToString(), kt[i].HinhAnh.ToString());
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
