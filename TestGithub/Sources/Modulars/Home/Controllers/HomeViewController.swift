//
//  HomeViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit
import ReactorKit
import RxDataSources


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
        
        //Input
        self.rx.viewDidLoad
            .map{Reactor.Action.loadDataFromWeb}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)

        collectionView.rx.itemSelected(dataSource: dataSource)
            .subscribe(onNext: {(sectionItem) in
            switch sectionItem {
            case let .celldata(item):
                switch item {
                case let .homecellOne(cellReactor):
                    print(cellReactor.cellmodel)
                }
            }
        })
            .disposed(by: disposeBag)

        //Output
        reactor.state.map{$0.sections}
            .filterNil()
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        reactor.state.map{$0.sections}
            .filterNil()
            .subscribe {(_) in
                
            }
            .disposed(by: disposeBag)

        
    }
    

}


// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionItem = dataSource[indexPath]
        switch sectionItem {
        case let .celldata(item):
            return self.homeSectionDelegate.cellSize(collectionView: collectionView,indexPath: indexPath, sectionItem: item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
}
