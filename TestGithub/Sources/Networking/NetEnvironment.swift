//
//  NetEnvironment.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//


enum HttpRequest {
    case appres
}

extension HttpRequest {
    
    var path: String {
        switch self
        {
         case .appres:
            return "https://api.guihub.com/"
        }
    }
}

