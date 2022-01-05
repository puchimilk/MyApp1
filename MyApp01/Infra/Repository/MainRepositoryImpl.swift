//
//  MainRepositoryImpl.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import Alamofire
import RxSwift

public class MainRepositoryImpl: MainRepository {
    
    // MARK: - getEntity() -> Single<[MainEntity]>
    public func getEntity() -> Single<[MainEntity]> {
        print("TEST: Repository - getEntity()")
        let urlString = "https://qiita.com/api/v2/items"
        return Single.create { subscriber in
            AF.request(urlString)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        if let data = response.data {
                            do {
                                let entity = try JSONDecoder().decode([MainEntity].self, from: data)
                                print("TEST: Repository - getEntity() -> subscriber()")
                                subscriber(.success(entity))
                            } catch {
                                print("Error: \(error)")
                                subscriber(.failure(NSError()))
                            }
                        }
                    case .failure(let error):
                        print("Error: \(error)")
                        subscriber(.failure(NSError()))
                    }
                }
            return Disposables.create()
        }
    }
    
}
