//
//  HomeSectionDelegate.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import ReusableKit
import SectionReactor


final class HomeSectionDelegate: SectionDelegateType {
    
    typealias SectionReactor = HomeSectionReactor
    
    
     private struct Reusable {
      static let homeCell = ReusableCell<HomeCell>()

    }
    
    func registerReusables(to collectionView: UICollectionView) {
        collectionView.register(Reusable.homeCell)
    }

    //构建cell 现在只有一个 后期可以拓展
    func configureCell(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        sectionItem: HomeSectionReactor.SectionItem
        ) -> UICollectionViewCell {
                
        switch sectionItem {
        case let .homecellOne(cellReactor):
           let cell = collectionView.dequeue(Reusable.homeCell, for: indexPath)
           if cell.reactor !== cellReactor {
              cell.reactor = cellReactor
           }
           return cell
      
        }
    }
    
    func cellSize(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        sectionItem: HomeSectionReactor.SectionItem
        ) -> CGSize {

        switch sectionItem {
        case .homecellOne( _):
            return HomeCell.size()

        }
    }

}
