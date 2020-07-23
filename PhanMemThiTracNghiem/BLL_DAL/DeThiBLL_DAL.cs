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

    }
}
