using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OracleSugar;
using WebTest.Dao;
using Models;

namespace WebTest.Demos
{
    /// <summary>
    /// 插入海量数据
    /// </summary>
    public partial class InsertBigData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlSugarClient db = SugarDao.GetInstance())//开启数据库连接
            {
                var list = new List<STUDENT>()
                {
                    new STUDENT(){ ISOK=true, NAME="张三",  SCH_ID=1, SEX="男"},
                    new STUDENT(){ ISOK=false, NAME="sun",  SCH_ID=1, SEX="女"},
                    new STUDENT(){ ISOK=true, NAME="mama",  SCH_ID=1, SEX="gril"}
                };
                db.SqlBulkCopy<STUDENT>(list);
            }
        }
    }
}