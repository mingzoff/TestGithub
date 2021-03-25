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
        var authorizations_html_url:String?
        var createTime : String?
        var cellSize: CGSize
    }
    
    let initialState: State
    let cellmodel: HomeGitHubModel

    init(model: HomeGitHubModel) {
        
        self.cellmodel = model
        self.initialState = State(current_user_url: model.current_user_url,
                                  authorizations_html_url :model.current_user_authorizations_html_url,
                                  createTime: NSDate.getDateByFormat(dateFrom: model.create_time),
                                  cellSize: HomeCell.size())
        _ = self.state
    }
    

}
