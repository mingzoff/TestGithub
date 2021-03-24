//
//  HomeSerice.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//
import RxSwift

protocol HomeServiceType {
    //获取数据
    func getGitHubMessage() -> Single<HomeGitHubModel>
}


final class HomeService: HomeServiceType{
    
    private let networking : HomeNetworking
    
    init(networking:HomeNetworking) {
        self.networking = networking
    }
    
    func getGitHubMessage() -> Single<HomeGitHubModel> {

        return networking.request(.HomeGitHub).do(onSuccess: { (response) in
             //成功拿到数据，在subscribe 之前调用 这里可以操作一些事情 比如缓存网络数据
           
            
        }, onError: { (error) in
          
        }
        
        ).map(HomeGitHubModel.self)

    }
    
    
}
