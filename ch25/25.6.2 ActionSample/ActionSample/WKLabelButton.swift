//
//  WKLabelButton.swift
//  ActionSample
//
//  Created by 关东升 on 2017/1/20.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  作者微信：tony关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import SpriteKit

class WKLabelButton: SKLabelNode {

    var callback: Selector
    
    init(text: String, fontNamed: String, callback: Selector) {

        self.callback = callback
        
        super.init()

        //开启触摸事件支持
        self.isUserInteractionEnabled = true
        self.text = text
        self.fontName = fontNamed
        self.fontSize = 20
        self.fontColor = UIColor.black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let ac1 = SKAction.scale(by: 1.2, duration: 0.1)
        self.run(ac1)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        let ac1 = SKAction.scale(by: 1.0/1.2, duration: 0.1)
        
        self.run(ac1, completion: { () -> Void in
            
            Timer.scheduledTimer(timeInterval: 0.0,
                target: self.parent!,
                selector: self.callback,
                userInfo: nil,
                repeats: false)
            
        })
    }
    
}
