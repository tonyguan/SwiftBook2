//
//  Created by 关东升 on 2017-1-18.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import Foundation

let number1: Int = 0

//Int转换为NSNumber
let numberObj1 = NSNumber(value: number1)  //通过构造函数转换
let numberObj2 = number1 as NSNumber //桥接转换

//NSNumber转换为Int
let number3 = numberObj1.intValue   //通过方法转换
let number4 = numberObj1 as Int     //桥接转换