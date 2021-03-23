//
//  BaseCollectionViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit
import EmptyKit

class BaseCollectionViewController: BaseViewController {
    
    var isEmptyDisplay: Bool = true
    
    var allowListenScroll: Bool = false
    
    let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then{
        $0.backgroundColor = .app_color_gray
        $0.alwaysBounceVertical = true
        $0.showsVerticalScrollIndicator = false
    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.ept.dataSource = self
        collectionView.ept.delegate = self
        view.addSubview(collectionView)
    
    }
    
}

//MARK: Notification
extension BaseCollectionViewController {
    
    func totalItems() -> Int {
        
        var totalItems: Int = 0
        
        let sectionCount = self.collectionView.numberOfSections
        
        for i in 0 ..< sectionCount {
            
            let items = self.collectionView.numberOfItems(inSection: i)
            
            totalItems += items
        }
        
        return totalItems
    }
}

extension BaseCollectionViewController:EmptyDelegate,EmptyDataSource {
    
    func customViewForEmpty(in view: UIView) -> UIView? {
        
        return nil
    }
    
    func emptyShouldAllowScroll(in view: UIView) -> Bool {
        return true
    }
    
    func emptyShouldDisplay(in view: UIView) -> Bool {
        return isEmptyDisplay
    }
}

