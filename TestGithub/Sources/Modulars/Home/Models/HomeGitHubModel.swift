//
//  HomeGitHubModel.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//

import HandyJSON
import ObjectMapper


struct HomeGitHubModel: ImmutableMappable {
    var  message :String?
    var  documentation_url:String?

    init(map: Map) throws {
        message = try map.value("message")
        documentation_url = try map.value("documentation_url")

    }
}
