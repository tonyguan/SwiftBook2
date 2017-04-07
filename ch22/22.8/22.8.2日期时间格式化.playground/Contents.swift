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

// 创建当前时刻对象
let now = Date()
print(now)

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

// Date转换为字符串
let dateString = formatter.string(from: now)
print(dateString)

formatter.dateFormat = "yyyy-MM-dd"
let birthdayString = "1973-12-08"
// 字符串转换为Date
let birthday = formatter.date(from: birthdayString)
print(birthday!)