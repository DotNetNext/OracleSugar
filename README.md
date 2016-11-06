#Contact information

Email 610262374@qq.com

QQ Group 225982985

Blog http://www.cnblogs.com/sunkaixuan


#All versions


ASP.NET 4.0+ MSSQL   https://github.com/sunkaixuan/SqlSugar

ASP.NET CORE MSSQL   https://github.com/sunkaixuan/ASP_NET_CORE_ORM_SqlSugar

ASP.NET 4.0+ MYSQL   https://github.com/sunkaixuan/MySqlSugar

ASP.NET CORE MYSQL   https://github.com/sunkaixuan/ASP_NET_CORE_ORM_MySqlSugar

ASP.NET 4.0+ Sqlite  https://github.com/sunkaixuan/SqliteSugar

ASP.NET CORE Sqlite  https://github.com/sunkaixuan/ASP_NET_CORE_ORM_SqliteSugar

ASP.NET 4.0+ ORACLE  https://github.com/sunkaixuan/OracleSugar

ASP.NET CORE ORACLE  https://github.com/sunkaixuan/ASP_NET_CORE_ORM_OracleSugar



# OracleSugar一款高性能ORM框架

<h3 id="h3-1-"><a name="1. 设置生成实体的数值类型" class="reference-link"></a><span class="header-link octicon octicon-link"></span>1. 设置生成实体的数值类型</h3><table>
<thead>
<tr>
<th>number长度</th>
<th>实体类型</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>bool</td>
</tr>
<tr>
<td>3</td>
<td>byte</td>
</tr>
<tr>
<td>4</td>
<td>short</td>
</tr>
<tr>
<td>9</td>
<td>int</td>
</tr>
<tr>
<td>18</td>
<td>long</td>
</tr>
</tbody>
</table>
<p>修改设置</p>
<pre><code class="lang-csharp">OracleConfig.OracleNumberTypeMapping =new Dictionary&lt;int, string&gt;()
        {
            {1,"bool"},
            {3,"byte"},
            {4,"short"},
            {9,"int"},
            {18,"long"}
        };
</code></pre>
<h3 id="h3-2-"><a name="2. 数据连接设置" class="reference-link"></a><span class="header-link octicon octicon-link"></span>2. 数据连接设置</h3><pre><code class="lang-csharp">using(var db = new SqlSugarClient(ConnectionString)){

    //use object
    var list=db.Queryable&lt;T&gt;().ToList();

}
</code></pre>
<h3 id="h3-3-sql-"><a name="3.设置序列（相当于SQL里面的自增列）" class="reference-link"></a><span class="header-link octicon octicon-link"></span>3.设置序列（相当于SQL里面的自增列）</h3><pre><code class="lang-csharp">  OracleConfig.SequenceMapping = new List&lt;SequenceModel&gt;()
            {
                  new SequenceModel(){ ColumnName="ID", TableName="STUDENT", Value="SEQ"/*序列的名称*/} //可以多个
            };
</code></pre>
<h3 id="h3-4-"><a name="4.查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>4.查询</h3><h4 id="h4-4-1-"><a name="4.1 拉姆达查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>4.1 拉姆达查询</h4><pre><code class="lang-csharp">var test = db.Queryable&lt;Models.Test&gt;().Where(it =&gt; it.C_BOB != null).ToList();

//查询所有
var student = db.Queryable&lt;Student&gt;().ToList();
var studentDynamic = db.Queryable&lt;Student&gt;().ToDynamic();
var studentJson = db.Queryable&lt;Student&gt;().ToJson();


//查询单条
var single = db.Queryable&lt;Student&gt;().Single(c =&gt; c.id == 1);
//查询单条根据主键
var singleByPk = db.Queryable&lt;Student&gt;().InSingle(1);
//查询单条没有记录返回空对象
var singleOrDefault = db.Queryable&lt;Student&gt;().SingleOrDefault(c =&gt; c.id == 11111111);
//查询单条没有记录返回空对象
var single2 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id == 1).SingleOrDefault();

