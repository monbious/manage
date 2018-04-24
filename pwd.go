package main

import (
	"opms/utils"
)

func main() {
	pwd := utils.Md5("admin")
	println(pwd)
}
