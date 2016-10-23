using System;
using System.Collections.Generic;
using System.Linq;
using OracleSugar;
namespace NewTest.Dao
{
    /// <summary>
    /// SqlSugar
    /// </summary>
    public class SugarDao
    {
        //禁止实例化
        private SugarDao()
        {

        }
        public static string ConnectionString
        {
            get
            {
                string reval = "server=localhost/orcl;User ID=system;Password=JHL52771jhl;"; //这里可以动态根据cookies或session实现多库切换
                return reval;
            }
        }
        public static SqlSugarClient GetInstance()
        {
            var db = new SqlSugarClient(ConnectionString);
            db.IsEnableLogEvent = true;//启用日志事件
            db.LogEventStarting = (sql, par) => { Console.WriteLine(sql + " " + par+"\r\n"); };
            return db;
        }
    }
}