//
//  HomeCell.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit
import ReactorKit


final class HomeCell: BaseCollectionViewCell,View {
  
    
    
    private let labtitle = UILabel().then {
        $0.font = Font.SysFont.sys_12
        $0.textColor = .app_color_black
    };
    
    
    override func initialize() {
        
        contentView.addSubview(labtitle)

    }
    
    class func size() -> CGSize {
        return CGSize(width: kScreenWidth, height: 80)
    }
    
    
    func bind(reactor: HomeCellReactor) {
        
    }
    
    
    override func layoutSubviews() {
        labtitle.snp.makeConstraints {
            $0.left.top.equalTo(contentView).offset(10)
            $0.right.equalTo(-10)
        }
    }
    
}
