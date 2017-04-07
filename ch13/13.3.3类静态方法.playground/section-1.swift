//
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

class Account {
    //账户名
    var owner: String = "Tony"
    // class换成static不能重写该方法
    class func interestBy(amount: Double) -> Double {
        return 0.08886 * amount
    }
}

class AccountB: Account {
    override static func interestBy(amount: Double) -> Double {
        return 0.0889 * amount
    }
}

//调用静态方法
print(Account.interestBy(amount: 10_000.00))
