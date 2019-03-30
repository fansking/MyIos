//
//  FirstViewController.swift
//  zzz
//
//  Created by gjh on 2019/3/29.
//  Copyright © 2019 gjh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var names:[String]=[]
    var cellid = "cellid"
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView,  indentationLevelForRowAt indexPath: IndexPath) ->Int{
        return indexPath.row%4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue=names[indexPath.row]
        let messae="you select \(rowValue)"
        let controller=UIAlertController(title: "row select", message: messae, preferredStyle: .alert)
        let action=UIAlertAction(title: "yes i did", style: .default, handler: nil)
        controller.addAction(action)
        present(controller,animated: true,completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if (cell == nil)
        {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellid)
        }
        cell!.textLabel!.text = names[indexPath.row]
        cell!.imageView?.image = UIImage(named: "first")
        cell!.imageView?.highlightedImage = UIImage(named: "second")
        cell!.detailTextLabel?.text = "aaaaaa"
        cell?.textLabel?.font=UIFont.boldSystemFont(ofSize: 50)
        tableView.rowHeight=70
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let chs = "abcdefgh23489"
        for _ in 1...100{
            var name = ""
            for _ in 2...Int.random(in: 3...8)
            {
                name += String( chs.randomElement()!)
            }
            names.append(name)
        }
    }


}

