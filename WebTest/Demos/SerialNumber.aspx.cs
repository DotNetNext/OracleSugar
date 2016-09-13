using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OracleSugar;
using Models;

namespace WebTest.Demos
{
    /// <summary>
    /// 全局配置流水号,插入就不需要定任何逻辑
    /// </summary>
    public partial class SerialNumber : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //设置序列
            OracleConfig.SequenceMapping = new List<PubModel.SequenceModel>()
            {
                  new PubModel.SequenceModel(){ ColumnName="ID", TableName="STUDENT", Value="SEQ_D"} 
            };

            using (SqlSugarClient db = SugarDaoSerNum.GetInstance())//开启数据库连接
            {
                var obj = Convert.ToInt32(db.Insert<STUDENT>(new STUDENT() { }));

                var name = db.Queryable<STUDENT>().Single(it => it.ID == obj).NAME;


                var obj2 = Convert.ToInt32(db.Insert<SCHOOL>(new SCHOOL() { }));

                var name2 = db.Queryable<SCHOOL>().Single(it => it.ID == obj2).NAME;
            }
        }

        /// <summary>
        /// 扩展SqlSugarClient
        /// </summary>
        public class SugarDaoSerNum
        {
            //禁止实例化
            private SugarDaoSerNum()
            {

            }
            /// <summary>
            /// 页面所需要的过滤函数
            /// </summary>
            private static List<PubModel.SerialNumber> _nums = new List<PubModel.SerialNumber>(){
              new PubModel.SerialNumber(){TableName="Student", FieldName="name", GetNumFunc=()=>{ //GetNumFunc在没有事中使用
                  return "stud-"+DateTime.Now.ToString("yyyy-MM-dd");
              }},
                new PubModel.SerialNumber(){TableName="School", FieldName="name",  GetNumFuncWithDb=db=>{ //事务中请使用GetNumFuncWithDb保证同一个DB对象,不然会出现死锁
                  return "ch-"+DateTime.Now.ToString("syyyy-MM-dd");
              }}
            };

            public static SqlSugarClient GetInstance()
            {
                string connection = System.Configuration.ConfigurationManager.ConnectionStrings[@"sqlConn"].ToString(); //这里可以动态根据cookies或session实现多库切换
                var reval = new SqlSugarClient(connection);
                //设置流水号
                reval.SetSerialNumber(_nums);
                return reval;
            }
        }
    }
}