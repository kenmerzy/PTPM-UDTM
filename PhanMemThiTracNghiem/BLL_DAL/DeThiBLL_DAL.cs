using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class DeThiBLL_DAL
    {
        QuanLyDeThiDataContext qldt;

        public DeThiBLL_DAL()
        {
            qldt = new QuanLyDeThiDataContext();
        }

        public List<KyThi> getDeThi()
        {
           var dethis = from kt in qldt.KyThis select kt;
           List<KyThi> asList =  dethis.ToList<KyThi>();
           return asList;
        }
        public List<CauHoi> getCauHois(string maMon)
        {
            var cauhois = from ch in qldt.CauHois where ch.MaMon == maMon select ch;
            List<CauHoi> chList = cauhois.ToList<CauHoi>();
            return chList;
        }

        public List<DapAn> getDapAns(int mach)
        {
            var dapans = from da in qldt.DapAns where da.MaCauHoi == mach select da;
            List<DapAn> daList = dapans.ToList<DapAn>();
            return daList;
        }

        public List<DapAn> getAllDapAn(string maMon)
        {
            var dapans = from da in qldt.DapAns
                                  join ch in qldt.CauHois
                                  on da.MaCauHoi equals ch.MaCauHoi
                                where ch.MaMon == maMon
                                select da;
            List<DapAn> daList = dapans.ToList<DapAn>();
            return daList;
        }

        public List<MonThi> getTenMonThi(string tenMon)
        {
            var laymonthi = from tenmon in qldt.MonThis select tenmon;
            List<MonThi> list = laymonthi.ToList<MonThi>();
            return list;
        }

        public List<TaiKhoan> getTaiKhoan()
        {
            var getTKC = from tk in qldt.TaiKhoans select tk;
            return getTKC.ToList<TaiKhoan>();
        }

        public bool kiemTraTonTaiTenTaiKhoan(string tenDN)
        {
            TaiKhoan tk = qldt.TaiKhoans.Where(t => t.TenDangNhap == tenDN).FirstOrDefault();
            if (tk != null)
                return true;
            return false;
            
        }
        public int luuThongTinDangKy(string hoTen, string tenDangNhap, string matKhau, string email, string SDT, DateTime ngaySinh)
        {
            TaiKhoan tk = new TaiKhoan();
            ThiSinh ts = new ThiSinh();
           
            tk.TenDangNhap = tenDangNhap;
            tk.MatKhau = matKhau;
            tk.NgayTao = DateTime.Now;
            tk.LoaiTaiKhoan = "TS"; 


            ts.TenThiSinh = hoTen;
            ts.Email = email;
            ts.SoDienThoai  =SDT;
            ts.NamSinh = ngaySinh;
            ts.TenDangNhap = tenDangNhap;

            try
            {
                qldt.TaiKhoans.InsertOnSubmit(tk);
                qldt.SubmitChanges();

                qldt.ThiSinhs.InsertOnSubmit(ts);
                qldt.SubmitChanges();
                
                return 1;
            }
            catch
            {
                return 2;
            }
        }

    }
}
