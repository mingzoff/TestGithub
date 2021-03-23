//
//  HomeReactor.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

final class HomeSectionReactor: SectionReactor {
    
    enum SectionItem {
        case homecellOne(HomeCellReactor)
    }
    

    
    enum Action {}
    
    // 属性2：用户行为转换为界面状态的中间
    enum Mutation {}
    
    // 属性3：显示到界面上的状态
    struct State: SectionReactorState {
        var sectionItems: [HomeGitHubModel]
    }
    
    let initialState: State
    
    init(homeList:[HomeGitHubModel]) {
        
        defer { _ = self.state }
        
        var sectionItems: [HomeGitHubModel] = []

        
        self.initialState = State(sectionItems: sectionItems)
    }

   
    func mutate(action: Action) -> Observable<Mutation> {
        
        return .empty()
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        return state
    }
    


}
