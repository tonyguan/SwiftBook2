//
//  swift
//  ParticleSample
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

enum ActionTypes : Int {
    case kBokeh = 100, kFire, kFireflies, kMagic, kRain, kSmoke, kSnow, kSpark
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let labelSpace:CGFloat = 50
        let labelFontSize:CGFloat = 28
        
        let bokehLabel = WKLabelButton(text: "Bokeh", fontNamed:"Chalkduster", callback: #selector(touchBokehLabel))
        bokehLabel.position = CGPoint(x:self.frame.midX, y:self.frame.height - 90)
        bokehLabel.fontColor = UIColor.white
        bokehLabel.fontSize = labelFontSize
        self.addChild(bokehLabel)
        
        let fireLabel = WKLabelButton(text: "Fire", fontNamed:"Chalkduster", callback: #selector(touchFireLabel))
        fireLabel.position = CGPoint(x:self.frame.midX, y:bokehLabel.position.y - labelSpace)
        fireLabel.fontColor = UIColor.white
        fireLabel.fontSize = labelFontSize
        self.addChild(fireLabel)
        
        let firefliesLabel = WKLabelButton(text: "Fireflies", fontNamed:"Chalkduster", callback: #selector(touchFirefliesLabel))
        firefliesLabel.position = CGPoint(x:self.frame.midX, y:fireLabel.position.y - labelSpace)
        firefliesLabel.fontColor = UIColor.white
        firefliesLabel.fontSize = labelFontSize
        self.addChild(firefliesLabel)
        
        let magicLabel = WKLabelButton(text: "Magic", fontNamed:"Chalkduster", callback: #selector(touchMagicLabel))
        magicLabel.position = CGPoint(x:self.frame.midX, y:firefliesLabel.position.y - labelSpace)
        magicLabel.fontColor = UIColor.white
        magicLabel.fontSize = labelFontSize
        self.addChild(magicLabel)
        
        let rainLabel = WKLabelButton(text: "Rain", fontNamed:"Chalkduster", callback: #selector(touchRainLabel))
        rainLabel.position = CGPoint(x:self.frame.midX,  y:magicLabel.position.y - labelSpace)
        rainLabel.fontColor = UIColor.white
        rainLabel.fontSize = labelFontSize
        self.addChild(rainLabel)
        
        let smokeLabel = WKLabelButton(text: "Smoke", fontNamed:"Chalkduster", callback: #selector(touchSmokeLabel))
        smokeLabel.position = CGPoint(x:self.frame.midX, y:rainLabel.position.y - labelSpace)
        smokeLabel.fontColor = UIColor.white
        smokeLabel.fontSize = labelFontSize
        self.addChild(smokeLabel)
        
        let snowLabel = WKLabelButton(text: "Snow", fontNamed:"Chalkduster", callback: #selector(touchSnowLabel))
        snowLabel.position = CGPoint(x:self.frame.midX, y:smokeLabel.position.y - labelSpace)
        snowLabel.fontColor = UIColor.white
        snowLabel.fontSize = labelFontSize
        self.addChild(snowLabel)
        
        let sparkLabel = WKLabelButton(text: "Spark", fontNamed:"Chalkduster", callback: #selector(touchSparkLabel))
        sparkLabel.position = CGPoint(x:self.frame.midX,  y:snowLabel.position.y - labelSpace)
        sparkLabel.fontColor = UIColor.white
        sparkLabel.fontSize = labelFontSize
        self.addChild(sparkLabel)
        
    }
    
    func touchBokehLabel() {
        print("touchBokehLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kBokeh
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchFireLabel() {
        print("touchFireLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kFire
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    
    func touchFirefliesLabel() {
        print("touchFirefliesLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kFireflies
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchMagicLabel() {
        print("touchMagicLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kMagic
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchRainLabel() {
        print("touchRainLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kRain
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchSmokeLabel() {
        print("touchSmokeLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kSmoke
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchSnowLabel() {
        print("touchSnowLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kSnow
        self.view?.presentScene(actionScene!, transition: doors)
    }
    
    func touchSparkLabel() {
        print("touchSparkLabel")
        let doors = SKTransition.doorway(withDuration: 1.0)
        let actionScene = MyActionScene(fileNamed: "MyActionScene")
        actionScene?.selectedAction = .kSpark
        self.view?.presentScene(actionScene!, transition: doors)
    }
}
