//
//  WrapperObjCObject.mm
//  HelloSwiftCallCPP
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
#import "WrapperObjCObject.h"
#import "CppObject.h"

@interface WrapperObjCObject () {
    CppObject cppObject;
}

@end

@implementation WrapperObjCObject

-(int)add:(int)a :(int)b {
    return cppObject.add(a, b);
}

-(int)sub:(int)a :(int)b {
    return cppObject.sub(a, b);
}

+(int)static_add:(int)a :(int)b {
    return CppObject::static_add(a, b);
}

+(int)static_sub:(int)a :(int)b {
    return CppObject::static_sub(a, b);
}

@end
