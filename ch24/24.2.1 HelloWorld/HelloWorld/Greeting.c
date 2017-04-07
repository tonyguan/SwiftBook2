//
//  Greeting.c
//  HelloWorld
//
//  Created by 关东升 on 2017/1/20.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

#include "Greeting.h"

const char* sayHello(const char* greeting, const char* name) {
    
    //多个4个字节，为Hi, 字符串准备
    char *result = malloc(strlen(greeting) + strlen(name) + 4);
    strcpy(result, "Hi,");
    strcat(result, name);
    strcat(result, " ");
    strcat(result, greeting);
    
    return result;
}
