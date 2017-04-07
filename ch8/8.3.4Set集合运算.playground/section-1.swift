//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import Foundation

let A: Set<String>  = ["a","b","e","d"]
let B: Set<String>  = ["d","c","e","f"]

print("A与B交集 = \(A.intersection(B))")
print("A与B并集 = \(A.union(B))")
print("A与B异或集合 = \(A.symmetricDifference(B))")

let C = A.subtracting(B)
print("A与B差集 = \(C)")

if C.isSubset(of: A) {
    print("C是A的子集")
}
