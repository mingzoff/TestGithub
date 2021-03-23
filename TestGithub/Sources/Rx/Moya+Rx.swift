//
//  Moya+Rx.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//

import Moya
import RxSwift
import SwiftyJSON
import ObjectMapper


extension PrimitiveSequence where TraitType == SingleTrait, Element == Moya.Response {

    //数据解析
    func map<T: ImmutableMappable>(_ type: T.Type) -> PrimitiveSequence<TraitType, T> {
       return self
           .map { (response) -> T in
             let json = try JSON(data: response.data)
            if let data = json[RESULT_DATA].dictionaryObject {
                return try Mapper<T>().map(JSON: data)
            }else if let data = json[RESULT_RESULT].dictionaryObject {
                return try Mapper<T>().map(JSON: data)
            }
            else if let data = json.dictionaryObject {
                return try Mapper<T>().map(JSON: data)
            }
             throw RequestError.noDataKey
        }.do(onSuccess: { (_) in
            
        }, onError: { (error) in
            if error is MapError {
                log.error(error)
            }
        })
    }
    
    func map<T: ImmutableMappable>(_ type: T.Type) -> PrimitiveSequence<TraitType, [T]> {
        return self
            .map { response -> [T] in
                 let json = try JSON(data: response.data)
                 var jsonArray: [Any] = []
                 if let array = json[RESULT_DATA].arrayObject {
                    jsonArray = array
                 }else if let array = json[RESULT_RESULT].arrayObject {
                    jsonArray = array
                 }
                 else if let array = json.arrayObject {
                    jsonArray = array
                 }
                 else{
                    throw RequestError.noDataKey
                 }
                 guard let data = try? JSONSerialization.data(withJSONObject: jsonArray, options: JSONSerialization.WritingOptions.prettyPrinted),
                       let jsonString = String(data: data, encoding: String.Encoding.utf8)
                 else { throw RequestError.wrongData }
                
                 return try Mapper<T>().mapArray(JSONString: jsonString)
                
            }.do(onSuccess: { (_) in
                
            }, onError: { (error) in
                if error is MapError {
                    log.error(error)
                }
            })
    }
}
