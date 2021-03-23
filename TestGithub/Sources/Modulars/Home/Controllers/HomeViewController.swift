//
//  HomeViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit
import ReactorKit


final class HomeViewController: BaseCollectionViewController,View {
  
    
    typealias Reactor = HomeViewReactor
    
    
    let homeSectionDelegate : HomeSectionDelegate
    let dataSource : RxCollectionViewSectionedReloadDataSource<HomeViewSection>

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
    }
    
    // MARK: Initializing
    init(reactor:HomeViewReactor,
         homeSectionDelegateFactory: () -> HomeSectionDelegate) {
        defer { self.reactor = reactor }
        self.homeSectionDelegate = homeSectionDelegateFactory()
        self.dataSource = type(of: self).dataSourceFactory(homeSectionDelegate: self.homeSectionDelegate)
        super.init()
        self.homeSectionDelegate.registerReusables(to: self.collectionView)
    }
    
    private static func dataSourceFactory(
       homeSectionDelegate:HomeSectionDelegate)
        -> RxCollectionViewSectionedReloadDataSource<HomeViewSection> {
        
            return .init(configureCell: { (dataSource, collectionView, indexPath, sectionItem) -> UICollectionViewCell in
                switch sectionItem {
                case let .celldata(item):
                
                    return homeSectionDelegate.configureCell(collectionView: collectionView, indexPath: indexPath,sectionItem: item)
                }
            })
    }
   
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: HomeViewReactor) {
        
    }
    

}
