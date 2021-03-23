//
//  HomeAPI.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//

import Foundation
import Moya

enum HomeAPI {
    case HomeGitHub
}


extension HomeAPI : TargetType{
    var baseURL: URL {
        
        return URL(string:HttpRequest.appres.path)!
    }
    
    var path: String {
        switch self {
        case .HomeGitHub:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .HomeGitHub:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
    
    
}
