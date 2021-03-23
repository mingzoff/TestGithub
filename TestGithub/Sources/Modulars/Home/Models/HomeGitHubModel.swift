//
//  HomeGitHubModel.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//

import HandyJSON
import ObjectMapper


struct HomeGitHubModel: ImmutableMappable {
    //暂时解析这些字段
    var  current_user_url :String?
    var  current_user_authorizations_html_url:String?
    var  authorizations_url:String?
    var  code_search_url:String?
    var  commit_search_url:String?
    var  create_time : NSDate = NSDate.init(timeIntervalSinceNow: 0)
    

    init(map: Map) throws {
        current_user_authorizations_html_url = try map.value("current_user_authorizations_html_url")
        current_user_url = try map.value("current_user_url")
        authorizations_url = try map.value("authorizations_url")
        code_search_url = try map.value("code_search_url")
        commit_search_url = try map.value("commit_search_url")
    }
}
