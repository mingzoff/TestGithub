//
//  HistoryViewController.swift
//  TestGithub
//
//  Created by zoff on 2021/3/23.
//

class HistoryViewController: BaseTableViewController {

    var itemsAry = BehaviorSubject(value: [NetWorkRealModel]())

    override func viewDidLoad() {
        super.viewDidLoad()
        //加载UI
        self.setRxUI();

      
    }
    
    override init() {
        super.init()
        self.title = "我的记录";
        self.tabBarItem.image = UIImage(named: "tabBar_mine")
        self.tabBarItem.selectedImage = UIImage(named: "tabBar_mine_s")?.withRenderingMode(.alwaysOriginal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loadDataFromLocalData()
    }
        
    func setRxUI()  {
        tableView.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.description())
        tableView.separatorStyle = .none
        //自动计算高度
        tableView.rowHeight = 120
        //初始化数据
        itemsAry.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell:HistoryCell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.description())! as! HistoryCell
                cell.showCell(model: element)
            return cell
        }.disposed(by: rxdisposeBag)
    }
    
    
    func loadDataFromLocalData()  {
        var dataSource = [NetWorkRealModel]()
        let result = RealmManager.selectByAll(NetWorkRealModel.self)
        for obj in result {
            dataSource.append(obj);
        }
        self.itemsAry.onNext(dataSource)
    }
    
}

