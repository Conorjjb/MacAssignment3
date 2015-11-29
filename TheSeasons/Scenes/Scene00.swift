//
//  Scene00.swift
//  TheSeasons
//
//  Created by Jorge Jordán Arenas on 22/1/15.
//  Copyright (c) 2015 Raywenderlich. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class Scene00: SeasonsSceneBase {

  // MARK: -
  // MARK: Scene Setup and Initialize

  override func didMoveToView(view: SKView) {
    homeFooter = true

    playBackgroundMusic("title_bgMusic.mp3")

    let background = SKSpriteNode(imageNamed: "bg_title_page")
    background.anchorPoint = CGPoint(x: 0, y: 0)
    background.position = .zero

    addChild(background)

    setUpBookTitle()
    setUpFooter()
  }

  // MARK: -
  // MARK: Additional Scene Setup (sprites and such)

  func setUpBookTitle() {
    let bookTitle = SKSpriteNode(imageNamed: "title_text")
    bookTitle.name = "bookTitle"

    bookTitle.position = CGPoint(x: 425, y: 900)
    addChild(bookTitle)

    let actionMoveDown = SKAction.moveToY(600, duration: 3.0)
    let actionMoveUp = SKAction.moveToY(603, duration: 0.25)
    let actionMoveDownFast = SKAction.moveToY(600, duration: 0.25)

    let wait = SKAction.waitForDuration(0.75)

    let showButton = SKAction.runBlock {

      let buttonStart = SKSpriteNode(imageNamed: "button_read")
      buttonStart.name = "buttonStart"

      buttonStart.position = CGPoint(x: 425,y: 460)
      buttonStart.zPosition = 1

      self.addChild(buttonStart)

      buttonStart.runAction(SKAction.playSoundFileNamed("thompsonman_pop.wav", waitForCompletion: false))
    }

    bookTitle.runAction(SKAction.sequence([actionMoveDown, actionMoveUp, actionMoveDownFast, wait, showButton]))
  }

  // MARK: -
  // MARK: Touch Events

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)

    // Make sure the start button has been added.
    if let startButton = childNodeWithName("buttonStart") {

      /* Called when a touch begins */
      for touch in touches {
        let location = touch.locationInNode(self)

        if startButton.containsPoint(location) {
          goToScene(Scene01(size: size))
        }
      }
    }
  }

  // MARK: -
  // MARK: Game Loop

  override func update(currentTime: CFTimeInterval) {


  }
}