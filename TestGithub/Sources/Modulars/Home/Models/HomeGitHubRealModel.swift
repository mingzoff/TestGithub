//
//  HomeGitHubRealModel.swift
//  TestGithub
//
//  Created by zoff on 2021/3/24.
//


import RealmSwift

final class HomeGitHubRealModel: Object {

    @objc dynamic var modelJsonString: String? = nil
    @objc dynamic var key: String = ""
    
    //设置数据库主键
    override static func primaryKey() -> String? {
        return "key"
    }
}
