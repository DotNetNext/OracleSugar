 OracleSugar一款高性能ORM框架
 
 ### 1. 设置生成实体的数值类型
| number长度  |  实体类型 |
| ------------ | ------------ |
|   1|bool   |
|   3|byte  |
|   4|short   |
|   9|int   | 
|   18|long   | 

修改设置
```csharp
OracleConfig.OracleNumberTypeMapping =new Dictionary<int, string>()
        {
            {1,"bool"},
            {3,"byte"},
            {4,"short"},
            {9,"int"},
            {18,"long"}
        };
```


 ### 2. 数据连接设置
 ```csharp
using(var db = new SqlSugarClient(ConnectionString)){

    //use object
    var list=db.Queryable<T>().ToList();

}
```
 ### 3.设置序列（相当于SQL里面的自增列）
 ```csharp
  OracleConfig.SequenceMapping = new List<SequenceModel>()
            {
                  new SequenceModel(){ ColumnName="ID", TableName="STUDENT", Value="SEQ"/*序列的名称*/} //可以多个
            };
```

 ### 4.查询
 #### 4.1 拉姆达查询
```csharp
var test = db.Queryable<Models.Test>().Where(it => it.C_BOB != null).ToList();

//查询所有
var student = db.Queryable<Student>().ToList();
var studentDynamic = db.Queryable<Student>().ToDynamic();
var studentJson = db.Queryable<Student>().ToJson();


//查询单条
var single = db.Queryable<Student>().Single(c => c.id == 1);
//查询单条根据主键
var singleByPk = db.Queryable<Student>().InSingle(1);
//查询单条没有记录返回空对象
var singleOrDefault = db.Queryable<Student>().SingleOrDefault(c => c.id == 11111111);
//查询单条没有记录返回空对象
var single2 = db.Queryable<Student>().Where(c => c.id == 1).SingleOrDefault();

//查询第一条
var first = db.Queryable<Student>().Where(c => c.id == 1).First();
var first2 = db.Queryable<Student>().Where(c => c.id == 1).FirstOrDefault();

//取11-20条
var page1 = db.Queryable<Student>().Where(c => c.id > 10).OrderBy(it => it.id).Skip(10).Take(10).ToList();

//取11-20条  等于 Skip(pageIndex-1)*pageSize).Take(pageSize) 等于  between (pageIndex-1)*pageSize and  pageIndex*pageSize
var page2 = db.Queryable<Student>().Where(c => c.id > 10).OrderBy(it => it.id).ToPageList(2, 10);

//查询条数
var count = db.Queryable<Student>().Where(c => c.id > 10).Count();

//从第2条开始以后取所有
var skip = db.Queryable<Student>().Where(c => c.id > 10).OrderBy(it => it.id).Skip(2).ToList();

//取前2条
var take = db.Queryable<Student>().Where(c => c.id > 10).OrderBy(it => it.id).Take(2).ToList();

//Not like 
string conval = "a";
var notLike = db.Queryable<Student>().Where(c => !c.name.Contains(conval.ToString())).ToList();

//Like
conval = "三";
var like = db.Queryable<Student>().Where(c => c.name.Contains(conval)).ToList();

//支持字符串Where 让你解决，更复杂的查询
var student12 = db.Queryable<Student>().Where(c => "a" == "a").Where("id>:id", new { id = 1 }).ToList();
var student13 = db.Queryable<Student>().Where(c => "a" == "a").Where("id>100 and id in( select 1 from dual )").ToList();


//存在记录反回true，则否返回false
bool isAny100 = db.Queryable<Student>().Any(c => c.id == 100);
bool isAny1 = db.Queryable<Student>().Any(c => c.id == 1);


//获取最大Id
object maxId = db.Queryable<Student>().Max(it => it.id);
int maxId1 = db.Queryable<Student>().Max(it => it.id).ObjToInt();//拉姆达
int maxId2 = db.Queryable<Student>().Max<int>("id"); //字符串写法

//获取最小
int minId1 = db.Queryable<Student>().Where(c => c.id > 0).Min(it => it.id).ObjToInt();//拉姆达
int minId2 = db.Queryable<Student>().Where(c => c.id > 0).Min<int>("id");//字符串写法


//order By 
var orderList = db.Queryable<Student>().OrderBy("id desc,name asc").ToList();//字符串支持多个排序
//可以多个order by表达示
var order2List = db.Queryable<Student>().OrderBy(it => it.name).OrderBy(it => it.id, OrderByType.desc).ToList(); // order by name as ,order by id desc

//In
var intArray = new[] { "5", "2", "3" };
var intList = intArray.ToList();
var listnew = db.Queryable<Student>().Where(it => intArray.Contains(it.name)).ToList();
var list0 = db.Queryable<Student>().In(it => it.id, 1, 2, 3).ToList();
var list1 = db.Queryable<Student>().In(it => it.id, intArray).ToList();
var list2 = db.Queryable<Student>().In("id", intArray).ToList();
var list3 = db.Queryable<Student>().In(it => it.id, intList).ToList();
var list4 = db.Queryable<Student>().In("id", intList).ToList();
var list6 = db.Queryable<Student>().In(intList).ToList();//不设置字段默认主键

//分组查询
var list7 = db.Queryable<Student>().Where(c => c.id < 20).GroupBy(it => it.sex).Select("sex,count(*) Count").ToDynamic();
var list8 = db.Queryable<Student>().Where(c => c.id < 20).GroupBy(it => it.sex).GroupBy(it => it.id).Select("id,sex,count(*) Count").ToDynamic();
List<StudentGroup> list9 = db.Queryable<Student>().Where(c => c.id < 20).GroupBy(it => it.sex).Select<StudentGroup>("Sex,count(*) Count").ToList();
List<StudentGroup> list10 = db.Queryable<Student>().Where(c => c.id < 20).GroupBy("sex").Select<StudentGroup>("Sex,count(*) Count").ToList();
//SELECT Sex,Count=count(*)  FROM Student  WHERE 1=1  AND  (id < 20)    GROUP BY Sex --生成结果



//2表关联查询
var jList = db.Queryable<Student>()
	.JoinTable<School>((s1, s2) => s1.sch_id == s2.id) //默认left join
	.Where<School>((s1, s2) => s1.id == 1)
	.Select("s1.*,s2.name as schName")
	.ToDynamic();

/*等于同于
                 SELECT s1.*,s2.name as schName 
                 FROM [Student]  s1 
                 LEFT JOIN [School]  s2 ON  s1.sch_id  = s2.id 
                 WHERE  s1.id  = 1 */

//2表关联查询并分页
var jList2 = db.Queryable<Student>()
	.JoinTable<School>((s1, s2) => s1.sch_id == s2.id) //默认left join
	//如果要用inner join这么写
	//.JoinTable<School>((s1, s2) => s1.sch_id == s2.id ,JoinType.INNER)
	.Where<School>((s1, s2) => s1.id > 1)
	.OrderBy(s1 => s1.name)
	.Skip(10)
	.Take(20)
	.Select("s1.*,s2.name as schName")
	.ToDynamic();

//3表查询并分页
var jList3 = db.Queryable<Student>()
	.JoinTable<School>((s1, s2) => s1.sch_id == s2.id) // left join  School s2  on s1.id=s2.id
	.JoinTable<School>((s1, s3) => s1.sch_id == s3.id) // left join  School s3  on s1.id=s3.id
	.Where<School>((s1, s2) => s1.id > 1)  // where s1.id>1
	.Where(s1 => s1.id > 0)
	.OrderBy<School>((s1, s2) => s1.id) //order by s1.id 多个order可以  .oderBy().orderby 叠加 
	.Skip(10)
	.Take(20)
	.Select("s1.*,s2.name as schName,s3.name as schName2")//select目前只支持这种写法
	.ToDynamic();


//上面的方式都是与第一张表join，第三张表想与第二张表join写法如下
List<V_Student> jList4 =
	db.Queryable<Student>()
	.JoinTable<School>((s1, s2) => s1.sch_id == s2.id) // left join  School s2  on s1.id=s2.id
	.JoinTable<School, Area>((s1, s2, a1) => a1.id == s2.AreaId)// left join  Area a1  on a1.id=s2.AreaId  第三张表与第二张表关联
		.JoinTable<Area, School>((s1, a1, s3) => a1.id == s3.AreaId)// left join  School s3  on a1.id=s3.AreaId  第四第表第三张表关联
			.JoinTable<School>((s1, s4) => s1.sch_id == s4.id) // left join  School s2  on s1.id=s4.id
			.Select<School, Area, V_Student>((s1, s2, a1) => new V_Student { id = s1.id, name = s1.name, SchoolName = s2.name, AreaName = a1.name }).ToList();

//等同于
//SELECT id = s1.id, name = s1.name, SchoolName = s2.name, AreaName = a1.name  
//FROM [Student]   s1 
//LEFT JOIN School  s2 ON  ( s1.sch_id  = s2.id )    
//LEFT JOIN Area  a1 ON  ( a1.id  = s2.AreaId )     //第三张表与第二张表关联
//LEFT JOIN School  s3 ON  ( a1.id  = s3.AreaId )   //第四张表与第三张表关联
//LEFT JOIN School  s4 ON  ( s1.sch_id  = s4.id )    
//WHERE 1=1    


//Join子查询语句加分页的写法
var childQuery = db.Queryable<Area>().Where("id=:id").Select(it => new { id = it.id }).ToSql();//创建子查询SQL
string childTableName =SqlSugarTool.PackagingSQL(childQuery.Key);//将SQL语句用()包成表
var queryable = db.Queryable<Student>()
	.JoinTable<School>((s1, s2) => s1.sch_id == s2.id)  //LEFT JOIN School  s2 ON  ( s1.sch_id  = s2.id )  
	.JoinTable(childTableName, "a1", "a1.id=s2.areaid", new { id = 1 }, JoinType.INNER) //INNER JOIN (SELECT *  FROM [Area]   WHERE 1=1  AND id=@id   ) a1 ON a1.id=s2.areaid
	.OrderBy(s1 => s1.id);

var list = queryable.Select<School, Area, V_Student>((s1, s2, a1) => new V_Student { id = s1.id, name = s1.name, SchoolName = s2.name, AreaName = a1.name })
	.ToPageList(0, 200);
var count2 = queryable.Count();


//拼接例子
var queryable2 = db.Queryable<Student>().Where(it => true);
if (maxId.ObjToInt() == 1)
{
	queryable2.Where(it => it.id == 1);
}
else
{
	queryable2.Where(it => it.id == 2);
}
var listJoin = queryable2.ToList();


//queryable和SqlSugarClient解耦
var par = new Queryable<Student>().Where(it => it.id == 1);//声名没有connection对象的Queryable
par.DB = db;
var listPar = par.ToList();


//查看生成的sql和参数
var id = 1;
var sqlAndPars = db.Queryable<Student>().Where(it => it.id == id).OrderBy(it => it.id).ToSql();



//拉姆达支持的函数操作
var par1 = "2015-1-1"; var par2 = "   我 有空格A, ";
var r1 = db.Queryable<Student>().Where(it => it.name == par1.ObjToString()).ToList(); //ObjToString会将null转转成""
var r2 = db.Queryable<InsertTest>().Where(it => it.d1 == par1.ObjToDate()).ToList();
var r3 = db.Queryable<InsertTest>().Where(it => it.id == 1.ObjToInt()).ToList();//ObjToInt会将null转转成0
var r4 = db.Queryable<InsertTest>().Where(it => it.id == 2.ObjToDecimal()).ToList();
var r5 = db.Queryable<InsertTest>().Where(it => it.id == 3.ObjToMoney()).ToList();
var r6 = db.Queryable<InsertTest>().Where(it => it.v1 == par2.Trim()).ToList();
var convert1 = db.Queryable<Student>().Where(c => c.name == "a".ToString()).ToList();
var convert2 = db.Queryable<Student>().Where(c => c.id == Convert.ToInt32("1")).ToList();
var convert3 = db.Queryable<Student>().Where(c => c.name == par2.ToLower()).ToList();
var convert4 = db.Queryable<Student>().Where(c => c.name == par2.ToUpper()).ToList();
var convert5= db.Queryable<Student>().Where(c => DateTime.Now > Convert.ToDateTime("2015-1-1")).ToList();
var c1 = db.Queryable<Student>().Where(c => c.name.Contains("a")).ToList();
var c2 = db.Queryable<Student>().Where(c => c.name.StartsWith("a")).ToList();
var c3 = db.Queryable<Student>().Where(c => c.name.EndsWith("a")).ToList();
var c4 = db.Queryable<Student>().Where(c => !string.IsNullOrEmpty(c.name)).ToList();
var c5 = db.Queryable<Student>().Where(c => c.name.Equals("小杰")).ToList();
var c6 = db.Queryable<Student>().Where(c => c.name.Length > 4).ToList();
var time = db.Queryable<InsertTest>().Where(c => c.d1>DateTime.Now.AddDays(1)).ToList();
var time2 = db.Queryable<InsertTest>().Where(c => c.d1 > DateTime.Now.AddYears(1)).ToList();
var time3 = db.Queryable<InsertTest>().Where(c => c.d1 > DateTime.Now.AddMonths(1)).ToList();
```

  #### 4.2 原生SQL的支持
  ```csharp
//转成list
List<Student> list1 = db.SqlQuery<Student>("select * from Student");
//转成list带参
List<Student> list2 = db.SqlQuery<Student>("select * from Student where id=:id", new { id = 1 });
//转成dynamic
dynamic list3 = db.SqlQueryDynamic("select * from student");
//转成json
string list4 = db.SqlQueryJson("select * from student");
//返回int
var list5 = db.SqlQuery<int>("select id from Student where rownum<=1").SingleOrDefault();
//反回键值
Dictionary<string, string> list6 = db.SqlQuery<KeyValuePair<string, string>>("select id,name from Student").ToDictionary(it => it.Key, it => it.Value);
//反回List<string[]>
var list7 = db.SqlQuery<string[]>("select   id,name from Student where rownum<=1").SingleOrDefault();
//存储过程
// var spResult = db.SqlQuery<School>("exec sp_school @p1,@p2", new { p1 = 1, p2 = 2 }); 现是SQL写i法请成ORACLE写法

//存储过程加Output 
//var pars = SqlSugarTool.GetParameters(new { p1 = 1,p2=0 }); //将匿名对象转成SqlParameter
//db.IsClearParameters = false;//禁止清除参数
//pars[1].Direction = ParameterDirection.Output; //将p2设为 output
//var spResult2 = db.SqlQuery<School>("exec sp_school @p1,@p2 output", pars);现是SQL写i法请成ORACLE写法
//db.IsClearParameters = true;//启用清除参数
//var outPutValue = pars[1].Value;//获取output @p2的值


////存储过程优化操作
//var pars2 = SqlSugarTool.GetParameters(new { p1 = 1, p2 = 0 }); //将匿名对象转成SqlParameter
//db.CommandType = CommandType.StoredProcedure;//指定为存储过程可比上面少写EXEC和参数
//var spResult3 = db.SqlQuery<School>("sp_school", pars2);现是SQL写i法请成ORACLE写法
//db.CommandType = CommandType.Text;//还原回默认


//获取第一行第一列的值
string v1 = db.GetString("select '张三' as name from dual");
int v2 = db.GetInt("select 1 as name  from dual");
double v3 = db.GetDouble("select 1 as name  from dual");
decimal v4 = db.GetDecimal("select 1 as name  from dual");
```
####4.3 Sql拼接器
```csharp
//---------Sqlable,创建多表查询---------//

//多表查询
List<School> dataList = db.Sqlable()
	.From("school", "s")
	.Join("student", "st", "st.id", "s.id", JoinType.INNER)
	.Join("student", "st2", "st2.id", "st.id", JoinType.LEFT)
	.Where("s.id>100 and s.id<:id")
	.Where("1=1")//可以多个WHERE
	.OrderBy("s.id")
	.SelectToList<School/*新的Model我这里没有所以写的School*/>("st.*", new { id = 1 });

//多表分页
List<School> dataPageList = db.Sqlable()
	.From("school", "s")
	.Join("student", "st", "st.id", "s.id", JoinType.INNER)
	.Join("student", "st2", "st2.id", "st.id", JoinType.LEFT)
	.Where("s.id>100 and s.id<100")
	.SelectToPageList<School>("st.*", "s.id", 1, 10);

//多表分页WHERE加子查询
List<School> dataPageList2 = db.Sqlable()
	.From("school", "s")
	.Join("student", "st", "st.id", "s.id", JoinType.INNER)
	.Join("student", "st2", "st2.id", "st.id", JoinType.LEFT)
	.Where("s.id>100 and s.id<100 and s.id in (select 1  from dual )" /*这里面写子查询都可以*/)
	.SelectToPageList<School>("st.*", "s.id", 1, 10);



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
Sqlable sable = db.Sqlable().From<Student>("s").Join<School>("l", "s.sch_id", "l.id", JoinType.INNER);
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
if (id > 0)
{
	sable = sable.Where("l.id in (select  id from school where rownum<10)");//where加子查询
}
var pars = new { id = id, name = name };
int pageCount = sable.Count(pars);
var list7 = sable.SelectToPageList<Student>("s.*", "l.id desc", 1, 20, pars);
```

