//
//  Array+shuffle.swift
//  Tap App
//
//  Created by Pai Qu on 7/5/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import Foundation

extension Array{
    mutating func shuffle(){
        for _ in 0..<self.count {
            sort{
                (_,_) in arc4random() < arc4random()
            }
        
        }
    }
}
