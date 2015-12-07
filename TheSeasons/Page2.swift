//
//  Scene02.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 23/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//  Edited by Conor Burke 20062067

import Foundation
import UIKit
import SpriteKit
import AVFoundation


class page2: SceneBase {
    
    // MARK: Scene Setup and Initialize
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addSnow),
                SKAction.waitForDuration(0.1)
                ])
            ))
        
        
        /* set up Sound */
        playBackgroundMusic("pg02_bgMusic.mp3")
        
        // add background image
        
        let page2 = SKSpriteNode(imageNamed: "page2Background")
        page2.anchorPoint = CGPoint(x: 0, y: 0)
        page2.position = .zero
        self.addChild(page2)
        
        // add sprites
        
        let snowDrift = SKSpriteNode(imageNamed: "page2Foreground")
        snowDrift.name = "snowDrift"
        snowDrift.position = CGPoint(x: 500,y:160)
        snowDrift.zPosition = 2
        self.addChild(snowDrift)
        
        let lonelyO = SKSpriteNode(imageNamed: "LONELY_O")
        lonelyO.name = "lonelyO"
        lonelyO.position = CGPoint(x: 0,y: 200)
        lonelyO.zPosition = 1
        self.addChild(lonelyO)
        
        let button = SKSpriteNode(imageNamed: "button")
        button.name = "button"
        button.position = CGPoint(x: 500,y: 60)
        button.zPosition = 4
        self.addChild(button)
        
        
        let nextPage = SKSpriteNode(imageNamed: "arrow_right")
        nextPage.name = "nextPage"
        nextPage.position = CGPoint(x: 1000,y: 10)
        nextPage.zPosition = 4
        self.addChild(nextPage)
        
        let label = SKLabelNode(fontNamed: "Thonburi-Bold")
        label.text = "press the button to help O"
        label.fontSize = 20.0
        label.fontColor = UIColor.blackColor()
        label.position = CGPoint(x: 240, y: 10)
        label.zPosition = 4
        self.addChild(label)
        
        let text = SKSpriteNode(imageNamed: "page_2_text")
        text.position = CGPoint(x: 530 , y: 650)
        text.zPosition = 4
        self.addChild(text)
        
        let actionMoveRight = SKAction.moveToX(100, duration: 3.0)
        let actionMoveback = SKAction.moveToX(0, duration: 5.0)
        lonelyO.runAction(SKAction.sequence([actionMoveRight,actionMoveback]))
        
    }
    
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addSnow() {
        
        // Create sprite
        let snowflake = SKSpriteNode(imageNamed: "snowflake")
        snowflake.zPosition = 3
        // snow spawns off the screen
        let actualY = random(min: snowflake.size.height/2, max: size.height - snowflake.size.height/2)
        
       // snow spawns at random positions
        snowflake.position = CGPoint(x: size.width + snowflake.size.width/2, y: actualY)
     
        
        // add snow
        self.addChild(snowflake)
        
        // speex of snow
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        //  actions
        let actionMove = SKAction.moveTo(CGPoint(x: -snowflake.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        snowflake.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let lonelyO = childNodeWithName("lonelyO")
        
        // button has been added.
        if let nextPage = childNodeWithName("nextPage") {
            if let button = childNodeWithName("button"){
                
                /* Called when a touch begins */
                for touch in touches {
                    let location = touch.locationInNode(self)
                    
                    let actionMoveRight = SKAction.moveToX(1000, duration: 7.0)
                    if button.containsPoint(location) {
                        lonelyO!.runAction(SKAction.sequence([actionMoveRight]))
                    }
                    
                    if nextPage.containsPoint(location) {
                        goToScene(page3(size: size))
                    }
                }
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}

