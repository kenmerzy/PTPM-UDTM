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
    public partial class usrctrThanhVienChuaDangNhap : UserControl
    {
        DeThiBLL_DAL dethi;
        string loaiTaiKhoan;
        public usrctrThanhVienChuaDangNhap()
        {
            InitializeComponent();
            dethi = new DeThiBLL_DAL();
        }

        private void btnThietLapLai_Click(object sender, EventArgs e)
        {
            txtTenDangNhap.Clear();
            txtMatKhau.Clear();
            txtTenDangNhap.Select();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (kiemTraDangNhap())
            {
                MessageBox.Show("Chúc mừng bạn đã đăng nhập thành công");
                this.Dispose();
            }
            else
                return;
                //MessageBox.Show("Đăng nhập không thành công !!!");
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            frmDangKy dk = new frmDangKy();
            dk.Show();
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
