//
//  ChooseViewController.swift
//  shishi
//
//  Created by andymao on 2017/4/15.
//  Copyright © 2017年 andymao. All rights reserved.
//

import UIKit

class SearchPoetryVC: NormalSearchVC{
    
    public var author: String?
    
    override func loadData() {
        if let author = self.author {
            originItems = PoetryDB.getAll(author: author)
        }
        else {
            originItems = PoetryDB.getAll()
        }
    }
    
    override func getHint() -> String {
        return SSStr.Search.SEARCH_POETRY_HINT
    }
    override func onItemClick(_ pos: Int) {
        
        
//        let random=Int(arc4random_uniform(UInt32(colors.count)))
//        let color=colors[random] as! Color
//        let vc=AuthorPagerVC(author:items[pos] as! Author,color:color.toUIColor())
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
