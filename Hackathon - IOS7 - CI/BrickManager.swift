//
//  BrickManager.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 4/7/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

class BrickManager {
    var TopBricks : [Brick] = []
    var BotBricks : [Brick] = []
    
    func addTopBricks(node : Any) -> Void {
        TopBricks.append(node as! Brick)
    }
    
    func addBotBricks(node : Any) -> Void {
        BotBricks.append(node as! Brick)
    }
    
}
