//
//  UICollectionView+Rx.swift
//  TestGithub
//
//  Created by zoff on 2021/3/24.
//

import RxCocoa
import RxDataSources
import RxSwift

extension Reactive where Base: UICollectionView {
    func itemSelected<S>(dataSource: CollectionViewSectionedDataSource<S>) -> ControlEvent<S.Item> {
        let source = self.itemSelected.map { indexPath in
            dataSource[indexPath]
        }
        return ControlEvent(events: source)
    }
}