###5.插入
```csharp
db.Insert(GetInsertItem()); //插入一条记录 (有主键也好，没主键也好，有自增列也好都可以插进去)


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
var sex = db.Queryable<Student>().Single(it => it.id == id.ObjToInt()).sex;//无值
var name = db.Queryable<Student>().Single(it => it.id == id.ObjToInt()).name;//有值


//SqlBulkCopy同样支持不挺入列设置
db.SqlBulkCopy(GetInsertList());
```

###6.更新
```csharp
//指定列更新
db.Update<School>(new { name = "蓝翔14" }, it => it.id == 14); //只更新name列
db.Update<School, int>(new { name = "蓝翔11 23 12", areaId = 2 }, 11, 23, 12);
db.Update<School, string>(new { name = "蓝翔2" }, new string[] { "11", "21" });
db.Update<School>(new { name = "蓝翔2" }, it => it.id == 100);
var array=new int[]{1,2,3};
db.Update<School>(new { name = "蓝翔2" }, it => array.Contains(it.id));// id in 1,2,3


//支持字典更新，适合动态权限
var dic = new Dictionary<string, string>();
dic.Add("name", "第十三条");
dic.Add("areaId", "1");
db.Update<School, int>(dic, 13);


//整个实体更新
db.Update(new School { id = 16, name = "蓝翔16", AreaId = 1 });
db.Update<School>(new School { id = 12, name = "蓝翔12", AreaId = 2 }, it => it.id == 18);
db.Update<School>(new School() { id = 11, name = "青鸟11" });

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
```

###7.删除
```csharp
//删除根据主键
db.Delete<School, int>(10);

//删除根据表达示
db.Delete<School>(it => it.id > 100);//支持it=>array.contains(it.id)

//主键批量删除
db.Delete<School, string>(new string[] { "100", "101", "102" });

//非主键批量删除
db.Delete<School, string>(it => it.name, new string[] { "" });
db.Delete<School, int>(it => it.id, new int[] { 20, 22 });


//根据实体赋值实体一定要有主键，并且要有值。
db.Delete(new School() { id = 200 });

//根据字符串删除
db.Delete<School>("id=@id", new { id = 100 });

//假删除
//db.FalseDelete<school>("is_del", 100);
//等同于 update school set is_del=1 where id in(100)
//db.FalseDelete<school>("is_del", it=>it.id==100);
```
