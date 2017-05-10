//
//  SearchAuthorVC.swift
//  shishi
//
//  Created by andymao on 2017/4/16.
//  Copyright © 2017年 andymao. All rights reserved.
//

import UIKit

class SearchAuthorVC: BaseSearchVC {

    override func loadData() {
        orginItems = AuthorDB.getAll(byPNum: false, dynasty: 0)
    }
    
    override func getHint() -> String {
        return "搜索诗人"
    }
    
    lazy var colors:NSArray={
        
        return ColorDB.getAll()
    }()
    
    override func onItemClick(_ pos: Int) {
        let random=Int(arc4random_uniform(UInt32(colors.count)))
        let color=colors[random] as! Color
        let vc=AuthorPagerVC(author:items[pos] as! Author,color:color.toUIColor())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}