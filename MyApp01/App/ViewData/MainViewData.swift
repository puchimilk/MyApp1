//
//  MainViewData.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import Foundation

struct MainViewData {
    
    //private var list: [MainListViewData] = []
    private var list: [MainListViewData]
    
    var firstSection: [MainListViewData] = []
    
    /*
    init(list: [MainListViewData]) {
        // self.setList(model)
        self.list = list
    }
    */
    
    init(list: [MainListViewData]) {
        self.list = list
    }
    
    var count: Int {
        return self.list.count
    }
    
    
    func get(_ index: Int) -> MainListViewData {
        return self.list[index]
    }
    
    /*
    mutating func setList(_ model: MainModel) {
        self.firstSection.append(MainListViewData(title: model.title))
    }
    */
    
    /*
    mutating func fetchViewData(model: MainModel) {
        self.firstSection.append(MainListViewData(title: model.title))
    }
    */
}

struct MainListViewData {
    public var title: String
}
