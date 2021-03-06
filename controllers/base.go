package controllers

import (
	"fmt"
	. "manage/models/messages"
	"strconv"
	"strings"

	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller
	IsLogin bool
	//UserInfo string
	UserUserId   int64
	UserUsername string
	UserAvatar   string
	UserRole int
}

func (this *BaseController) Prepare() {
	userLogin := this.GetSession("userLogin")
	if userLogin == nil {
		this.IsLogin = false
	} else {
		this.IsLogin = true
		tmp := strings.Split((this.GetSession("userLogin")).(string), "||")

		userid, _ := strconv.Atoi(tmp[0])
		longid := int64(userid)

		role, _ := strconv.Atoi(tmp[3])
		this.Data["LoginUserid"] = longid
		this.Data["LoginUsername"] = tmp[1]
		this.Data["LoginAvatar"] = tmp[2]
		this.Data["LoginRole"] = role

		this.UserUserId = longid
		this.UserUsername = tmp[1]
		this.UserAvatar = tmp[2]
		this.UserRole = role

		//消息
		msgcondArr := make(map[string]string)
		msgcondArr["touserid"] = fmt.Sprintf("%d", longid)
		msgcondArr["view"] = "1"
		countTopMessage := CountMessages(msgcondArr)
		_, _, topMessages := ListMessages(msgcondArr, 1, 5)
		this.Data["topMessages"] = topMessages
		this.Data["countTopMessage"] = countTopMessage
	}
	this.Data["IsLogin"] = this.IsLogin
}
