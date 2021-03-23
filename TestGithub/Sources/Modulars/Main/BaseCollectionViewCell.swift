//
//  BaseCollectionViewCell.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    var disposeBag = DisposeBag()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .app_color_white
        
        initialize()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
    
    func initialize() {
        
    }
}
