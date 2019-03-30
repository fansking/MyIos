//
//  ThirdViewController.swift
//  zzz
//
//  Created by gjh on 2019/3/29.
//  Copyright © 2019 gjh. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var cellid = "cellid3"
    @IBOutlet weak var tableView: UITableView!
    
    let names = ["xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1","xyz1", "a1","b1","c1","M1","d1"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView,  indentationLevelForRowAt indexPath: IndexPath) ->Int{
        return indexPath.row%4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as? YYTableViewCell
        
        cell!.centerLabel.text = names[indexPath.row]
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "YYTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellid)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
