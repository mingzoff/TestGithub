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
             // 本项目因为要缓存model种生成的时间 所以在这里缓存不合适
            
        }, onError: { (error) in
            //网络请求失败 可以显示缓存数据 根据实际情况来操作
        }
        
        ).map(HomeGitHubModel.self)

    }
    
    
}
