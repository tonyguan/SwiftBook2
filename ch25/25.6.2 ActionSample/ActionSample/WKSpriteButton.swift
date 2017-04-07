//
//  WKSpriteButton.swift
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

class WKSpriteButton: SKSpriteNode {
    
    fileprivate var normalImageName:String?
    fileprivate var selectedImageName:String?
    
    fileprivate var normaleTexture:SKTexture?
    fileprivate var selectedTexture:SKTexture?
    
    fileprivate var callback: Selector
    
    // 通过图片文件名创建
    init(normalImageName: String, selectedImageName: String, callback: Selector) {
        
        self.normalImageName = normalImageName
        self.selectedImageName = selectedImageName
   
        self.normaleTexture = SKTexture(imageNamed: normalImageName)
        self.selectedTexture = SKTexture(imageNamed: selectedImageName)
        
        self.callback = callback
        
        
        super.init(texture: self.normaleTexture, color: UIColor.clear, size: self.normaleTexture!.size())
        
        self.texture = self.normaleTexture

        
        //开启触摸事件支持
        self.isUserInteractionEnabled = true
    }
    
    // 通过纹理对象创建
    init(normalTexture: SKTexture, selectedTexture: SKTexture, callback: Selector) {
        
        self.normaleTexture = normalTexture
        self.selectedTexture = selectedTexture
        self.callback = callback
        
        super.init(texture: normalTexture, color: UIColor.clear, size: self.normaleTexture!.size())
        self.texture = self.normaleTexture
        
        //开启触摸事件支持
        self.isUserInteractionEnabled = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //触摸开始方法，当手指触摸屏幕时触发
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.texture = self.selectedTexture
        
        let ac1 = SKAction.scale(by: 1.2, duration: 0.1)
        self.run(ac1)
    }
    
    //触摸结束方法，当手指离开屏幕时触发
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.texture = self.normaleTexture
        
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
