//
//  File.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 4/9/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class Event {
    func invisiblePaddle(node : SKSpriteNode) -> Void {
        node.run(.sequence([.fadeOut(withDuration: 0.1), .wait(forDuration: 3), .fadeIn(withDuration: 0.1)]))
    }
    
    func fire() -> Void {
        let node = Bullets(imageNamed: "bullet.png")
        node.size = CGSize(width: 1, height: 3)
        
        node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
        node.physicsBody?.categoryBitMask
        node.physicsBody?.contactTestBitMask
    }
}
