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

var weeksArray: NSSet = ["星期一","星期二", "星期三", "星期四"]
weeksArray = weeksArray.adding("星期五") as NSSet
weeksArray = weeksArray.addingObjects(from: ["星期六","星期日"]) as NSSet

var weeksNames = NSSet(set: weeksArray)

for day in weeksArray {
    print(day)
}

print("============")

for day in weeksNames {
    print(day)
}