//查询第一条
var first = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id == 1).First();
var first2 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id == 1).FirstOrDefault();

//取11-20条
var page1 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 10).OrderBy(it =&gt; it.id).Skip(10).Take(10).ToList();

//取11-20条  等于 Skip(pageIndex-1)*pageSize).Take(pageSize) 等于  between (pageIndex-1)*pageSize and  pageIndex*pageSize
var page2 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 10).OrderBy(it =&gt; it.id).ToPageList(2, 10);

//查询条数
var count = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 10).Count();

//从第2条开始以后取所有
var skip = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 10).OrderBy(it =&gt; it.id).Skip(2).ToList();

//取前2条
var take = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 10).OrderBy(it =&gt; it.id).Take(2).ToList();

//Not like 
string conval = "a";
var notLike = db.Queryable&lt;Student&gt;().Where(c =&gt; !c.name.Contains(conval.ToString())).ToList();

//Like
conval = "三";
var like = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name.Contains(conval)).ToList();

//支持字符串Where 让你解决，更复杂的查询
var student12 = db.Queryable&lt;Student&gt;().Where(c =&gt; "a" == "a").Where("id&gt;:id", new { id = 1 }).ToList();
var student13 = db.Queryable&lt;Student&gt;().Where(c =&gt; "a" == "a").Where("id&gt;100 and id in( select 1 from dual )").ToList();


//存在记录反回true，则否返回false
bool isAny100 = db.Queryable&lt;Student&gt;().Any(c =&gt; c.id == 100);
bool isAny1 = db.Queryable&lt;Student&gt;().Any(c =&gt; c.id == 1);


//获取最大Id
object maxId = db.Queryable&lt;Student&gt;().Max(it =&gt; it.id);
int maxId1 = db.Queryable&lt;Student&gt;().Max(it =&gt; it.id).ObjToInt();//拉姆达
int maxId2 = db.Queryable&lt;Student&gt;().Max&lt;int&gt;("id"); //字符串写法

//获取最小
int minId1 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 0).Min(it =&gt; it.id).ObjToInt();//拉姆达
int minId2 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &gt; 0).Min&lt;int&gt;("id");//字符串写法


//order By 
var orderList = db.Queryable&lt;Student&gt;().OrderBy("id desc,name asc").ToList();//字符串支持多个排序
//可以多个order by表达示
var order2List = db.Queryable&lt;Student&gt;().OrderBy(it =&gt; it.name).OrderBy(it =&gt; it.id, OrderByType.desc).ToList(); // order by name as ,order by id desc

//In
var intArray = new[] { "5", "2", "3" };
var intList = intArray.ToList();
var listnew = db.Queryable&lt;Student&gt;().Where(it =&gt; intArray.Contains(it.name)).ToList();
var list0 = db.Queryable&lt;Student&gt;().In(it =&gt; it.id, 1, 2, 3).ToList();
var list1 = db.Queryable&lt;Student&gt;().In(it =&gt; it.id, intArray).ToList();
var list2 = db.Queryable&lt;Student&gt;().In("id", intArray).ToList();
var list3 = db.Queryable&lt;Student&gt;().In(it =&gt; it.id, intList).ToList();
var list4 = db.Queryable&lt;Student&gt;().In("id", intList).ToList();
var list6 = db.Queryable&lt;Student&gt;().In(intList).ToList();//不设置字段默认主键

//分组查询
var list7 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &lt; 20).GroupBy(it =&gt; it.sex).Select("sex,count(*) Count").ToDynamic();
var list8 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &lt; 20).GroupBy(it =&gt; it.sex).GroupBy(it =&gt; it.id).Select("id,sex,count(*) Count").ToDynamic();
List&lt;StudentGroup&gt; list9 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &lt; 20).GroupBy(it =&gt; it.sex).Select&lt;StudentGroup&gt;("Sex,count(*) Count").ToList();
List&lt;StudentGroup&gt; list10 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id &lt; 20).GroupBy("sex").Select&lt;StudentGroup&gt;("Sex,count(*) Count").ToList();
//SELECT Sex,Count=count(*)  FROM Student  WHERE 1=1  AND  (id &lt; 20)    GROUP BY Sex --生成结果



