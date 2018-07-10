//
//  AppData.swift
//  Tap App
//
//  Created by Pai Qu on 7/6/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import Foundation



func savePlayerName(_ name: String, key: String){
    UserDefaults.standard.set(name, forKey: key)
}

func getPlayerName(_ key: String) -> String{
    return UserDefaults.standard.string(forKey: key) ?? key
}


func saveWinnerName(name: String){
    var lst = getWinnerList()
    lst.append(name)
    UserDefaults.standard.set(lst, forKey: "winnerList")
}

func removeWinnerName(index: Int){
    var lst = getWinnerList()
    lst.remove(at: index)
    UserDefaults.standard.set(lst, forKey: "winnerList")
}


func getWinnerList() -> [String]{
    return UserDefaults.standard.stringArray(forKey: "winnerList") ?? [String]()
}

func clearInfo(){
     UserDefaults.standard.set([], forKey: "winnerList")
}

func listToDic(lst: [String]) -> [String:Int]{
    var dic = [String:Int]()
    var bestPlayer = ""
    var mostWins = 0
    for x in lst{
        if dic[x] == nil{
            dic[x] = 0
        }
        
        let numWins = dic[x]! + 1
        dic[x] = numWins
        
        if numWins > mostWins{
            bestPlayer = x
            mostWins = numWins
        }
    }
    return dic
}

//func cleanDict(dic: [String:Int]){
//    dic
//}



