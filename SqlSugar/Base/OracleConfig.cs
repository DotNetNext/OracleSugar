using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using Oracle.ManagedDataAccess.Client;

namespace OracleSugar
{
    public static class OracleConfig
    {


        public static string ToOracleTableName(this string value)
        {
            return value;
        }

        public static object ToOracleParValue(this object value)
        {
            if (value == null)
            {
                return DBNull.Value;
            }
            var type = value.GetType();
            if (type == SqlSugarTool.BoolType)
            {
                return Convert.ToBoolean(value) ? 1 : 0;
            }
            else if (type == SqlSugarTool.GuidType)
            {
                return value.ToString();
            }
            return value;

        }
        internal static void SetParType(string typeName, PropertyInfo prop, OracleParameter par,SqlSugarClient db)
        {
            var isBinary = prop.PropertyType == SqlSugarTool.ByteArrayType;
            if (isBinary)
            {
                var colInfo =db.ClassGenerating.GetTableColumns(db, typeName).Where(it => it.COLUMN_NAME.ObjToString().ToLower() == prop.Name.ToLower()).Single();
                if (colInfo.DATA_TYPE.ObjToString()== "BFILE")
                {
                    par.OracleDbType = OracleDbType.BFile;
                }
                else if (colInfo.DATA_TYPE.ObjToString() == "BLOB")
                {
                    par.OracleDbType = OracleDbType.Blob;
                }
                else if (colInfo.DATA_TYPE.ObjToString() == "RAW")
                {
                    par.OracleDbType = OracleDbType.Raw;
                }
                else if (colInfo.DATA_TYPE.ObjToString() == "LONGRAW")
                {
                    par.OracleDbType = OracleDbType.LongRaw;
                }
            }
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
