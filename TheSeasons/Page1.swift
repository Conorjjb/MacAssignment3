//
//  Page1.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 23/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//  Edited by Conor Burke 20062067

import Foundation
import UIKit
import SpriteKit
import AVFoundation



class page1: SceneBase {

    // MARK: -
    // MARK: Scene Setup and Initialize
    
    func createAssests(){
        
        
        /* add background image */
        
        let page1 = SKSpriteNode(imageNamed: "Page1")
        page1.anchorPoint = CGPoint(x: 0, y: 0)
        page1.position = .zero
        addChild(page1)
        
        // adding assets
        let lonelyO = SKSpriteNode(imageNamed: "LONELY_O")
        lonelyO.name = "lonelyO"
        lonelyO.position = CGPoint(x: 0,y: 200)
        lonelyO.zPosition = 4
        addChild(lonelyO)
        
        let cloud = SKSpriteNode(imageNamed: "page1_cloud")
        cloud.name = "cloud"
        cloud.position = CGPoint(x: 650,y: 200)
        cloud.zPosition = 5
        addChild(cloud)
        
        let text = SKSpriteNode(imageNamed: "page_1_text")
        text.position = CGPoint(x: 680 , y: 530)
         text.zPosition = 4
        addChild(text)
        
        let nextPage = SKSpriteNode(imageNamed: "arrow_right")
        nextPage.name = "nextPage"
        nextPage.position = CGPoint(x: 1000,y: 10)
        nextPage.zPosition = 4
        self.addChild(nextPage)
        
        
         addRain()
        
    }
    
    override func didMoveToView(view: SKView) {
        
       
        super.didMoveToView(view)
        createAssests()
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addRain),
                SKAction.waitForDuration(0.1)
                ])
            ))
        
        
        /* set up Sound */
        playBackgroundMusic("pg02_bgMusic.mp3")
        
        let lonelyO = childNodeWithName("lonelyO")
        let actionMoveRight = SKAction.moveToX(1000, duration: 7.0)
        lonelyO!.runAction(SKAction.sequence([actionMoveRight]))
        
    }

    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addRain() {
        
        // Create sprite
        let rainDrop = SKSpriteNode(imageNamed: "rainDrop02")
        rainDrop.zPosition = 4
        let actualY = random(min: rainDrop.size.height/2, max: size.height - rainDrop.size.height/2)
        
        // position of rain created
          rainDrop.position = CGPoint(x: CGFloat.random() * size.height, y: size.height + size.height/2)
        
        // Add the rain to the scene
        addChild(rainDrop)
        
        // Determine speed of the rain
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
      //actions
        let actionMove = SKAction.moveTo(CGPoint(x: -rainDrop.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        rainDrop.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        
        //  button has been added.
        if let nextPage = childNodeWithName("nextPage") {
       
                
                /* Called when a touch begins */
                for touch in touches {
                    let location = touch.locationInNode(self)
                    if nextPage.containsPoint(location) {
                        goToScene(page2(size: size))
                    }
                }
            }
        }
    
    // MARK: Game Loop
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}