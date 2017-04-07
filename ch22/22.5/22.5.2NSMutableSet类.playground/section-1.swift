
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

var weeksNames = NSMutableSet(capacity: 3)

weeksNames.add("星期一")
weeksNames.add("星期二")
weeksNames.add("星期三")
weeksNames.add("星期四")
weeksNames.add("星期五")
weeksNames.add("星期六")
weeksNames.add("星期日")

print("星期名字")
print("====   ====")

for day in weeksNames {
    print(day)
}

var A: NSMutableSet = ["a","b","e","d"]
var B: NSMutableSet = ["d","c","e","f"]

A.minus(B as Set<NSObject>)
print("A与B差集 = \(A)")//[b, a]

A.union(B as Set<NSObject>)
print("A与B并集 = \(A)")//[ d,b,e,c,a,f]
