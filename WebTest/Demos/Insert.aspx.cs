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
    public partial class Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //设置序列
            OracleConfig.SequenceMapping = new List<PubModel.SequenceModel>()
            {
                  new PubModel.SequenceModel(){ ColumnName="ID", TableName="STUDENT", Value="SEQ_D"} 
            };
            using (SqlSugarClient db = SugarDao.GetInstance())//开启数据库连接
            {


                STUDENT s = new STUDENT()
                {
                    NAME = "张" + new Random().Next(1, int.MaxValue)
                };

                db.Insert(s); //插入一条记录 (有主键也好，没主键也好，有自增列也好都可以插进去)


                List<STUDENT> list = new List<STUDENT>()
                {
                     new STUDENT()
                {
                     NAME="张"+new Random().Next(1,int.MaxValue)
                },
                 new STUDENT()
                {
                     NAME="张"+new Random().Next(1,int.MaxValue)
                }
                };

                db.InsertRange(list); //批量插入
            }
        }
    }
}