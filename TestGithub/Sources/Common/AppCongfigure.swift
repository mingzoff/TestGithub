//
//  AppCongfigure.swift
//  TestGithub
//
//  Created by zoff on 2021/3/22.
//

import Foundation
import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kScreenRatio = kScreenWidth/375

let kToastBottomCenterSpace = 420 * kScreenRatio


//网络请求超时时间
let kTimeoutIntervalForRequest: TimeInterval = 10

let rxdisposeBag = DisposeBag();
