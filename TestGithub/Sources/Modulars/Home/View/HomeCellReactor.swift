//
//  HomeCellReactor.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import ReactorKit

class HomeCellReactor: Reactor {

    typealias Action = NoAction
    
    struct State {
        var current_user_url: String?
        var cellSize: CGSize


    }
    
    let initialState: State
    
    let cellmodel: HomeGitHubModel

    
    init(model: HomeGitHubModel) {
        
        self.cellmodel = model
        
        
        self.initialState = State(current_user_url: model.current_user_url,cellSize: HomeCell.size())
        
        
        _ = self.state
    }
    

}
