package checkworks

import (
	//"fmt"
	//"math/rand"
	"manage/models"
	"time"
	"github.com/astaxie/beego/orm"
)

type Checkworks struct {
	Id      int64 `orm:"pk;column(checkid);"`
	Userid  int64
	Clock   string
	Type    int
	Ip      string
	Created int64
}

func (this *Checkworks) TableName() string {
	return models.TableName("checkworks")
}
func init() {
	orm.RegisterModel(new(Checkworks))
}

func CountPersonCheckwork(condArr map[string]string) int64 {
	qb, _ := orm.NewQueryBuilder("mysql")
	qb.Select("count(*)").From(models.TableName("checkworks")).Where("userid=?")
	if condArr["type"] != "" {
		qb.And("type=" + condArr["type"])
	}
	if condArr["date"] != "" {
		qb.And("FROM_UNIXTIME(created,'%Y-%m')='" + condArr["date"] + "'")
	}

	sql := qb.String()
	o := orm.NewOrm()

	var counts []int64
	o.Raw(sql, condArr["userId"]).QueryRows(&counts)
	if len(counts) > 0 {
		sum := int64(0)
		for _, count := range counts{
			sum += count
		}
		return sum
	}else {
		return 0
	}
}

//个人用户考勤列表30/31条
func ListCheckwork(condArr map[string]string, page int, offset int) (num int64, err error, checkwork []Checkworks) {
	qb, _ := orm.NewQueryBuilder("mysql")
	qb.Select("*").From(models.TableName("checkworks")).Where("userid=?")
	if condArr["type"] != "" {
		qb.And("type=" + condArr["type"])
	}
	if condArr["date"] != "" {
		qb.And("FROM_UNIXTIME(created,'%Y-%m')='" + condArr["date"] + "'")
	}
	qb.OrderBy("created").Desc().Limit(offset).Offset((page - 1) * offset)

	sql := qb.String()
	o := orm.NewOrm()

	var checkworks []Checkworks
	nums, errs := o.Raw(sql, condArr["userId"]).QueryRows(&checkworks)
	return nums, errs, checkworks
}

type CheckworksAll struct {
	Realname string
	Userid   int64
	Clock    string
	Date     string
	Ip       string
}

func CountCheckAll(condArr map[string]string) int64 {
	qb, _ :=orm.NewQueryBuilder("mysql")
	qb.Select("count(ck.userid)").From(models.TableName("checkworks") + " as ck").
		LeftJoin(models.TableName("users_profile") + " as u").On("u.userid = ck.userid").
		Where("FROM_UNIXTIME(ck.created,'%Y-%m')='" + condArr["date"] + "'")
	if condArr["keyword"] != "" {
		qb.And("u.realname = '" + condArr["keyword"] + "'")
		//qb.And("CONTAINS(u.realname, '*" + condArr["keyword"] + "*')")
	}

	qb.GroupBy("ck.userid, FROM_UNIXTIME(ck.created,'%Y-%m-%d')")
	qb.OrderBy("ck.created").Desc()

	sql := qb.String()
	o := orm.NewOrm()
	var counts []int64
	o.Raw(sql).QueryRows(&counts)
	if len(counts) > 0 {
		sum := int64(0)
		for _, count := range counts{
			sum += count
		}
		return sum/2
	}else {
		return 0
	}
}

func ListCheckworkAll(condArr map[string]string, page int, offset int) (num int64, err error, checkwork []CheckworksAll) {
	qb, _ := orm.NewQueryBuilder("mysql")
	qb.Select("u.userid", "u.realname", "ck.ip", "GROUP_CONCAT(ck.clock SEPARATOR '   ~  ') AS clock", "FROM_UNIXTIME(ck.created,'%Y-%m-%d') AS date").
		From(models.TableName("checkworks") + " AS ck").
		LeftJoin(models.TableName("users_profile") + " AS u").On("u.userid = ck.userid").
		Where("ck.userid > 0")

	if condArr["keyword"] != "" {
		qb.And("u.realname='" + condArr["keyword"] + "'")
		//qb.And("CONTAINS(u.realname, '*" + condArr["keyword"] + "*')")
	}
	if condArr["date"] != "" {
		qb.And("FROM_UNIXTIME(ck.created,'%Y-%m')='" + condArr["date"] + "'")
	}

	qb.GroupBy("u.userid, FROM_UNIXTIME(ck.created,'%Y-%m-%d')")
	//qb.OrderBy("u.realname").Asc()
	qb.OrderBy("ck.created").Desc().Limit(offset).Offset((page - 1) * offset)

	sql := qb.String()
	o := orm.NewOrm()

	var checkworks []CheckworksAll
	nums, errs := o.Raw(sql).QueryRows(&checkworks)
	return nums, errs, checkworks
}

//计算当天用户打卡次数 2
type TmpClockCount struct {
	Num int64
}

func CountClock(id int64) int64 {
	qb, _ := orm.NewQueryBuilder("mysql")
	qb.Select("Count(1) AS num").From(models.TableName("checkworks")).
		Where("userid=?").
		And("TO_DAYS(FROM_UNIXTIME(created,'%Y-%m-%d'))=TO_DAYS(NOW())")

	sql := qb.String()
	o := orm.NewOrm()
	var tmp TmpClockCount
	err := o.Raw(sql, id).QueryRow(&tmp)
	if err == nil {
		return tmp.Num
	} else {
		return 0
	}
}

//打卡
func AddCheckwork(upd Checkworks) error {
	o := orm.NewOrm()
	o.Using("default")
	check := new(Checkworks)

	check.Id = upd.Id
	check.Userid = upd.Userid
	check.Clock = upd.Clock
	check.Type = upd.Type
	check.Ip = upd.Ip
	check.Created = time.Now().Unix()

	_, err := o.Insert(check)
	return err
}

func CountCheckwork(date string, userId int64) (num float64, err error) {
	qb, _ := orm.NewQueryBuilder("mysql")

	qb.Select("Count(1) / 2 AS num")

	qb.From(models.TableName("checkworks")).
		Where("userid=?").And("FROM_UNIXTIME(created,'%Y-%m')='" + date + "'")

	sql := qb.String()
	o := orm.NewOrm()
	errs := o.Raw(sql, userId).QueryRow(&num)
	return num, errs
}

//统计1正常2迟到3早退4加班
type CountCheckworkCommon struct {
	Num  int
	Type int
}

func CountCheckworkType(date string, userId int64) (num int64, err error, need []CountCheckworkCommon) {
	var cks []CountCheckworkCommon
	qb, _ := orm.NewQueryBuilder("mysql")

	qb.Select("COUNT(1) AS num", "type").From(models.TableName("checkworks")).
		Where("userid=?").And("FROM_UNIXTIME(created,'%Y-%m')='" + date + "'").
		GroupBy("type")

	sql := qb.String()
	o := orm.NewOrm()
	nums, err := o.Raw(sql, userId).QueryRows(&cks)
	return nums, err, cks
}

//统计 请假 外出
func CountCheck(table string, date string, userId int64) (num int64, err error) {
	qb, _ := orm.NewQueryBuilder("mysql")

	if table == "goouts" {
		qb.Select("hours AS num")
	} else {
		qb.Select("SUM(days*8) AS num")
	}

	qb.From(models.TableName(table)).
		Where("userid=?").And("FROM_UNIXTIME(started,'%Y-%m')='" + date + "'")

	sql := qb.String()
	o := orm.NewOrm()
	var cks int64
	errs := o.Raw(sql, userId).QueryRow(&cks)
	return cks, errs
}