//2表关联查询
var jList = db.Queryable&lt;Student&gt;()
    .JoinTable&lt;School&gt;((s1, s2) =&gt; s1.sch_id == s2.id) //默认left join
    .Where&lt;School&gt;((s1, s2) =&gt; s1.id == 1)
    .Select("s1.*,s2.name as schName")
    .ToDynamic();

/*等于同于
                 SELECT s1.*,s2.name as schName 
                 FROM [Student]  s1 
                 LEFT JOIN [School]  s2 ON  s1.sch_id  = s2.id 
                 WHERE  s1.id  = 1 */

//2表关联查询并分页
var jList2 = db.Queryable&lt;Student&gt;()
    .JoinTable&lt;School&gt;((s1, s2) =&gt; s1.sch_id == s2.id) //默认left join
    //如果要用inner join这么写
    //.JoinTable&lt;School&gt;((s1, s2) =&gt; s1.sch_id == s2.id ,JoinType.INNER)
    .Where&lt;School&gt;((s1, s2) =&gt; s1.id &gt; 1)
    .OrderBy(s1 =&gt; s1.name)
    .Skip(10)
    .Take(20)
    .Select("s1.*,s2.name as schName")
    .ToDynamic();

//3表查询并分页
var jList3 = db.Queryable&lt;Student&gt;()
    .JoinTable&lt;School&gt;((s1, s2) =&gt; s1.sch_id == s2.id) // left join  School s2  on s1.id=s2.id
    .JoinTable&lt;School&gt;((s1, s3) =&gt; s1.sch_id == s3.id) // left join  School s3  on s1.id=s3.id
    .Where&lt;School&gt;((s1, s2) =&gt; s1.id &gt; 1)  // where s1.id&gt;1
    .Where(s1 =&gt; s1.id &gt; 0)
    .OrderBy&lt;School&gt;((s1, s2) =&gt; s1.id) //order by s1.id 多个order可以  .oderBy().orderby 叠加 
    .Skip(10)
    .Take(20)
    .Select("s1.*,s2.name as schName,s3.name as schName2")//select目前只支持这种写法
    .ToDynamic();


//上面的方式都是与第一张表join，第三张表想与第二张表join写法如下
List&lt;V_Student&gt; jList4 =
    db.Queryable&lt;Student&gt;()
    .JoinTable&lt;School&gt;((s1, s2) =&gt; s1.sch_id == s2.id) // left join  School s2  on s1.id=s2.id
    .JoinTable&lt;School, Area&gt;((s1, s2, a1) =&gt; a1.id == s2.AreaId)// left join  Area a1  on a1.id=s2.AreaId  第三张表与第二张表关联
        .JoinTable&lt;Area, School&gt;((s1, a1, s3) =&gt; a1.id == s3.AreaId)// left join  School s3  on a1.id=s3.AreaId  第四第表第三张表关联
            .JoinTable&lt;School&gt;((s1, s4) =&gt; s1.sch_id == s4.id) // left join  School s2  on s1.id=s4.id
            .Select&lt;School, Area, V_Student&gt;((s1, s2, a1) =&gt; new V_Student { id = s1.id, name = s1.name, SchoolName = s2.name, AreaName = a1.name }).ToList();

//等同于
//SELECT id = s1.id, name = s1.name, SchoolName = s2.name, AreaName = a1.name  
//FROM [Student]   s1 
//LEFT JOIN School  s2 ON  ( s1.sch_id  = s2.id )    
//LEFT JOIN Area  a1 ON  ( a1.id  = s2.AreaId )     //第三张表与第二张表关联
//LEFT JOIN School  s3 ON  ( a1.id  = s3.AreaId )   //第四张表与第三张表关联
//LEFT JOIN School  s4 ON  ( s1.sch_id  = s4.id )    
//WHERE 1=1    


