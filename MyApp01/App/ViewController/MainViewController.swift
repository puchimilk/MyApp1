//
//  ViewController.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import UIKit

class MainViewControllerFactory: NSObject {
    
    static func create() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: MainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        let repository = MainRepositoryImpl()
        let usecase = MainUseCaseImpl(repository: repository)
        
        viewController.presenter = MainPresenter(view: viewController,
                                                 usecase: usecase)
        
        return viewController
    }
    
}

// 渡す
class MainViewController: UIViewController, MainViewable, MainDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var presenter: MainPresentable?
    private let datasource: MainDataSource = MainDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TEST: [viewDidLoad]")
        // presenter
        self.presenter?.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TEST: [viewWillAppear]")
        // presenter
        self.presenter?.willAppear()
        
        //let viewData = MainViewData(list: [MainListViewData(title: "ABC")])
        //self.initWithData(viewData: viewData)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TEST: [viewDidAppear]")
        
        self.presenter?.didAppear()
    }
    
    func setTableView() {
        print("TEST: ViewController - setTableView()")
        self.tableView.delegate = self.datasource
        self.tableView.dataSource = self.datasource
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
        self.datasource.delegate = self
        
        self.tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
    
    func initWithData(viewData: MainViewData) {
        print("TEST: ViewController - initWithData()")
        self.datasource.initWithData(viewData)
    }
}
