//
//  BaseTableViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/25.
//

import UIKit
import EmptyKit

class BaseTableViewController: BaseViewController {
    
    var isEmptyDisplay: Bool = true
    
    let tableView: UITableView = UITableView().then{
        $0.backgroundColor = .app_color_gray
        $0.showsVerticalScrollIndicator = false
        $0.tableFooterView = UIView()
    }
    
    override func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.ept.dataSource = self
        tableView.ept.delegate = self
        
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension BaseTableViewController:EmptyDelegate,EmptyDataSource {
    
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

