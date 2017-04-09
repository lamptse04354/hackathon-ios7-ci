//
//  constants.swift
//  Hackathon - IOS7 - CI
//
//  Created by Admin on 3/29/17.
//  Copyright © 2017 Pham Lam. All rights reserved.
//

import Foundation

import SpriteKit

struct BitMask {
    static let ballCatelogy : UInt32 = 1<<0
    static let brickType1Catelogy : UInt32 = 1<<1
    static let paddleCatelogy : UInt32 = 1<<2
    static let bottomCatelogy : UInt32 = 1<<3
    static let brickType2Catelogy : UInt32 = 1<<4
    static let PaddleFireCatelogy : UInt32 = 1<<5
    static let CenterFireCategoly : UInt32 = 1<<6
    static let RemovePaddleCatelogy : UInt32 = 1<<7
    static let InvisiblePaddleCatelogy : UInt32 = 1<<8
}
