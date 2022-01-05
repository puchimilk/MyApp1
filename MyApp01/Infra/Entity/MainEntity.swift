//
//  MainEntity.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

public struct MainEntity: Codable {
    public let title: String
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}
