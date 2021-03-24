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
            //成功且下拉才缓存
           
            
      
        }, onError: { (error) in
          
        }).map(HomeGitHubModel.self)

    }
    
    
}
