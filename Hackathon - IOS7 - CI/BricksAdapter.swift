//
//  BricksAdapter.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 4/9/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

protocol BricksAdapter {
    func getNode(row : Int, col : Int) -> Brick?
}
