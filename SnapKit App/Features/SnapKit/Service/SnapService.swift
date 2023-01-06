//
//  SnapService.swift
//  SnapKit App
//
//  Created by NomoteteS on 6.01.2023.
//

import Foundation

enum SnapoServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
}

protocol ISnapService {
    func fetchAllDatas()
}

struct SnapService: ISnapService {
    func fetchAllDatas() {
        <#code#>
    }
}
