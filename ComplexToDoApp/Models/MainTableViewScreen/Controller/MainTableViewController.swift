//
//  MainTableViewController.swift
//  ComplexToDoApp
//
//  Created by Student on 12/7/22.
//

import UIKit

class MainTableViewController: UIViewController{
    
    
    @IBOutlet weak var topBar: UIView!
    //mainCell
    @IBOutlet weak var mainTableView: UITableView!
    
    
    @IBOutlet weak var createTaskButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.layer.cornerRadius = 22
        topBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        createTaskButton.layer.masksToBounds = true
       
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        
    }
    
}


extension MainTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! TableViewCell
        return cell
    }
    
}
