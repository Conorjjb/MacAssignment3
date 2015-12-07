//
//  Scene00.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 22/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//  Edited by Conor Burke 20062067

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class Scene00: SceneBase {

  // MARK: -
  // MARK: Scene Setup and Initialize

  override func didMoveToView(view: SKView) {
    homeFooter = true

    playBackgroundMusic("title_bgMusic.mp3")

    let background = SKSpriteNode(imageNamed: "book_title_page")
    background.anchorPoint = CGPoint(x: 0, y: 0)
    background.position = .zero

    addChild(background)

    setUpBookTitle()
  }

  // MARK: -
  // MARK: Additional Scene Setup (sprites and such)

  func setUpBookTitle() {
    let bookTitle = SKSpriteNode(imageNamed: "book_title")
    bookTitle.name = "bookTitle"

    bookTitle.position = CGPoint(x: 500, y: 595)
    addChild(bookTitle)
    bookTitle.zPosition = 2

    //let actionMoveDown = SKAction.moveToY(600, duration: 3.0)
    //let actionMoveUp = SKAction.moveToY(603, duration: 0.25)
    let actionMoveDownFast = SKAction.moveToX(850, duration: 7.0)
   
    
    
    let lonelyO = SKSpriteNode(imageNamed: "LONELY_O")
    lonelyO.name = "lonelyO"
    lonelyO.position = CGPoint(x: 325,y: 595)
    lonelyO.zPosition = 1
    self.addChild(lonelyO)
    
    //let wait = SKAction.waitForDuration(0.7)

    let showButton = SKAction.runBlock {

      let startButton = SKSpriteNode(imageNamed: "startButton")
        startButton.name = "startButton"

      startButton.position = CGPoint(x: 512,y: 400)
      startButton.zPosition = 1

      self.addChild(startButton)

      startButton.runAction(SKAction.playSoundFileNamed("thompsonman_pop.wav", waitForCompletion: false))
    }

    //lonelyO.runAction(SKAction.sequence([actionMoveDownFast, wait, showButton]))
    
    lonelyO.runAction(SKAction.sequence([showButton,actionMoveDownFast]))
  }

  // MARK: -
  // MARK: Touch Events

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)

    // Make sure the start button has been added.
    if let startButton = childNodeWithName("startButton") {

      /* Called when a touch begins */
      for touch in touches {
        let location = touch.locationInNode(self)

        if startButton.containsPoint(location) {
          goToScene(page1(size: size))
        }
      }
    }
  }

  // MARK: -
  // MARK: Game Loop

  override func update(currentTime: CFTimeInterval) {


  }
}