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

let foundationString: NSString = "alpha bravo charlie delta echo"

//从NSString到String
let swiftString = foundationString as String

//从String到NSString
let foundationString2 = swiftString as NSString

//使用NSString的components(separatedBy:)方法
let swiftArray = foundationString2.components(separatedBy: " ")

let intString: NSString = "456"
//通过Int构造函数将String转换为Int类型
let intValue = Int(intString as String)
