using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class usrctrSearch : UserControl
    {
        frmMain frmMain;
        public usrctrSearch()
        {
            InitializeComponent();
        }

        public usrctrSearch(frmMain frmMain)
        {
            InitializeComponent();
            this.frmMain = frmMain;
        }

        private void btnSearch_MouseLeave(object sender, EventArgs e)
        {
            btnSearch.BackColor = Color.CornflowerBlue;
        }

        private void btnSearch_MouseEnter(object sender, EventArgs e)
        {
            btnSearch.BackColor = Color.Goldenrod;
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            frmMain.loadDeThiTheoTen(txtTimKiem.Text);
        }

        private void txtTimKiem_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnSearch_Click(this, new EventArgs());
            }
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                frmMain.loadDeThi();
        }

   







    }
}
