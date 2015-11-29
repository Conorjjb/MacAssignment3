//
//  Scene04.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 24/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class Scene04: SeasonsSceneBase {
    
    // MARK: -
    // MARK: Scene Setup and Initialize
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        /* set up Sound */
        playBackgroundMusic("title_bgMusic.mp3")
        
        /* add background image */
        
        let background: SKSpriteNode? = SKSpriteNode(imageNamed:"to_be_continued", normalMapped:false)
        background?.anchorPoint = .zero
        background?.position = .zero
        
        addChild(background!)
        
        /* additional setup */
        
        setUpFooter()
    }
    
    override func getPreviousScene() -> SKScene? {
        return Scene03(size: size)
    }

    
    // MARK: -
    // MARK: Game Loop
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}