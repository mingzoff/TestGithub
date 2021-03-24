//
//  HomeViewReactor.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit
import ObjectMapper

final class HomeViewReactor: Reactor {
    

   
    enum Action {
        //界面发起加载数据
        case loadDataFromCache
        case loadDataFromWeb
        case loadNextDataFromWeb

    }
    
    enum Mutation {
        //添加返回的数据
        case appendData(HomeGitHubModel)
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
        case .loadDataFromCache:
            return getCacheData().asObservable().map { .appendData($0)}
        case  .loadDataFromWeb:
            setTimeRun()//启动定时器
            return self.homeService.getGitHubMessage().asObservable().map {.appendData($0)}
        case  .loadNextDataFromWeb:
            return self.homeService.getGitHubMessage().asObservable().map {.appendData($0)}
        }
    }
    
    //处理回来的数据
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
    
         case .appendData(let model):
            state.listModels.insert(model, at: 0)
            //构建HomeSectionReactor
            let homeSectionReactor = HomeSectionReactor(listModels: state.listModels);
            state.sections = [.celldata(homeSectionReactor.currentState.sectionItems.map(HomeViewSectionItem.celldata))]
            cacheHomeGitHubDataModel(model: model);
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
    
    //缓存数据
    func cacheHomeGitHubDataModel(model:HomeGitHubModel)  {
        let cacheModel = HomeGitHubRealModel()
        cacheModel.modelJsonString = model.toJSONString()
        cacheModel.key = NSStringFromClass(HomeGitHubRealModel.self)
        RealmManager.addCanUpdate(cacheModel)
    }
    
    //返回缓存数据
    func getCacheData() -> Single<HomeGitHubModel> {
        
        guard let result = RealmManager.selectByAll(HomeGitHubRealModel.self).first,
              let cacheData = result.modelJsonString
        else {
            return Observable<HomeGitHubModel>.empty().asSingle()
        }
        //转换数据
        let model: HomeGitHubModel  =  try! Mapper<HomeGitHubModel>().map(JSONString: cacheData)
        return Single.just(model)
    }

}
