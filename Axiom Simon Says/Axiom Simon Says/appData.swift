//
//  appData.swift
//  Axiom Simon Says
//
//  Created by Pai Qu on 7/10/18.
//  Copyright © 2018 Axiom. All rights reserved.
//

import Foundation

func saveHighestScore(num: Int){
    UserDefaults.standard.set(num, forKey: "highScore")
}


func getHighestScore() -> Int{
    return UserDefaults.standard.integer(forKey: "highScore")
}



