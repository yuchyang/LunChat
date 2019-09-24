//
//  RecommendViewController.swift
//  Lunchat
//
//  Created by 杨昱程 on 21/9/19.
//  Copyright © 2019 MobileTeam. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataSource = [[String:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = [
            ["title":"Do you like music?","theme":"Music","location":"Union House","participant":"3","time":"11:00","collected": "true"],
            ["title":"What's your favorite movie?","theme":"Movie","location":"Union House","participant":"3","time":"12:00","collected": "true"],
            ["title":"Do you like art?","theme":"Art","location":"Union House","participant":"3","time":"16:40","collected": "true"],
            ["title":"Go to Gym?","theme":"Sport","location":"Union House","participant":"3","time":"10:50","collected": "true"]]
        tableView.reloadData()
    }
    
    //MARK: UITableViewDataSource
    // cell的个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    // UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:LCTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? LCTableViewCell
        if cell==nil {
            cell = LCTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        cell?.titleLabel.text = dict["title"]
        cell?.themeLabel.text = dict["theme"]
        var location = "-"
        location = location+dict["location"]!
//        cell?.locationLabel.text = location
        let number = 4
        cell?.participant.text = dict["participant"]!+"/\(number)"
        cell?.timeLabel.text = dict["time"]
        cell?.locationLabel.setTitle(location, for: .normal)
        return cell!
    }
    
    //MARK: UITableViewDelegate
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func currentTime() -> String {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "YYYY-MM-dd"// 自定义时间格式
        
        // GMT时间 转字符串，直接是系统当前时间
        
        return dateformatter.string(from: Date())
        
    }
}

