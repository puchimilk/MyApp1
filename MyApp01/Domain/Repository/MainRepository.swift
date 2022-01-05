//
//  MainRepository.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import RxSwift

protocol MainRepository {
    func getEntity() -> Single<[MainEntity]>
}
