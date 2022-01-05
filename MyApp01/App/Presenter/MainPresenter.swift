//
//  MainPresenter.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import RxSwift

// 貰う
class MainPresenter: MainPresentable {
    
    private var view: MainViewable?
    private var usecase: MainUseCase
    
    private let disposeBag = DisposeBag()
    
    // MARK: - init(view:, usecase:)
    init(view: MainViewable,
         usecase: MainUseCase) {
        self.view = view
        self.usecase = usecase
    }
    
    // MARK: - didLoad()
    func didLoad() {
        print("TEST: Presenter - didLoad()")
        // view(画面描画系)
        self.view?.setTableView()
        let viewData = MainViewData(list: [MainListViewData(title: "ABCD")])
        self.view?.initWithData(viewData: viewData)
    }
    
    // MARK: - willAppear()
    func willAppear() {
        print("TEST: Presenter - willAppear()")
        //let viewData = MainViewData(list: [MainListViewData(title: "ABCD")])
        //self.view?.initWithData(viewData: viewData)
        //self.fetch()
        
        // usecase
        
        self.usecase.fetchModel()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { model in
                print("Presenter - fetchModel() - subscriber()")
                var list: [MainListViewData] = []
                model.forEach {
                    list.append(MainListViewData(title: $0.title))
                }
                self.view?.initWithData(viewData: MainViewData(list: list))
                //self.abc()
                //let title = "ABCDE"
                //let list = [MainListViewData(title: title)]
                //let viewData = MainViewData(list: list)
                //self.view?.initWithData(viewData: viewData)
                /*
                var list: [MainListViewData] = []
                model.forEach {
                    list.append(MainListViewData(title: $0.title))
                }
                */
                //let viewData: MainViewData = MainViewData(list: list)
                //self.usecase.fetchViewData(list: list)
                //print("viewData: \(viewData)")
                
                // viewdata -> MainViewData
                //self.view?.initWithData(viewData: MainViewData(model: MainModel(title: "ABC")))
                //let list: [MainViewData] = []
                /*
                var list: [MainListViewData] = []
                model.forEach {
                    list.append(MainListViewData(title: $0.title))
                }
                */
                // datasource
                //let x = MainListViewData(list: list).get(0)
                // cell
                //let y = x.title
                //print("TEST: \(x.title)")
                //self.view?.initWithData(viewData: MainViewData(list: list))
            })
            .disposed(by: self.disposeBag)
        
    }
    
    func didAppear() {
        print("TEST: Presenter - didAppear()")
        //let viewData = MainViewData(list: [MainListViewData(title: "ABCD")])
        //self.view?.initWithData(viewData: viewData)
    }
    
    func fetch() {
        print("TEST: Presenter - fetch()")
        self.usecase.fetchModel()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { model in
                print("TEST: Presenter - fetchModel() - fetch()")
                var list:[MainListViewData] = []
                model.forEach {
                    list.append(MainListViewData(title: $0.title))
                }
                self.view?.initWithData(viewData: MainViewData(list: list))
                print("TEST: \(list)")
                //let viewData = MainViewData(list: [MainListViewData(title: "ABCD")])
                //self.view?.initWithData(viewData: viewData)
                //let title = "ABCDE"
                //let list = [MainListViewData(title: title)]
                //let viewData = MainViewData(list: list)
                //self.view?.initWithData(viewData: viewData)
                /*
                var list: [MainListViewData] = []
                model.forEach {
                    list.append(MainListViewData(title: $0.title))
                }
                */
                //let viewData: MainViewData = MainViewData(list: list)
                //self.usecase.fetchViewData(list: list)
                //print("viewData: \(viewData)")
                
                // viewdata -> MainViewData
                //self.view?.initWithData(viewData: MainViewData(model: MainModel(title: "ABC")))
                //let list: [MainViewData] = []
                /*
                var list: [MainListViewData] = []
                model.forEach {
                    list.append(MainListViewData(title: $0.title))
                }
                */
                // datasource
                //let x = MainListViewData(list: list).get(0)
                // cell
                //let y = x.title
                //print("TEST: \(x.title)")
                //self.view?.initWithData(viewData: MainViewData(list: list))
            })
            .disposed(by: self.disposeBag)
    }
    
}
