/*----------------------------------------------------------------------
	> File Name: tests/test_smtp.cpp
	> Author: Jxiepc
	> Mail: Jxiepc
	> Created Time: Sun 03 Jul 2022 09:43:53 PM CST
----------------------------------------------------------------------*/

#include <iostream>
#include "../Jxiepc/smtp.h"

void test_send() {
    Jxiepc::Smtp smtp(
            587, //服务器端口(默认25)
            "smtp.qq.com", //smtp服务器域名
            "xxx@qq.com", //发件人的邮箱地址
            "xxx", //发件人密码
            "xxx@qq.com", //收件人
            "xxx", //主题
            "xxx" //内容
            ,"text"
    );
}

int main(int argc, char* argv[])
{
    test_send();

    return 0;
}
