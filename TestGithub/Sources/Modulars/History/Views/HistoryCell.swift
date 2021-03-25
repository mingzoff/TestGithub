//
//  HistoryCell.swift
//  TestGithub
//
//  Created by zoff on 2021/3/25.
//

import UIKit

class HistoryCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private let labTitle = UILabel().then {
        $0.font = Font.SysFont.sys_14
        $0.textColor = .app_color_black
    };
    
    private let labResult = UILabel().then {
        $0.font = Font.SysFont.sys_13
        $0.textColor = .red
        $0.numberOfLines = 2;
    };
    
    private let labStartTime = UILabel().then {
        $0.font = Font.SysFont.sys_12
        $0.textColor = .app_color_darkGray
    };
    
    private let labEndTime = UILabel().then {
        $0.font = Font.SysFont.sys_12
        $0.textColor = .app_color_darkGray
    };
    
    private let viewBottom = UIView().then {
        $0.backgroundColor = .app_color_gray
    };
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor.white
        contentView.addSubview(labTitle);
        contentView.addSubview(labResult);
        contentView.addSubview(labStartTime);
        contentView.addSubview(labEndTime);
        contentView.addSubview(viewBottom);

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {

        labTitle.snp.makeConstraints {
            $0.left.top.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.height.equalTo(25)
        }
        
        labResult.snp.makeConstraints {
            $0.top.equalTo(labTitle.snp_bottomMargin).offset(10)
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.height.equalTo(25)

        }
        
        labStartTime.snp.makeConstraints {
            $0.top.equalTo(labResult.snp_bottomMargin).offset(10)
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.height.equalTo(20)

        }
        
        labEndTime.snp.makeConstraints {
            $0.top.equalTo(labStartTime.snp_bottomMargin).offset(10)
            $0.left.equalTo(contentView).offset(10)
            $0.right.equalTo(contentView).offset(-10)
            $0.height.equalTo(20)

        }
        
        viewBottom.snp.makeConstraints {
            $0.left.right.equalTo(contentView).offset(0)
            $0.bottom.equalTo(contentView).offset(0)
            $0.height.equalTo(10)
        }
    }
    
  
    func showCell(model:NetWorkRealModel)  {
        
        labTitle.text = model.requetURL
        labResult.text = model.requetResult ? "成功":"失败"
        labResult.textColor = model.requetResult ? .green:.red
        labStartTime.text = "请求时间：" +  NSDate.getDateByFormat(dateFrom: model.requetDate)
        labEndTime.text   = "响应时间：" +  NSDate.getDateByFormat(dateFrom: model.responseDate!)
    }

}
