//
//  HomeViewController.swift
//  Lunchat
//
//  Created by JamesCullen on 2019/9/11.
//  Copyright © 2019 MobileTeam. All rights reserved.
//

import UIKit

private  let  kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

//    @IBOutlet weak var searchBar: UISearchBar!
    
    private  lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: 100, width: 414, height: kTitleViewH)
        let  titles   = ["Lunch Chat","Mate"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)

        titleView.delegate = self
//        titleView.backgroundColor = UIColor.purple
        return titleView
    }()
    private lazy var searchBar: UISearchBar = {[weak self] in
        let Frame = CGRect(x: 0, y:56 , width: UIScreen.main.bounds.size.width, height: 44)
        let bar = UISearchBar.init(frame: Frame)
        return bar
    }()
    private lazy var pageContentView : PageContentView =  {
        let contentH = UIScreen.main.bounds.size.height  - 80 -  kTitleViewH
        let contentFrame = CGRect(x: 0, y: 100 + kTitleViewH , width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-276)
        var childVcs = [UIViewController]()
//        for _ in 0..<2{
//            let vc = UIViewController()
//            vc.view.backgroundColor = UIColor.red
//            childVcs.append(vc)
//        }

        let vc = RecommendViewController()
        //        vc.view.backgroundColor = UIColor.red
        childVcs.append(vc)
        
        let vc1 = MateViewController()
//        vc1.view.backgroundColor = UIColor.blue
        childVcs.append(vc1)
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs,  parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBar)
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
//        print(pageContentView.frame.height)
//        print(view.frame.height)
        pageContentView.backgroundColor = UIColor.purple
    }

}
// 遵守PageTitleviewDelegate协议
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
    func mapview(titleView: PageTitleView, ifmap map: Bool) {
        pageContentView.setMap()
    }
}
// 遵守PageContentViewDelegate协议
extension HomeViewController : PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targeIndex: Int) {
//        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, tagertIndex: targeIndex)
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targeIndex)
    }
}
