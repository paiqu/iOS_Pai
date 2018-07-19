//
//  appData.swift
//  TrackApp
//
//  Created by Pai Qu on 7/18/18.
//  Copyright © 2018 Pai Qu. All rights reserved.
//

import Foundation

struct info:Codable {
    let name: String
    let dateBegin: Date
    let dateFinish: Date
}


func getTaskList() -> [info]{
    if let data = UserDefaults.standard.value(forKey:"taskList") as? Data {
        let out = try? PropertyListDecoder().decode(Array<info>.self, from: data)
        return out!
    }else{
        print("return empty")
        return []
    }
}

func save2TaskList(obj: info){
    print("save 2 list")
    var lst = getTaskList()
    lst.append(obj)
    UserDefaults.standard.set(try? PropertyListEncoder().encode(lst), forKey:"taskList")
}

func clearInfo(){
    UserDefaults.standard.set([], forKey: "taskList")
}

