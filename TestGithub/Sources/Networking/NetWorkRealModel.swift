//
//  NetWorkRealModel.swift
//  TestGithub
//
//  Created by zoff on 2021/3/24.
//

import RealmSwift

final class NetWorkRealModel: Object {

    @objc dynamic var requetDate: Date  = Date.init(timeIntervalSinceNow: 0)
    @objc dynamic var responseDate: Date? = nil
    @objc dynamic var requetURL:  String? = nil
    @objc dynamic var requetResult:  Bool = true //是否请求成功
    @objc dynamic var requetError:  String? = nil //请求失败原因
    @objc dynamic var stateCode:  Int = 200
    @objc dynamic var key: String = ""
    
    //设置数据库主键
    override static func primaryKey() -> String? {
        return "key"
    }
}
