//
//  MainUseCase.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import RxSwift

protocol MainUseCase {
    func fetchModel() -> Single<[MainModel]>
}
