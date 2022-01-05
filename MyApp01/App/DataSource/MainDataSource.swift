//
//  MainDataSource.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import UIKit

protocol MainDelegate: NSObjectProtocol {
    // ...
}

class MainDataSource: NSObject {
    weak var delegate: MainDelegate?
    private var viewData: MainViewData?
    
    func initWithData(_ viewData: MainViewData) {
        print("TEST: DataSource - initWith()")
        self.viewData = viewData
    }
}

extension MainDataSource: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("DataSource - numberOfRowsInSection(): ")
        return self.viewData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("DataSource - cellForRowAt - indexPath: \(indexPath.row)")
        
        guard let tableViewData = self.viewData else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        let x = tableViewData.get(indexPath.row)
        cell.setUp(title: x.title)
        print("TEST: \(tableViewData)")
        cell.separatorInset = .zero
        return cell
    }
    
}
