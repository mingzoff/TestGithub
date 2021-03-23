//
//  HomeViewReactor.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

final class HomeViewReactor: Reactor {
    
   
    enum Action {
        //界面发起加载数据
        case loadDataFromWeb
    }
    
    enum Mutation {
        //添加服务端返回的数据
        case appendServerData(HomeGitHubModel)
    }
    
    struct State {
        var sections: [HomeGitHubModel]?
    }
    
    let initialState: State

    let homeService: HomeServiceType

    init(homeService:HomeServiceType) {
        
        defer { _ = self.state }
        self.homeService = homeService
        //初始化必须加上
        self.initialState = State()

    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case  .loadDataFromWeb:
            return self.homeService.getGitHubMessage().asObservable().map {.appendServerData($0)}
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .appendServerData(let model):
            //从服务端拿到数据
            state.sections?.append(model)
            return state
        }
    }

}
