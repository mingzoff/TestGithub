//
//  NetWorking.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//



typealias HomeNetworking = Networking<HomeAPI>

final class Networking<Target: TargetType>: MoyaProvider<Target> {
    
    
    func request(
        _ target: Target,
        _ isCache: Bool = false,
        file: StaticString = #file,
        function: StaticString = #function,
        line: UInt = #line
    ) -> Single<Response> {
        let requestString = "\(target.method)  \(target.baseURL.absoluteString) \(target.path)"
        
        let uuid = UUID().uuidString
        //开始在这里记录网络的所有操作
        let requestRecord = NetWorkRealModel()
        requestRecord.requetURL = requestString
        requestRecord.key = uuid        
        return self.rx.request(target)
            .filterSuccessfulStatusCodes()
            .do(onSuccess: { (value) in
                let message = "SUCCESS: \(requestString) (\(value.statusCode))"
                log.debug(message, file: file, function: function, line: line)
                requestRecord.responseDate = Date(timeIntervalSinceNow: 0)
                RealmManager.addCanUpdate(requestRecord)//保存网络数据
            }, onError: {(error) in
                
                requestRecord.responseDate = Date(timeIntervalSinceNow: 0)
                requestRecord.requetResult = false;
                if let response = (error as? MoyaError)?.response {
                    requestRecord.stateCode = response.statusCode;
                    if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
                        let message = "FAILURE1: \(requestString) (\(response.statusCode))\n\(jsonObject)"
                        log.warning(message, file: file, function: function, line: line)
                    } else if let rawString = String(data: response.data, encoding: .utf8) {
                        let message = "FAILURE2: \(requestString) (\(response.statusCode))\n\(rawString)"
                        log.warning(message, file: file, function: function, line: line)
                    } else {
                        let message = "FAILURE3: \(requestString) (\(response.statusCode))"
                        log.warning(message, file: file, function: function, line: line)
                    }
                } else {
                    requestRecord.requetError = error.localizedDescription;
                    requestRecord.stateCode = -1; //暂时先写死
                    let message = "FAILURE4: \(requestString)\n\(error)"
                    log.warning(message, file: file, function: function, line: line)
                }
                RealmManager.addCanUpdate(requestRecord)//保存网络数据

            }, onSubscribed: {
                
                let message = "REQUEST: \(requestString)"
                log.debug(message, file: file, function: function, line: line)
            })
    }
    

    
}
