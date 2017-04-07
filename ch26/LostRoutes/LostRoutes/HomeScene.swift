//
//  HomeScene.swift
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

import SpriteKit

class HomeScene: SKScene {

    let defaults = UserDefaults.standard

    override func didMove(to view: SKView) {

        self.setBackgroundTilesImageNamed("red_tiles")

        let homeAtlas = SKTextureAtlas(named: "home")

        // 设置菜单
        let settingMenuItem = WKSpriteButton(normalTexture: homeAtlas.textureNamed("buttonSetting"),
                selectedTexture: homeAtlas.textureNamed("buttonSettingOn"),
                callback: #selector(touchedSettingMenuItem))
        settingMenuItem.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(settingMenuItem)

        // 开始菜单
        let startMenuItem = WKSpriteButton(normalTexture: homeAtlas.textureNamed("buttonStart"),
                selectedTexture: homeAtlas.textureNamed("buttonStartOn"),
                callback: #selector(touchedStartMenuItem))
        startMenuItem.position = CGPoint(x: self.frame.midX, y: settingMenuItem.position.y + 80)
        self.addChild(startMenuItem)

        // 帮助菜单
        let helpMenuItem = WKSpriteButton(normalTexture: homeAtlas.textureNamed("buttonHelp"),
                selectedTexture: homeAtlas.textureNamed("buttonHelpOn"),
                callback: #selector(touchedHelpMenuItem))
        helpMenuItem.position = CGPoint(x: self.frame.midX, y: settingMenuItem.position.y - 80)
        self.addChild(helpMenuItem)

        //设置背景音乐
        if defaults.bool(forKey: Configuration.MusicKey) {
            WKSoundHelper.playMusic(self, fileNamed: Configuration.HomeMusic)
        }

    }

    func touchedStartMenuItem() {
        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect, completion: { () -> Void in
                let doors = SKTransition.doorsOpenHorizontal(withDuration: 1.0)
                let scene = GamePlayScene(fileNamed: "GamePlayScene")
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: doors)
            })
        } else {
            let doors = SKTransition.doorsOpenHorizontal(withDuration: 1.0)
            let scene = GamePlayScene(fileNamed: "GamePlayScene")
            scene!.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: doors)
        }
    }

    func touchedSettingMenuItem() {
        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect, completion: { () -> Void in
                let doors = SKTransition.doorsOpenHorizontal(withDuration: 1.0)
                let scene = SettingScene(fileNamed: "SettingScene")
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: doors)
            })
        } else {
            let doors = SKTransition.doorsOpenHorizontal(withDuration: 1.0)
            let scene = SettingScene(fileNamed: "SettingScene")
            scene!.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: doors)
        }
    }

    func touchedHelpMenuItem() {
        if defaults.bool(forKey: Configuration.SoundKey) {
            WKSoundHelper.playSoundEffect(self, fileNamed: Configuration.TapSoundEffect, completion: { () -> Void in
                let doors = SKTransition.doorsOpenHorizontal(withDuration: 1.0)
                let scene = HelpScene(fileNamed: "HelpScene")
                scene!.scaleMode = .aspectFill
                self.view?.presentScene(scene!, transition: doors)
            })
        } else {
            let doors = SKTransition.doorsOpenHorizontal(withDuration: 1.0)
            let scene = HelpScene(fileNamed: "HelpScene")
            scene!.scaleMode = .aspectFill
            self.view?.presentScene(scene!, transition: doors)
        }
    }
}
