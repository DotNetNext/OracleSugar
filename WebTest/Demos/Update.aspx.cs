using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebTest.Dao;
using Models;
using OracleSugar;
namespace WebTest.Demo
{
    /// <summary>
    /// 更新
    /// </summary>
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 11;
            //设置序列
            OracleConfig.SequenceMapping = new List<PubModel.SequenceModel>()
            {
                  new PubModel.SequenceModel(){ ColumnName="IDENTITYFIELD", TableName="TESTUPDATECOLUMNS", Value="SEQ_D"} 
            };
            using (var db = SugarDao.GetInstance())
            {
                //指定列更新
                db.Update<SCHOOL>(new { name = "蓝翔14" }, it => it.ID == 14);
                db.Update<SCHOOL, int>(new { name = "蓝翔11 23 12", areaId=2 }, 11, 23, 12);
                db.Update<SCHOOL, string>(new { name = "蓝翔2" }, new string[] { "11", "21" });
                db.Update<SCHOOL>(new { name = "蓝翔2" }, it => it.ID == id);

   

                //支持字段指定列更新，适合动态权限
                var dic =new Dictionary<string, string>();
                dic.Add("name","第十三条");
                dic.Add("areaId", "1");
                db.Update<SCHOOL,int>(dic, 13);
                db.Update<SCHOOL>(dic, it => it.ID == 13);



                //整个实体更新
                db.Update(new SCHOOL { ID = 16, NAME = "蓝翔16", AREAID=1 });
                db.Update<SCHOOL>(new SCHOOL { ID = id, NAME = "蓝翔18", AREAID=2 }, it => it.ID == 18);
                db.Update<SCHOOL>(new SCHOOL() { ID = 11, NAME = "xx" });

                //设置不更新列
                db.DisableUpdateColumns = new string[] { "CreateTime" };//设置CreateTime不更新

                TESTUPDATECOLUMNS updObj = new TESTUPDATECOLUMNS()
                {
                    VGUID = "542b5a27-6984-47c7-a8ee-359e483c8470",
                    NAME = "xx",
                    NAME2 = "xx2",
                    IDENTITYFIELD = 1,
                    CREATETIME = null
                };

                //CreateTime将不会被更新
                db.Update(updObj);
                //以前实现这种更新需要用指定列的方式实现，现在就简单多了。
               
            }

        }
    }
}