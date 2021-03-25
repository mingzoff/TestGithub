//
//  HomeCell.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

import UIKit
import ReactorKit


final class HomeCell: BaseCollectionViewCell,View {
  
    
    
    private let labTitle = UILabel().then {
        $0.font = Font.SysFont.sys_14
        $0.textColor = .app_color_black
    };
    
    private let labContent = UILabel().then {
        $0.font = Font.SysFont.sys_13
        $0.textColor = .app_color_lightBlack
        $0.numberOfLines = 2;
    };
    
    private let labTime = UILabel().then {
        $0.font = Font.SysFont.sys_12
        $0.textColor = .app_color_darkGray
    };
    
    
    override func initialize() {
        contentView.addSubview(labTitle)
        contentView.addSubview(labContent)
        contentView.addSubview(labTime)

    }
    
    class func size() -> CGSize {
        return CGSize(width: kScreenWidth, height: 90)
    }
    
    
    func bind(reactor: HomeCellReactor) {
        
        reactor.state.map{$0.current_user_url}
            .bind(to: self.labTitle.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{$0.authorizations_html_url}
            .bind(to: self.labContent.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{$0.createTime}
            .bind(to: self.labTime.rx.text)
            .disposed(by: disposeBag)
            
    }
    
    
    override func layoutSubviews() {
        labTitle.snp.makeConstraints {
            $0.left.top.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
        }
        
        labContent.snp.makeConstraints {
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.top.equalTo(labTitle.snp_bottomMargin).offset(10)
        }
        
        labTime.snp.makeConstraints {
            $0.right.equalTo(contentView).offset(-10)
            $0.bottom.equalTo(contentView).offset(-10)
        }
        
    
    }
    
}
