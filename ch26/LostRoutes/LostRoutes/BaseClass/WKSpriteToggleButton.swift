//
//  WKSpriteToggleButton.swift
//  LostRoutes
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

import UIKit
import SpriteKit

class WKSpriteToggleButton: SKSpriteNode {
    
    fileprivate var onImageName:String?
    fileprivate var offImageName:String?
    
    fileprivate var onTexture:SKTexture?
    fileprivate var offTexture:SKTexture?    
    
    fileprivate var onCallback: Selector
    
    fileprivate var offCallback: Selector
    
    var status = true
    
    init(onImageName: String, offImageName: String, onCallback: Selector, offCallback: Selector, status: Bool) {
        
        self.onImageName = onImageName
        self.offImageName = offImageName
        
        self.onTexture = SKTexture(imageNamed: onImageName)
        self.offTexture = SKTexture(imageNamed: offImageName)
        
        self.onCallback = onCallback
        self.offCallback = offCallback
        
        self.status = status
        
        var texture = SKTexture(imageNamed: onImageName)
        
        //如果用户设置了status为false，则精灵纹理使用offImageName
        if !status {
            texture = SKTexture(imageNamed: offImageName)
        }
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())

        //开启触摸事件支持
        self.isUserInteractionEnabled = true
    }
    
    convenience init(onImageName: String, offImageName: String, onCallback: Selector, offCallback: Selector) {
        self.init(onImageName: onImageName, offImageName: offImageName, onCallback: onCallback, offCallback: offCallback, status: true)
    }    
    

    init(onTexture: SKTexture, offTexture: SKTexture, onCallback: Selector, offCallback: Selector, status: Bool) {
        
        self.onTexture = onTexture
        self.offTexture = offTexture
        
        self.onCallback = onCallback
        self.offCallback = offCallback
        
        self.status = status
        
        var texture = self.onTexture
        
        //如果用户设置了status为false，则精灵纹理使用offImageName
        if !status {
            texture = self.offTexture
        }
        
        super.init(texture: texture, color: UIColor.clear, size: texture!.size())
        
        //开启触摸事件支持
        self.isUserInteractionEnabled = true
    }
    
    convenience init(onTexture: SKTexture, offTexture: SKTexture, onCallback: Selector, offCallback: Selector) {
        self.init(onTexture: onTexture, offTexture: offTexture, onCallback: onCallback, offCallback: offCallback, status: true)
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
            
            if self.status {
                self.texture = self.offTexture
                self.status = false
                
                Timer.scheduledTimer(timeInterval: 0.0,
                    target: self.parent!,
                    selector: self.onCallback,
                    userInfo: nil,
                    repeats: false)
                
            } else {
                self.texture = self.onTexture
                self.status = true
                
                Timer.scheduledTimer(timeInterval: 0.0,
                    target: self.parent!,
                    selector: self.offCallback,
                    userInfo: nil,
                    repeats: false)
            }
            
        })
    }
    
    
}
