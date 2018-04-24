package main

import (
	"manage/utils"
)

func main() {
	pwd := utils.Md5("admin")
	println(pwd)
}
