//
//  MainTableViewController.swift
//  ComplexToDoApp
//
//  Created by Student on 12/7/22.
//

import UIKit

class MainTableViewController: UIViewController{
    
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var createTaskButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.layer.cornerRadius = 22
        topBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        createTaskButton.layer.masksToBounds = true
        createTaskButton.layer.cornerRadius = createTaskButton.frame.size.height/2
       
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        
    }
    
}


extension MainTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! TableViewCell
        cell.taskNumber.text = "Задача №\(indexPath.row + 1)"
        cell.mainLabel.text = "Сделай задачу №\(indexPath.row + 1)"
        cell.dateLabel.text = "Сегодня"
        
        return cell
    }
    
}
