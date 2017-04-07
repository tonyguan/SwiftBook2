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

var intSwift = 80
var intNumber  = NSNumber(value: intSwift)
var floatNumber = NSNumber(value: 80.00)
if intNumber.isEqual(to: floatNumber) {
    NSLog("相等")
} else {
    NSLog("不相等")
}

switch intNumber.compare(floatNumber) {
case .orderedAscending:
    NSLog("第一个数小于第二个数")
case .orderedDescending:
    NSLog("第一个数大于第二个数")
case .orderedSame:
    NSLog("第一个数等于第二个数")
}
