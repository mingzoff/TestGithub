//
//  NSDate+Until.swift
//  TestGithub
//
//  Created by zoff on 2021/3/24.
//

extension NSDate{
    
    static func getDateByFormat(dateFrom:Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return dateFormatter.string(from: dateFrom as Date)
        
    }
    


    
}

