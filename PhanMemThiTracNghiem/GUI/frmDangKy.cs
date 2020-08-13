using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
using ComponentFactory.Krypton.Toolkit;
namespace GUI
{
    public partial class frmDangKy : Form
    {
        DeThiBLL_DAL dethi;
        public frmDangKy()
        {
            InitializeComponent();
            dethi = new DeThiBLL_DAL();
        }

        private void lblQuayVeDangNhap_Click(object sender, EventArgs e)
        {
            frmDangNhap dangnhap = new frmDangNhap();
            dangnhap.Show();
            this.Hide();
        }

        private string getGioiTinh()
        {
            foreach (KryptonRadioButton rd in layoutGioiTinh.Controls)
            {
                if (rd.Checked)
                    return rd.Text;
            }
            return null;
        }
        
        public static bool isEmail(string inputEmail)
        {
            inputEmail = inputEmail ?? string.Empty;
            string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex re = new Regex(strRegex);
            if (re.IsMatch(inputEmail))
                return (true);
            else
                return (false);
        }

        public bool kiemTraDangKy()
        {
            if (!kiemTraRong())
                return false;
                
            else
            {
                if (!kiemTraHoTen(txtHoTen.Text))
                    lblLoiHoTen.Visible = true;
                else
                    lblLoiHoTen.Visible = false;
                if (isEmail(txtEmail.Text) == false)
                    lblLoiEmail.Visible = true;
                else
                    lblLoiEmail.Visible = false;
                if (txtSDT.Text.Length != 10)
                    lblLoiSoDienThoai.Visible = true;
                else
                    lblLoiSoDienThoai.Visible = false;
                if (!kiemTraMatKhau(txtMatKhau.Text))
                {
                    if (txtMatKhau.Text.Length < 6)
                        lblLoiMatKhau.Text = "Mật khẩu không được ngắn hơn 6 kí tự !!!";
                    else if (txtMatKhau.Text.Length > 20)
                        lblLoiMatKhau.Text = "Mật khẩu không được quá 20 kí tự !!!";
                    else
                        lblLoiMatKhau.Text = "";
                }
                else
                    lblLoiMatKhau.Text = "Mật khẩu không chứa các kí tự đặc biệt !!!";
                if (dethi.kiemTraTonTaiTenTaiKhoan(txtTenTaiKhoan.Text))
                    lblLoiTenTaiKhoan.Visible = true;
                else
                    lblLoiTenTaiKhoan.Visible = false; ;
                if (!kiemTraNhapLaiMatKhau(txtXacNhanMatKhau.Text))
                    lblLoiXacNhanMatKhau.Visible = true;
                else
                    lblLoiXacNhanMatKhau.Visible = false;

                if (lblLoiHoTen.Visible == true || lblLoiEmail.Visible == true || lblLoiSoDienThoai.Visible == true || lblLoiTenTaiKhoan.Visible == true || lblLoiXacNhanMatKhau.Visible == true || lblLoiMatKhau.Text.Length > 1)
                    return false;
            }
            return true;
        }

        public bool kiemTraRong()
        {
            if (string.IsNullOrEmpty(txtHoTen.Text) || string.IsNullOrEmpty(txtTenTaiKhoan.Text) || string.IsNullOrEmpty(txtMatKhau.Text) || string.IsNullOrEmpty(txtXacNhanMatKhau.Text) || string.IsNullOrEmpty(txtSDT.Text) || string.IsNullOrEmpty(txtEmail.Text))
                return false;
            return true;
        }

        public bool kiemTraSDT(string SDT)
        {
            if (SDT.All(t => char.IsDigit(t)))
                return true;
            return false;
        }

        public bool kiemTraMatKhau(string matKhau)
        {
            if (matKhau.Any(t => !char.IsLetterOrDigit(t)))
                return true;
            return false;
        }

        public bool kiemTraNhapLaiMatKhau(string nhapLaiMatKhau)
        {
            if (nhapLaiMatKhau.Equals(txtMatKhau.Text))
                return true;
            return false;
        }

        public bool kiemTraHoTen(string hoTen)
        {
            string[] ten = hoTen.Split(' ');
            if (ten.Length < 1)
                return false;
            else
            {
                for (int i = 0; i < ten.Length; i++)
                {
                    if (ten[i].Any(t => !char.IsLetter(t)))
                        return false;
                }
                return true;
            }
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            if (kiemTraDangKy())
            {
                int kq = dethi.luuThongTinDangKy(txtHoTen.Text, txtTenTaiKhoan.Text, txtMatKhau.Text, txtEmail.Text, txtSDT.Text, Convert.ToDateTime(dateTimePickerNgaySinh.Value.ToString()),txtDiaChi.Text.Trim(),getGioiTinh());
                if (kq == 1)
                {
                    MessageBox.Show("Đăng ký thành công !", "Thông báo", MessageBoxButtons.OK);
                    frmDangNhap dangnhap = new frmDangNhap();
                    this.Close();
                }
                else
                    MessageBox.Show("Đăng ký không thành công !!!", "Thông báo", MessageBoxButtons.OK);
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void frmDangKy_Load(object sender, EventArgs e)
        {
            txtHoTen.Select();
        }

    }
}
 