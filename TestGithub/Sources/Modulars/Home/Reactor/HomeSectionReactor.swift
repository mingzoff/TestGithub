//
//  HomeReactor.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

final class HomeSectionReactor: SectionReactor {
    
    //显示cell样式的
    enum SectionItem {
        case homecellOne(HomeCellReactor)
    }
    

    
    enum Action {}
    
    // 属性2：用户行为转换为界面状态的中间
    enum Mutation {}
    
    // 属性3：显示到界面上的状态
    struct State: SectionReactorState {
        var sectionItems: [SectionItem]
        var listModels: [HomeGitHubModel]

        
    }
    
    let initialState: State
    
    //处理Model和Cell之间的关系
    init(listModels:[HomeGitHubModel]) {
        
        defer { _ = self.state }
        
        var sectionItems: [SectionItem] = []
        
        for listModel in listModels {
            sectionItems.append(.homecellOne(HomeCellReactor(model: listModel)))
        }

        self.initialState = State(sectionItems: sectionItems,listModels: listModels)
    }

   
    func mutate(action: Action) -> Observable<Mutation> {
        
        return .empty()
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        return state
    }
    


}
