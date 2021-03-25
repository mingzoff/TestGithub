//
//  HomeDetailViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/25.
//

import UIKit

class HomeDetailViewController: BaseViewController {

    var  gitHubModel : HomeGitHubModel?
    
    
    private var labTitle :UILabel!;
    private var labTitle1 :UILabel!;
    private var labTitle2 :UILabel!;
    private var labTitle3 :UILabel!;
    private var labTitle4 :UILabel!;

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情"
        labTitle =  appLableCreate()
        self.view.addSubview(labTitle)
        labTitle.snp.makeConstraints {
            $0.left.top.equalTo(self.view).offset(10)
            $0.right.equalTo(self.view).offset(-10)
        }
        labTitle.text = self.gitHubModel?.current_user_url
        
        labTitle1 =  appLableCreate()
        self.view.addSubview(labTitle1)
        labTitle1.snp.makeConstraints {
            $0.left.equalTo(self.view).offset(10)
            $0.top.equalTo(labTitle.snp_bottomMargin).offset(20)
            $0.right.equalTo(self.view).offset(-10)
        }
        labTitle1.text = self.gitHubModel?.current_user_authorizations_html_url
        
        labTitle2 =  appLableCreate()
        self.view.addSubview(labTitle2)
        labTitle2.snp.makeConstraints {
            $0.left.equalTo(self.view).offset(10)
            $0.top.equalTo(labTitle1.snp_bottomMargin).offset(20)
            $0.right.equalTo(self.view).offset(-10)
        }
        labTitle2.text = self.gitHubModel?.authorizations_url
        
        labTitle3 =  appLableCreate()
        self.view.addSubview(labTitle3)
        labTitle3.snp.makeConstraints {
            $0.left.equalTo(self.view).offset(10)
            $0.top.equalTo(labTitle2.snp_bottomMargin).offset(20)
            $0.right.equalTo(self.view).offset(-10)
        }
        labTitle3.text = self.gitHubModel?.code_search_url
        
        labTitle4 =  appLableCreate()
        self.view.addSubview(labTitle4)
        labTitle4.snp.makeConstraints {
            $0.left.equalTo(self.view).offset(10)
            $0.top.equalTo(labTitle3.snp_bottomMargin).offset(20)
            $0.right.equalTo(self.view).offset(-10)
        }
        labTitle4.text = self.gitHubModel?.commit_search_url
        

    }
    
    func appLableCreate() -> UILabel {
        return UILabel().then({
            $0.font = Font.SysFont.sys_16
            $0.textColor = .app_color_black
            $0.numberOfLines = 0;
        });
    }

    
    



}
