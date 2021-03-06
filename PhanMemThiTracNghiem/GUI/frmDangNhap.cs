﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
using ComponentFactory.Krypton.Toolkit;
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
            this.Close();
        }

        private void lblDangKy_Click(object sender, EventArgs e)
        {
            frmDangKy dk = new frmDangKy();
            dk.ShowDialog();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(txtTenDangNhap.Text) || string.IsNullOrEmpty(txtMatKhau.Text))
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin đăng nhập", "Thông báo", MessageBoxButtons.OK);
            else if (!kiemTraDangNhap())
            {
                return;
            }
            else
            {
                ThiSinh ts = dethi.getThiSinh(txtTenDangNhap.Text);
                frmMain main = new frmMain(ts);
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
                MessageBox.Show("Tên đăng nhập không tồn tại.","Thông báo", MessageBoxButtons.OK);
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
                    MessageBox.Show("Mật khẩu không đúng.","Thông báo",MessageBoxButtons.OK);
                    return false;
                }
            }
        }

        private void txtMatKhau_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnDangNhap_Click(this, new EventArgs());
            }
        }

        private void frmDangNhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult dialog = MessageBox.Show("Bạn chắc chắn muốn thoát ?", "Thoát", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (dialog == DialogResult.Yes)
            {
                e.Cancel = false;
            }
            else
            {
                e.Cancel = true;
            }
        }
        private void Cancel_btn_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }



    }
}