//Join子查询语句加分页的写法
var childQuery = db.Queryable&lt;Area&gt;().Where("id=:id").Select(it =&gt; new { id = it.id }).ToSql();//创建子查询SQL
string childTableName =SqlSugarTool.PackagingSQL(childQuery.Key);//将SQL语句用()包成表
var queryable = db.Queryable&lt;Student&gt;()
    .JoinTable&lt;School&gt;((s1, s2) =&gt; s1.sch_id == s2.id)  //LEFT JOIN School  s2 ON  ( s1.sch_id  = s2.id )  
    .JoinTable(childTableName, "a1", "a1.id=s2.areaid", new { id = 1 }, JoinType.INNER) //INNER JOIN (SELECT *  FROM [Area]   WHERE 1=1  AND id=@id   ) a1 ON a1.id=s2.areaid
    .OrderBy(s1 =&gt; s1.id);

var list = queryable.Select&lt;School, Area, V_Student&gt;((s1, s2, a1) =&gt; new V_Student { id = s1.id, name = s1.name, SchoolName = s2.name, AreaName = a1.name })
    .ToPageList(0, 200);
var count2 = queryable.Count();


//拼接例子
var queryable2 = db.Queryable&lt;Student&gt;().Where(it =&gt; true);
if (maxId.ObjToInt() == 1)
{
    queryable2.Where(it =&gt; it.id == 1);
}
else
{
    queryable2.Where(it =&gt; it.id == 2);
}
var listJoin = queryable2.ToList();


//queryable和SqlSugarClient解耦
var par = new Queryable&lt;Student&gt;().Where(it =&gt; it.id == 1);//声名没有connection对象的Queryable
par.DB = db;
var listPar = par.ToList();


//查看生成的sql和参数
var id = 1;
var sqlAndPars = db.Queryable&lt;Student&gt;().Where(it =&gt; it.id == id).OrderBy(it =&gt; it.id).ToSql();



