//
//  RandomPoetryViewController.swift
//  shishi
//
//  Created by andymao on 2016/12/24.
//  Copyright © 2016年 andymao. All rights reserved.
//

import UIKit
import RxSwift

class RandomPoetryVC: UIViewController {
    
    @IBOutlet weak var randomBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    var poetryView: PoetryView!
    
    @IBAction func randomClick(_ sender: AnyObject) {
        refresh()
    }

    @IBAction func cancelClick(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var poetry:Poetry!
    
    lazy var colors = ColorDB.getAll()
   
    override public func viewDidLoad() {
        poetryView = PoetryView.loadNib()
        self.view.addSubview(poetryView)
        poetryView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.bottom.equalTo(cancelBtn.snp.top)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
        }
        refresh()
        
        self.poetryView.shareBtn.rx.tap
            .throttle(AppConfig.Constants.TAP_THROTTLE, latest: false, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] in
                self.onShareBtnClick()
            })
            .addDisposableTo(self.rx_disposeBag)
    }
    
    func refresh(){
        poetry = PoetryDB.getRandomPoetry()
        let random = Int(arc4random_uniform(UInt32(colors.count)))
        poetryView.refresh(poetry: poetry,color:(colors[random]).toUIColor())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    internal func onShareBtnClick() {
        let shareController = ShareEditVC()
        shareController.poetry = self.poetry
        self.navigationController?.pushViewController(shareController, animated: true)
    }
}