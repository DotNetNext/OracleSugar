using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OracleSugar
{
    public static class OracleConfig
    {


        public static string ToOracleTableName(this string value)
        {
            return value;
        }

        internal static bool ToColumnTypeNullable(this object value)
        {
            return value.ToString() == "Y" ? true : false;
        }
        /// <summary>
        /// 设置Number与实体的类型映射
        /// 默认:
        ///   {1,"bool"},
        ///   {3,"byte"},
        ///   {4,"short"},
        ///   {9,"int"},
        ///   {18,"long"}
        /// </summary>
        public static Dictionary<int, string> OracleNumberTypeMapping = new Dictionary<int, string>()
        {
            {1,"bool"},
            {3,"byte"},
            {4,"short"},
            {9,"int"},
            {18,"long"}
        };
        /// <summary>
        /// 设置序列
        /// </summary>
        public static List<PubModel.SequenceModel> SequenceMapping = new List<PubModel.SequenceModel>();
    }
}
