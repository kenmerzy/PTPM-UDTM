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

namespace GUI
{
    public partial class frmDangKy : Form
    {
        public frmDangKy()
        {
            InitializeComponent();
        }

        private void lblQuayVeDangNhap_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtHoTen_TextChanged(object sender, EventArgs e)
        {
            

        }

        private void txtEmail_TextChanged(object sender, EventArgs e)
        {
            
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

        public void kiemTraHoTen(string hoten)
        {
           
        }

        private void btnDangKy_Click(object sender, EventArgs e)
        {
            if (txtHoTen.Text == "" && txtTenTaiKhoan.Text == "" && txtMatKhau.Text == "" && txtXacNhanMatKhau.Text == "" && txtEmail.Text == "" && txtSDT.Text == "")
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin !!!");
            else
            {
                if (isEmail(txtEmail.Text))
                {
                    if (kiemTraSoDienThoai(txtSDT.Text))
                    {

                    }
                    else
                        lblLoiSoDienThoai.Text = "Số điện thoại không được bỏ trống !!!";
                }
                else
                    lblLoiEmail.Text = "Email chưa đúng định dạng. Ví dụ:Khanh@gmail.com!!!";
            }
        }


        public bool kiemTraSoDienThoai(string soDienThoai)
        {
            if (soDienThoai.Length <= 0 || soDienThoai.All(t => char.IsLetter(t)))
                return false;
            return true;
        }


     
    }
}