//拉姆达支持的函数操作
var par1 = "2015-1-1"; var par2 = "   我 有空格A, ";
var r1 = db.Queryable&lt;Student&gt;().Where(it =&gt; it.name == par1.ObjToString()).ToList(); //ObjToString会将null转转成""
var r2 = db.Queryable&lt;InsertTest&gt;().Where(it =&gt; it.d1 == par1.ObjToDate()).ToList();
var r3 = db.Queryable&lt;InsertTest&gt;().Where(it =&gt; it.id == 1.ObjToInt()).ToList();//ObjToInt会将null转转成0
var r4 = db.Queryable&lt;InsertTest&gt;().Where(it =&gt; it.id == 2.ObjToDecimal()).ToList();
var r5 = db.Queryable&lt;InsertTest&gt;().Where(it =&gt; it.id == 3.ObjToMoney()).ToList();
var r6 = db.Queryable&lt;InsertTest&gt;().Where(it =&gt; it.v1 == par2.Trim()).ToList();
var convert1 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name == "a".ToString()).ToList();
var convert2 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.id == Convert.ToInt32("1")).ToList();
var convert3 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name == par2.ToLower()).ToList();
var convert4 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name == par2.ToUpper()).ToList();
var convert5= db.Queryable&lt;Student&gt;().Where(c =&gt; DateTime.Now &gt; Convert.ToDateTime("2015-1-1")).ToList();
var c1 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name.Contains("a")).ToList();
var c2 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name.StartsWith("a")).ToList();
var c3 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name.EndsWith("a")).ToList();
var c4 = db.Queryable&lt;Student&gt;().Where(c =&gt; !string.IsNullOrEmpty(c.name)).ToList();
var c5 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name.Equals("小杰")).ToList();
var c6 = db.Queryable&lt;Student&gt;().Where(c =&gt; c.name.Length &gt; 4).ToList();
var time = db.Queryable&lt;InsertTest&gt;().Where(c =&gt; c.d1&gt;DateTime.Now.AddDays(1)).ToList();
var time2 = db.Queryable&lt;InsertTest&gt;().Where(c =&gt; c.d1 &gt; DateTime.Now.AddYears(1)).ToList();
var time3 = db.Queryable&lt;InsertTest&gt;().Where(c =&gt; c.d1 &gt; DateTime.Now.AddMonths(1)).ToList();
</code></pre>
<h4 id="h4-4-2-sql-"><a name="4.2 原生SQL的支持" class="reference-link"></a><span class="header-link octicon octicon-link"></span>4.2 原生SQL的支持</h4><pre><code class="lang-csharp">//转成list
List&lt;Student&gt; list1 = db.SqlQuery&lt;Student&gt;("select * from Student");
//转成list带参
List&lt;Student&gt; list2 = db.SqlQuery&lt;Student&gt;("select * from Student where id=:id", new { id = 1 });
//转成dynamic
dynamic list3 = db.SqlQueryDynamic("select * from student");
//转成json
string list4 = db.SqlQueryJson("select * from student");
//返回int
var list5 = db.SqlQuery&lt;int&gt;("select id from Student where rownum&lt;=1").SingleOrDefault();
//反回键值
Dictionary&lt;string, string&gt; list6 = db.SqlQuery&lt;KeyValuePair&lt;string, string&gt;&gt;("select id,name from Student").ToDictionary(it =&gt; it.Key, it =&gt; it.Value);
//反回List&lt;string[]&gt;
var list7 = db.SqlQuery&lt;string[]&gt;("select   id,name from Student where rownum&lt;=1").SingleOrDefault();
//存储过程
// var spResult = db.SqlQuery&lt;School&gt;("exec sp_school @p1,@p2", new { p1 = 1, p2 = 2 }); 现是SQL写i法请成ORACLE写法

//存储过程加Output 
//var pars = SqlSugarTool.GetParameters(new { p1 = 1,p2=0 }); //将匿名对象转成SqlParameter
//db.IsClearParameters = false;//禁止清除参数
//pars[1].Direction = ParameterDirection.Output; //将p2设为 output
//var spResult2 = db.SqlQuery&lt;School&gt;("exec sp_school @p1,@p2 output", pars);现是SQL写i法请成ORACLE写法
//db.IsClearParameters = true;//启用清除参数
//var outPutValue = pars[1].Value;//获取output @p2的值


////存储过程优化操作
//var pars2 = SqlSugarTool.GetParameters(new { p1 = 1, p2 = 0 }); //将匿名对象转成SqlParameter
//db.CommandType = CommandType.StoredProcedure;//指定为存储过程可比上面少写EXEC和参数
//var spResult3 = db.SqlQuery&lt;School&gt;("sp_school", pars2);现是SQL写i法请成ORACLE写法
//db.CommandType = CommandType.Text;//还原回默认


//获取第一行第一列的值
string v1 = db.GetString("select '张三' as name from dual");
int v2 = db.GetInt("select 1 as name  from dual");
double v3 = db.GetDouble("select 1 as name  from dual");
decimal v4 = db.GetDecimal("select 1 as name  from dual");
</code></pre>
<h4 id="h4-4-3-sql-"><a name="4.3 Sql拼接器" class="reference-link"></a><span class="header-link octicon octicon-link"></span>4.3 Sql拼接器</h4><pre><code class="lang-csharp">//---------Sqlable,创建多表查询---------//

