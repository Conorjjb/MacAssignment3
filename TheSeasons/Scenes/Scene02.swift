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

class Scene02: SeasonsSceneBase {
  private var cat = SKSpriteNode(imageNamed: "pg02_cat")
  private var catSound = SKAction.playSoundFileNamed("cameronmusic_meow.wav", waitForCompletion: false)

  // MARK: -
  // MARK: Scene Setup and Initialize

  override func didMoveToView(view: SKView) {
    super.didMoveToView(view)

    /* set up Sound */
    playBackgroundMusic("pg02_bgMusic.mp3")

    /* add background image */

    let background: SKSpriteNode? = SKSpriteNode(imageNamed:"bg_pg02", normalMapped:false)
    background?.anchorPoint = .zero
    background?.position = .zero

    addChild(background!)

    /* add the cat (you don't always need a seperate method) */

    cat.anchorPoint = .zero
    cat.position = CGPoint(x: 240, y: 84)

    addChild(cat)

    /* make 'em meow! */

    let wait = SKAction.waitForDuration(0.86)
    let catSoundInitial = SKAction.playSoundFileNamed("thegertz_meow.wav", waitForCompletion: false)

    cat.runAction(SKAction.sequence([wait, catSoundInitial]))

    setUpText()
    setUpFooter()
  }

  // MARK: -
  // MARK: Standard Scene Setup

  func setUpText() {
    /* add the story text */

    let text = SKSpriteNode(imageNamed: "pg02_text")
    text.position = CGPoint(x: 680 , y: 530)

    addChild(text)

    readText()
  }

  func readText() {
    if actionForKey("readText") == nil {
      let readPause = SKAction.waitForDuration(0.25)
      let readText = SKAction.playSoundFileNamed("pg02.wav", waitForCompletion: true)

      let readSequence = SKAction.sequence([readPause, readText])

      runAction(readSequence, withKey:"readText")
    } else {
      removeActionForKey("readText")
    }

  }

  // MARK: -
  // MARK: Code For Sound & Ambiance

  func playCatSound() {
    cat.runAction(catSound)
  }

  // MARK: -
  // MARK: Touch Events

  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)

    for touch in touches {
      let location = touch.locationInNode(self)
      if location.x >= 300 && location.x < 480 && location.y >= 100 && location.y <= 350 {
        playCatSound()
      }
    }
  }

  override func getNextScene() -> SKScene? {
    return Scene03(size: size)
  }

  override func getPreviousScene() -> SKScene? {
    return Scene01(size: size)
  }

  // MARK: -
  // MARK: Game Loop

  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}