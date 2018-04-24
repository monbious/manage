package routers

import (
	"manage/controllers/businesstrips"
	"manage/controllers/checkworks"
	"manage/controllers/expenses"
	"manage/controllers/leaves"
	"manage/controllers/messages"
	"manage/controllers/overtimes"
	"manage/controllers/resumes"
	"manage/controllers/users"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &users.MainController{})

	//用户
	beego.Router("/user/manage", &users.ManageUserController{})
	beego.Router("/user/ajax/status", &users.AjaxStatusUserController{})
	beego.Router("/user/edit/:id", &users.EditUserController{})
	beego.Router("/user/add", &users.AddUserController{})
	beego.Router("/user/avatar", &users.AvatarUserController{})
	beego.Router("/user/ajax/search", &users.AjaxSearchUserController{}) //搜索用户名匹配
	beego.Router("/user/show/:id", &users.ShowUserController{})
	beego.Router("/my/manage", &users.ShowUserController{})
	beego.Router("/user/profile", &users.EditUserProfileController{})
	beego.Router("/user/password", &users.EditUserPasswordController{})

	beego.Router("/login", &users.LoginUserController{})
	beego.Router("/logout", &users.LogoutUserController{})

	//部门
	beego.Router("/department/manage", &users.ManageDepartmentController{})
	beego.Router("/department/ajax/status", &users.AjaxStatusDepartmentController{})
	beego.Router("/department/edit/:id", &users.EditDepartmentController{})
	beego.Router("/department/add", &users.AddDepartmentController{})

	//职位
	beego.Router("/position/manage", &users.ManagePositionController{})
	beego.Router("/position/ajax/status", &users.AjaxStatusPositionController{})
	beego.Router("/position/edit/:id", &users.EditPositionController{})
	beego.Router("/position/add", &users.AddPositionController{})

	//公告
	beego.Router("/notice/manage", &users.ManageNoticeController{})
	beego.Router("/notice/ajax/status", &users.AjaxStatusNoticeController{})
	beego.Router("/notice/ajax/delete", &users.AjaxDeleteNoticeController{})
	beego.Router("/notice/edit/:id", &users.EditNoticeController{})
	beego.Router("/notice/add", &users.AddNoticeController{})

	//简历
	beego.Router("/resume/manage", &resumes.ManageResumeController{})
	beego.Router("/resume/add", &resumes.AddResumeController{})
	beego.Router("/resume/edit/:id", &resumes.EditResumeController{})
	beego.Router("/resume/ajax/status", &resumes.AjaxStatusResumeController{})
	beego.Router("/resume/ajax/delete", &resumes.AjaxDeleteResumeController{})

	//请假
	beego.Router("/leave/manage", &leaves.ManageLeaveController{})
	beego.Router("/leave/approval", &leaves.ApprovalLeaveController{})
	beego.Router("/leave/approval/:id", &leaves.ShowLeaveController{})
	beego.Router("/leave/edit/:id", &leaves.EditLeaveController{})
	beego.Router("/leave/add", &leaves.AddLeaveController{})
	beego.Router("/leave/ajax/status", &leaves.AjaxLeaveStatusController{})
	beego.Router("/leave/ajax/delete", &leaves.AjaxLeaveDeleteController{})

	//报销
	beego.Router("/expense/manage", &expenses.ManageExpenseController{})
	beego.Router("/expense/approval", &expenses.ApprovalExpenseController{})
	beego.Router("/expense/approval/:id", &expenses.ShowExpenseController{})
	beego.Router("/expense/edit/:id", &expenses.EditExpenseController{})
	beego.Router("/expense/add", &expenses.AddExpenseController{})
	beego.Router("/expense/ajax/status", &expenses.AjaxExpenseStatusController{})
	beego.Router("/expense/ajax/delete", &expenses.AjaxExpenseDeleteController{})

	//出差
	beego.Router("/businesstrip/manage", &businesstrips.ManageBusinesstripController{})
	beego.Router("/businesstrip/approval", &businesstrips.ApprovalBusinesstripController{})
	beego.Router("/businesstrip/approval/:id", &businesstrips.ShowBusinesstripController{})
	beego.Router("/businesstrip/edit/:id", &businesstrips.EditBusinesstripController{})
	beego.Router("/businesstrip/add", &businesstrips.AddBusinesstripController{})
	beego.Router("/businesstrip/ajax/status", &businesstrips.AjaxBusinesstripStatusController{})
	beego.Router("/businesstrip/ajax/delete", &businesstrips.AjaxBusinesstripDeleteController{})

	//加班
	beego.Router("/overtime/manage", &overtimes.ManageOvertimeController{})
	beego.Router("/overtime/approval", &overtimes.ApprovalOvertimeController{})
	beego.Router("/overtime/approval/:id", &overtimes.ShowOvertimeController{})
	beego.Router("/overtime/edit/:id", &overtimes.EditOvertimeController{})
	beego.Router("/overtime/add", &overtimes.AddOvertimeController{})
	beego.Router("/overtime/ajax/status", &overtimes.AjaxOvertimeStatusController{})
	beego.Router("/overtime/ajax/delete", &overtimes.AjaxOvertimeDeleteController{})

	//考勤打卡
	beego.Router("/checkwork/manage", &checkworks.ManageCheckworkController{})
	beego.Router("/checkwork/all", &checkworks.ManageCheckworkAllController{})
	beego.Router("/checkwork/ajax/clock", &checkworks.AjaxClockUserController{})

	//消息
	beego.Router("/message/manage", &messages.ManageMessageController{})
	beego.Router("/message/ajax/delete", &messages.AjaxDeleteMessageController{})
	beego.Router("/message/ajax/status", &messages.AjaxStatusMessageController{})

}