//多表查询
List&lt;School&gt; dataList = db.Sqlable()
    .From("school", "s")
    .Join("student", "st", "st.id", "s.id", JoinType.INNER)
    .Join("student", "st2", "st2.id", "st.id", JoinType.LEFT)
    .Where("s.id&gt;100 and s.id&lt;:id")
    .Where("1=1")//可以多个WHERE
    .OrderBy("s.id")
    .SelectToList&lt;School/*新的Model我这里没有所以写的School*/&gt;("st.*", new { id = 1 });

//多表分页
List&lt;School&gt; dataPageList = db.Sqlable()
    .From("school", "s")
    .Join("student", "st", "st.id", "s.id", JoinType.INNER)
    .Join("student", "st2", "st2.id", "st.id", JoinType.LEFT)
    .Where("s.id&gt;100 and s.id&lt;100")
    .SelectToPageList&lt;School&gt;("st.*", "s.id", 1, 10);

//多表分页WHERE加子查询
List&lt;School&gt; dataPageList2 = db.Sqlable()
    .From("school", "s")
    .Join("student", "st", "st.id", "s.id", JoinType.INNER)
    .Join("student", "st2", "st2.id", "st.id", JoinType.LEFT)
    .Where("s.id&gt;100 and s.id&lt;100 and s.id in (select 1  from dual )" /*这里面写子查询都可以*/)
    .SelectToPageList&lt;School&gt;("st.*", "s.id", 1, 10);



//--------转成List Dynmaic 或者 Json-----//

//不分页
var list1 = db.Sqlable().From("student", "s").Join("school", "l", "s.sch_id", "l.id and l.id=:id", JoinType.INNER).SelectToDynamic("*", new { id = 1 });
var list2 = db.Sqlable().From("student", "s").Join("school", "l", "s.sch_id", "l.id and l.id=:id", JoinType.INNER).SelectToJson("*", new { id = 1 });
var list3 = db.Sqlable().From("student", "s").Join("school", "l", "s.sch_id", "l.id and l.id=:id", JoinType.INNER).SelectToDataTable("*", new { id = 1 });

//分页
var list4 = db.Sqlable().From("student", "s").Join("school", "l", "s.sch_id", "l.id and l.id=:id", JoinType.INNER).SelectToPageDynamic("s.*", "l.id", 1, 10, new { id = 1 });
var list5 = db.Sqlable().From("student", "s").Join("school", "l", "s.sch_id", "l.id and l.id=:id", JoinType.INNER).SelectToPageTable("s.*", "l.id", 1, 10, new { id = 1 });
var list6 = db.Sqlable().From("student", "s").Join("school", "l", "s.sch_id", "l.id and l.id=:id", JoinType.INNER).SelectToPageDynamic("s.*", "l.id", 1, 10, new { id = 1 });


//--------拼接-----//
Sqlable sable = db.Sqlable().From&lt;Student&gt;("s").Join&lt;School&gt;("l", "s.sch_id", "l.id", JoinType.INNER);
string name = "a";
int id = 1;
if (!string.IsNullOrEmpty(name))
{
    sable = sable.Where("s.name=:name");
}
if (!string.IsNullOrEmpty(name))
{
    sable = sable.Where("s.id=:id or s.id=100");
}
if (id &gt; 0)
{
    sable = sable.Where("l.id in (select  id from school where rownum&lt;10)");//where加子查询
}
var pars = new { id = id, name = name };
int pageCount = sable.Count(pars);
var list7 = sable.SelectToPageList&lt;Student&gt;("s.*", "l.id desc", 1, 20, pars);
</code></pre>
<h3 id="h3-5-"><a name="5.插入" class="reference-link"></a><span class="header-link octicon octicon-link"></span>5.插入</h3><pre><code class="lang-csharp">db.Insert(GetInsertItem()); //插入一条记录 (有主键也好，没主键也好，有自增列也好都可以插进去)


db.InsertRange(GetInsertList()); //批量插入 支持（别名表等功能）


db.SqlBulkCopy(GetInsertList()); //批量插入 适合海量数据插入



