//
//  ObjCObject.m
//  MyFramework
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

#import "ObjCObject.h"

@implementation ObjCObject

-(instancetype)initWithGreeting:(NSString*)aGreeting name:(NSString*)aName {
    self = [super init];
    if (self) {
        self.greeting = aGreeting;
        self.name = aName;
    }
    return self;
}

-(NSString*)sayHello:(NSString*)greeting name: (NSString*)name {
    NSString *string = [NSString stringWithFormat:@"Hi,%@ %@.", name, greeting];    
    return string;
}


-(NSString *)write:(NSString *)fileName error:(NSError *__autoreleasing *)error {
    if (error) {
        *error = [NSError errorWithDomain:@"ObjCObject Error" code:0 userInfo:nil];
    }
    return nil;
}

@end
