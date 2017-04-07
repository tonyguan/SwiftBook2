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

var weeksNames = NSMutableArray(capacity: 3)

weeksNames.add("星期一")
weeksNames.add("星期二")
weeksNames.add("星期三")
weeksNames.add("星期四")
weeksNames.add("星期五")
weeksNames.add("星期六")
weeksNames.add("星期日")

print("星期名字")
print("====   ====")
for i in 0 ..< weeksNames.count {
    var day = weeksNames[i]
    print("\(i)     \(day)")
}

print("+++++++++++")
for item in weeksNames {
    print("\(item)")
}

