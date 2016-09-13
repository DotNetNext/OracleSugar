using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OracleSugar;
using WebTest.Dao;
using OracleSugar;
namespace WebTest.Demos
{
    //支持枚举
    public partial class EnumType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //设置序列,程序起动时设置一次便可
            OracleConfig.SequenceMapping = new List<PubModel.SequenceModel>()
            {
                  new PubModel.SequenceModel(){ ColumnName="ID", TableName="STUDENT", Value="SEQ_D"} 
            };
            using (SqlSugarClient db = SugarDao.GetInstance())
            {
                var stuList= db.Queryable<STUDENT>().ToList();
                db.Insert<STUDENT>(new STUDENT() {  NAME="哈哈",SCH_ID = SchoolEnum.北大青鸟 });
                db.Update<STUDENT>(new STUDENT() { SCH_ID = SchoolEnum.it清华, ID = 11 });
                var stuList2 = db.Queryable<STUDENT>().Where(it => it.SCH_ID == SchoolEnum.全智).ToList();
            }
        }


        public class STUDENT
        {

            /// <summary>
            /// 说明:- 
            /// 默认:- 
            /// 可空:False 
            /// </summary>
              public int ID { get; set; }

            /// <summary>
            /// 说明:- 
            /// 默认:- 
            /// 可空:True 
            /// </summary>
            public string NAME { get; set; }

            /// <summary>
            /// 说明:- 
            /// 默认:- 
            /// 可空:False 
            /// </summary>
            public SchoolEnum SCH_ID { get; set; }

            /// <summary>
            /// 说明:- 
            /// 默认:- 
            /// 可空:True 
            /// </summary>
            public string SEX { get; set; }

            /// <summary>
            /// 说明:- 
            /// 默认:- 
            /// 可空:False 
            /// </summary>
            public bool ISOK { get; set; }

        }

        public enum SchoolEnum
        {
            北大青鸟 = 1,
            it清华 = 2,
            全智=3
        }
    }
}