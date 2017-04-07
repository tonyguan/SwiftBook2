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

print("n   n*n")
print("---------")

for i in 1 ..< 10  {
    print("\(i) x \(i) = \(i * i)")
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for item in numbers {
    print("Count is: \(item)")
}

for (index, element) in numbers.enumerated() {
    print("Item \(index): \(element)")
}
