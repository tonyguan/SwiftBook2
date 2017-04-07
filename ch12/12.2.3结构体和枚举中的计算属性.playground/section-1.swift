//  
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

struct Department {
    let no: Int = 0
    var name: String = "SALES"
    
    var fullName: String {
        return "Swift." + name + ".D"
    }
}

var dept = Department()
print(dept.fullName)

enum WeekDays: String {
    case Monday     =    "Mon."
    case Tuesday    =    "Tue."
    case Wednesday  =    "Wed."
    case Thursday   =    "Thu."
    case Friday     =    "Fri."
    
    var message: String {
        return "Today is " + self.rawValue
    }
}

var day = WeekDays.Monday
print(day.message)