//设置不插入列
db.DisableInsertColumns = new string[] { "sex" };//sex列将不会插入值
Student s = new Student()
{
    name = "张" + new Random().Next(1, int.MaxValue),
    sex = "gril"
};

var id = db.Insert(s); //插入

//查询刚插入的sex是否有值
var sex = db.Queryable&lt;Student&gt;().Single(it =&gt; it.id == id.ObjToInt()).sex;//无值
var name = db.Queryable&lt;Student&gt;().Single(it =&gt; it.id == id.ObjToInt()).name;//有值


//SqlBulkCopy同样支持不挺入列设置
db.SqlBulkCopy(GetInsertList());
</code></pre>
<h3 id="h3-6-"><a name="6.更新" class="reference-link"></a><span class="header-link octicon octicon-link"></span>6.更新</h3><pre><code class="lang-csharp">//指定列更新
db.Update&lt;School&gt;(new { name = "蓝翔14" }, it =&gt; it.id == 14); //只更新name列
db.Update&lt;School, int&gt;(new { name = "蓝翔11 23 12", areaId = 2 }, 11, 23, 12);
db.Update&lt;School, string&gt;(new { name = "蓝翔2" }, new string[] { "11", "21" });
db.Update&lt;School&gt;(new { name = "蓝翔2" }, it =&gt; it.id == 100);
var array=new int[]{1,2,3};
db.Update&lt;School&gt;(new { name = "蓝翔2" }, it =&gt; array.Contains(it.id));// id in 1,2,3


//支持字典更新，适合动态权限
var dic = new Dictionary&lt;string, string&gt;();
dic.Add("name", "第十三条");
dic.Add("areaId", "1");
db.Update&lt;School, int&gt;(dic, 13);


//整个实体更新
db.Update(new School { id = 16, name = "蓝翔16", AreaId = 1 });
db.Update&lt;School&gt;(new School { id = 12, name = "蓝翔12", AreaId = 2 }, it =&gt; it.id == 18);
db.Update&lt;School&gt;(new School() { id = 11, name = "青鸟11" });

//设置不更新列
db.DisableUpdateColumns = new string[] { "CreateTime" };//设置CreateTime不更新

TestUpdateColumns updObj = new TestUpdateColumns()
{
    VGUID = Guid.Parse("542b5a27-6984-47c7-a8ee-359e483c8470"),
    Name = "xx",
    Name2 = "xx2",
    IdentityField = 0,
    CreateTime = null
};

//CreateTime将不会被更新
db.Update(updObj);
//以前实现这种更新需要用指定列的方式实现，现在就简单多了。



//批量更新   数据量小时建议使用
var updateResult = db.UpdateRange(GetUpdateList());

//批量更新  数据量大时建议使用
var updateResult2 = db.SqlBulkReplace(GetUpdateList2());
</code></pre>
<h3 id="h3-7-"><a name="7.删除" class="reference-link"></a><span class="header-link octicon octicon-link"></span>7.删除</h3><pre><code class="lang-csharp">//删除根据主键
db.Delete&lt;School, int&gt;(10);

//删除根据表达示
db.Delete&lt;School&gt;(it =&gt; it.id &gt; 100);//支持it=&gt;array.contains(it.id)

//主键批量删除
db.Delete&lt;School, string&gt;(new string[] { "100", "101", "102" });

//非主键批量删除
db.Delete&lt;School, string&gt;(it =&gt; it.name, new string[] { "" });
db.Delete&lt;School, int&gt;(it =&gt; it.id, new int[] { 20, 22 });


//根据实体赋值实体一定要有主键，并且要有值。
db.Delete(new School() { id = 200 });

//根据字符串删除
db.Delete&lt;School&gt;("id=@id", new { id = 100 });

//假删除
//db.FalseDelete&lt;school&gt;("is_del", 100);
//等同于 update school set is_del=1 where id in(100)
//db.FalseDelete&lt;school&gt;("is_del", it=&gt;it.id==100);
</code></pre>
"
