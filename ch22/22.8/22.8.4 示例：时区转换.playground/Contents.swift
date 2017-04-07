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

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

extension Date {
    
    var toLocalTime: String {
        
        let timeZone = NSTimeZone.local
        let seconds = TimeInterval(timeZone.secondsFromGMT(for: self))
        
        let date = Date(timeInterval: seconds, since: self)
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    
    var toUTCTime: String {
        
        let timeZone = NSTimeZone.local
        let seconds = -1 * TimeInterval(timeZone.secondsFromGMT(for: self))
        
        let date = Date(timeInterval: seconds, since: self)
        let dateString = formatter.string(from: date)
        
        return dateString
    }
}

let birthdayString = "1973-12-08 20:53:21"
let birthday = formatter.date(from: birthdayString)

print(birthdayString)
//birthdayString - 8小时
print("UTC时间:\(birthday!.toUTCTime)")
//birthdayString + 8小时
print("本地时间:\(birthday!.toLocalTime)")

