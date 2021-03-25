//
//  HomeViewSection.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

enum HomeViewSection {
    
    case celldata([HomeViewSectionItem])
}

extension HomeViewSection: SectionModelType {
    
    var items: [HomeViewSectionItem] {
        switch self {
        case let .celldata(items): return items
        }
    }
    
    init(original: HomeViewSection, items: [HomeViewSectionItem]) {
        switch original {
        case .celldata:self = .celldata(items)
        }
    }
}


enum HomeViewSectionItem {
    
    case celldata(HomeSectionReactor.SectionItem)
}
