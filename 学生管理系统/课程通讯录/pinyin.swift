//
//  pinyin.swift
//  课程通讯录
//
//  Created by 客人用户 on 2019/4/5.
//  Copyright © 2019年 吕若凡. All rights reserved.
//

import Foundation
extension String {
    
    //NSString类是不可变的类，一旦别创建，字符串序列是不可变的，知道这个对象被销毁，所以出现了NSMutableString，NSMutableString是NSString的子类
    func isIncludeChinese() -> Bool {
        //unicode标量
        for ch in self.unicodeScalars {
            // 中文字符范围：0x4e00 ~ 0x9fff
            if (0x4e00 < ch.value  && ch.value < 0x9fff) {
                return true
            }
        }
        return false
    }
    
    func transformToPinyin() -> String {
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false);
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false);
        var pinyin = stringRef as String;
        //去掉空格
        pinyin = pinyin.replacingOccurrences(of: " ", with: "")
        return pinyin
    }
    
    // 获取所有大写字母
    func getHead() -> String {
        
        for ch in self.uppercased() {
            
            if ch >= "A" && ch <= "Z" {
                return "\(ch)"
            }
        }
        return ""
    }
}

