//
//  Scene02.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 23/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation


class page3: SceneBase {
    
    // MARK: -
    // MARK: Scene Setup and Initialize
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        /* set up Sound */
        playBackgroundMusic("pg02_bgMusic.mp3")
        
        /* set up Art*/
        
        let page3 = SKSpriteNode(imageNamed: "page3")
        page3.anchorPoint = CGPoint(x: 0, y: 0)
        page3.position = .zero
        self.addChild(page3)
               
        let lonelyO = SKSpriteNode(imageNamed: "LONELY_O")
        lonelyO.name = "lonelyO"
        lonelyO.position = CGPoint(x: 0,y: 210)
        lonelyO.zPosition = 1
        self.addChild(lonelyO)
        
        let rock = SKSpriteNode(imageNamed: "rock")
        rock.name = "rock"
        rock.position = CGPoint(x: 700,y: 200)
        rock.zPosition = 2
        self.addChild(rock)
        
        let button = SKSpriteNode(imageNamed: "button")
        button.name = "button"
        button.position = CGPoint(x: 400,y: 60)
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
        label.position = CGPoint(x: 200, y: 10)
        label.zPosition = 4
        self.addChild(label)
        
      let text = SKSpriteNode(imageNamed: "page_3_text")
        text.position = CGPoint(x: 500 , y: 650)
        addChild(text)
        text.zPosition = 4
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let lonelyO = childNodeWithName("lonelyO")
        let rock = childNodeWithName("rock")
        // Make sure the start button has been added.
        if let nextPage = childNodeWithName("nextPage") {
            if let button = childNodeWithName("button"){
                
                /* Called when a touch begins */
                for touch in touches {
                    let location = touch.locationInNode(self)
                    
                    let actionMoveRight = SKAction.moveToX(1000, duration: 8.0)
                    let actionMoveUp = SKAction.moveToY(400, duration: 3.0)
                    if button.containsPoint(location) {
                        lonelyO!.runAction(SKAction.sequence([actionMoveRight]))
                        rock!.runAction(SKAction.sequence([actionMoveUp]))

                    }
                    
                    if nextPage.containsPoint(location) {
                        goToScene(Page4(size: size))
                    }
                }
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}

