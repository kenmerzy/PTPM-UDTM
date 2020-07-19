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


    }
}
