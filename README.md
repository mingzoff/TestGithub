# 定时器请求任务
使用swift语言开发请求任务示例，功能如下

功能:
1.程序在启动5秒后调用API Endpoint https://api.github.com/。之后循环每隔5秒都要调用一次。

2.解析返回的结果数据显示在界面中。

3.所有返回结果持续化存到到程序中，下次程序启动时显示最后一次的调用结果。

4.所有的调用记录也应该持续化存储，并设计一个调用历史界面，显示调用历史记录。

使用技术：

Rxswift + Moya 负责网络请求

RxSwift + ReactorKit   构建项目框架

RealmSwift 负责数据持久化

编译注意：
pod完成后需要将Pods—>TARGETS  —> SectionReactor —> iOS Deployment Target 设置为9.0 否则编译会出错
