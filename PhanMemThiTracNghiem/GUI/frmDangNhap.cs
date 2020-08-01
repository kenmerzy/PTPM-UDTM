using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
namespace GUI
{
    public partial class frmDangNhap : Form
    {
        DeThiBLL_DAL dethi;
        string loaiTaiKhoan;
        public frmDangNhap()
        {
            InitializeComponent();
            dethi = new DeThiBLL_DAL();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void lblDangKy_Click(object sender, EventArgs e)
        {
            frmDangKy dk = new frmDangKy();
            dk.ShowDialog();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            List<TaiKhoan> ttcn = dethi.getTaiKhoan();
            if (string.IsNullOrEmpty(txtTenDangNhap.Text) || string.IsNullOrEmpty(txtMatKhau.Text))
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin đăng nhập");
            else if (!kiemTraDangNhap())
            {
                return;
            }
            else
            {
                frmMain main = new frmMain();
                main.Show();
                this.Hide();
            }
        }
        public bool kiemTraDangNhap()
        {
            List<TaiKhoan> listTK = dethi.getTaiKhoan();
            string tendn = txtTenDangNhap.Text;
            string matkhau = txtMatKhau.Text;
            TaiKhoan taikhoan = null;
            foreach (TaiKhoan tk in listTK)
            {
                if (tk.TenDangNhap.Equals(tendn))
                {
                    taikhoan = new TaiKhoan();
                    taikhoan = tk;
                    break;
                }
            }
            if (taikhoan == null)
            {
                MessageBox.Show("Tên đăng nhập không tồn tại.");
                return false;
            }
            else
            {
                if (taikhoan.MatKhau.Equals(matkhau))
                {
                    loaiTaiKhoan = taikhoan.LoaiTaiKhoan;
                    return true;
                }
                else
                {
                    MessageBox.Show("Mật khẩu không đúng.");
                    return false;
                }
            }
        }

    }
}
