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

let weeksArray = ["星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日"]

var weeksNames1 = NSArray(array: weeksArray)
var weeksNames2 = NSArray(objects: "星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日")


print("星期名字")
print("====   ====")
for i in 0 ..< weeksNames1.count {
    var day = weeksNames1.object(at: i)// 可以使用weeksNames1[i]替换
    print("\(i)     \(day)")
}

print("+++++++++++")
for item in weeksNames2 {
    print("\(item)")
}
