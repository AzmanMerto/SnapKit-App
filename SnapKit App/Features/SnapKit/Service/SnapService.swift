//
//  SnapService.swift
//  SnapKit App
//
//  Created by NomoteteS on 6.01.2023.
//

import Alamofire

enum SnapServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol ISnapService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void )
}

struct SnapService: ISnapService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(SnapServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}
