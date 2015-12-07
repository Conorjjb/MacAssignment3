//
//  Scene01.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 22/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class Page4: SceneBase {
    private var lonelyO = SKSpriteNode(imageNamed: "LONELY_O")
    let Home = SKSpriteNode(imageNamed: "Home")
    private var touchingO = false
    private var touchPoint: CGPoint?
    
    // MARK: -
    // MARK: Scene Setup and Initialize
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        /* set up Sound */
        playBackgroundMusic("pg01_bgMusic.mp3")
        
        /* add background image */
        
        let background: SKSpriteNode? = SKSpriteNode(imageNamed:"Page1")
        background?.anchorPoint = .zero
        background?.position = .zero
        addChild(background!)
        
        
        let Home = SKSpriteNode(imageNamed: "Home")
        Home.name = "Home"
        Home.position = CGPoint(x: 560,y: 335)
        Home.zPosition = 3
        self.addChild(Home)
        
        let nextPage = SKSpriteNode(imageNamed: "arrow_right")
        nextPage.name = "nextPage"
        nextPage.position = CGPoint(x: 1000,y: 10)
        nextPage.zPosition = 4
        self.addChild(nextPage)
        
        
        let text = SKSpriteNode(imageNamed: "page_4_text")
        text.position = CGPoint(x: 300 , y: 530)
        addChild(text)
        
        setlonelyO()
        
        /* additional setup */
     
    }
    
   
    func setlonelyO() {
        let label = SKLabelNode(fontNamed: "Thonburi-Bold")
        label.text = "put O home!"
        label.fontSize = 20.0
        label.fontColor = UIColor.yellowColor()
        label.position = CGPoint(x: 160, y: 180)
        label.zPosition = 3
        addChild(label)
        
        lonelyO.position = CGPoint(x: 150, y: 290)
        lonelyO.physicsBody = SKPhysicsBody(rectangleOfSize: lonelyO.size)
        lonelyO.physicsBody?.restitution = 0.5
        lonelyO.zPosition = 3
        
        addChild(lonelyO)
    }
    
    // MARK: -
    // MARK: Touch Events
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        if let nextPage = childNodeWithName("nextPage") {
            
            for touch in touches {
            let location = touch.locationInNode(self)
                
                if nextPage.containsPoint(location) {
                    goToScene(Scene00(size: size))
                }
            
            if lonelyO.containsPoint(location) {
                touchingO = true
                touchPoint = location
                
                /* change the physics or the hat is too 'heavy' */
                
                lonelyO.physicsBody?.velocity = CGVectorMake(0, 0)
                lonelyO.physicsBody?.angularVelocity = 0
                lonelyO.physicsBody?.affectedByGravity = false
            }
        }
    }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first! as? UITouch {
            touchPoint = touch.locationInNode(self)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first! as? UITouch where touchingO {
            var currentPoint: CGPoint! = touch.locationInNode(self)
            
            if currentPoint.x >= 300 && currentPoint.x <= 550 && currentPoint.y >= 250 && currentPoint.y <= 400 {
                currentPoint.x = 420
                currentPoint.y = 330
                
                lonelyO.position = currentPoint
                
                let popSound = SKAction.playSoundFileNamed("thompsonman_pop.wav", waitForCompletion: false)
                lonelyO.runAction(popSound)
            } else {
                lonelyO.physicsBody?.affectedByGravity = true
            }
            touchingO = false
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        touchingO = false
        lonelyO.physicsBody?.affectedByGravity = true
    }
    
    
    // MARK: -
    // MARK: Game Loop
    
    override func update(currentTime: CFTimeInterval) {
        if touchingO {
            if var touchPoint = touchPoint {
                touchPoint.x.clamp(lonelyO.size.width / 2, self.size.width - lonelyO.size.width / 2)
                touchPoint.y.clamp(footer.size.height + lonelyO.size.height / 2, self.size.height - lonelyO.size.height / 2)
                
                lonelyO.position = touchPoint
            }
        }
    }
    
}