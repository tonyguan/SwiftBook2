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

let keyString: NSString = "one two three four five"
var keys = keyString.components(separatedBy: " ")

let valueString: NSString = "alpha bravo charlie delta echo"
var values = valueString.components(separatedBy: " ")

var dict = NSDictionary(objects: values, forKeys: keys as [NSCopying])

print(dict.description)

var value = dict["three"]

print("three = \(value)")

var allkeys = dict.allKeys

for key in allkeys {
    print("\(key) - \(dict[key])")
}
