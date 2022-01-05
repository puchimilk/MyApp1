//
//  MainUseCaseImpl.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import RxSwift

class MainUseCaseImpl: MainUseCase {
    
    private let repository: MainRepository
    private let disposeBag = DisposeBag()
    
    public var model: MainModel?
    
    // MARK: - init(repository:)
    public init(repository: MainRepository) {
        self.repository = repository
    }
    
    // MARK: - fetchModel() -> Single<[MainModel]>
    public func fetchModel() -> Single<[MainModel]> {
        print("TEST: UseCase - fetchModel()")
        return Single.create { subscriber in
            self.repository.getEntity()
                .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .default))
                .observe(on: MainScheduler.instance)
                .subscribe(onSuccess: { entity in
                    print("TEST: UseCase - fetchModel() -> subscriber()")
                    var list: [MainModel] = []
                    entity.forEach {
                        list.append(MainModel(title: $0.title))
                    }
                    subscriber(.success(list))
                    
                    //print(entity)
                    //var list: [MainListViewData] = []
                    /*
                    entity.forEach {
                        list.append(MainListViewData(title: $0.title))
                    }
                    */
                    //print("UseCase - model")
                    //subscriber(.success(list))
                    /*
                    var list: [MainModel] = []
                    entity.forEach {
                        let model = MainModel(title: $0.title)
                        list.append(model)
                    }
                    //print("model: \(list)")
                    subscriber(.success(list))
                    */
                })
                .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
}
