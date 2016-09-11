using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OracleSugar
{
    public static class OracleTool
    {


        public static string ToOracleTableName(this string value)
        {
            return value;
        }

        internal static bool ToColumnTypeNullable(this object value)
        {
            return value.ToString() == "Y" ? true : false;
        }

        public static Dictionary<int,string> OracleDataTypeMapping =new Dictionary<int,string>()
        {
            {1,"bool"},
            {3,"byte"},
            {4,"short"},
            {9,"int"},
            {18,"long"}
        };
    }
}
