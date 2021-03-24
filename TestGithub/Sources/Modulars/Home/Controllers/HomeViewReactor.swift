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
        case loadNextDataFromWeb

    }
    
    enum Mutation {
        //添加服务端返回的数据
        case firstLoadData(HomeGitHubModel)
        case appendServerData(HomeGitHubModel)
    }
    
    struct State {
        var sections: [HomeViewSection]?
        var listModels: [HomeGitHubModel] = []

    }
    
    let initialState: State
    var disposeBag = DisposeBag()
    let homeService: HomeServiceType

    
    init(homeService:HomeServiceType) {
        
        defer { _ = self.state }
        self.homeService = homeService
        //初始化必须加上
        self.initialState = State()

    }
    
    //处理Action动作
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case  .loadDataFromWeb:
            return self.homeService.getGitHubMessage().asObservable().map {.firstLoadData($0)}
        case  .loadNextDataFromWeb:
            return self.homeService.getGitHubMessage().asObservable().map {.appendServerData($0)}
        }
    }
    
    //处理回来的数据
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .firstLoadData(let model):
            //从服务端拿到数据
            //处理数据
            state.listModels.append(model)
            //构建HomeSectionReactor
            let homeSectionReactor = HomeSectionReactor(listModels: state.listModels);
            state.sections = [.celldata(homeSectionReactor.currentState.sectionItems.map(HomeViewSectionItem.celldata))]
            setTimeRun()  
            return state
         case .appendServerData(let model):
            state.listModels.insert(model, at: 0)
            //构建HomeSectionReactor
            let homeSectionReactor = HomeSectionReactor(listModels: state.listModels);
            state.sections = [.celldata(homeSectionReactor.currentState.sectionItems.map(HomeViewSectionItem.celldata))]
            return state
          }
    }
    
    //处理时间绑定
    func setTimeRun()  {
        let timeRun = Observable<Int>.timer(5, period: 5, scheduler: MainScheduler.instance)
             
            timeRun.map{_ in HomeViewReactor.Action.loadNextDataFromWeb}
            .bind(to: self.action)
            .disposed(by: disposeBag)
        
            //Test 打印
            timeRun.subscribe { (num) in
                print("num:\(num)")
             } .disposed(by: disposeBag)

     
    }

}
