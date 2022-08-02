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
    
    var tasks: [TaskModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.layer.cornerRadius = 22
        topBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.separatorStyle = .none
        
        createTaskButton.layer.masksToBounds = true
        createTaskButton.layer.cornerRadius = createTaskButton.frame.size.height/2
       
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: StoryboardIDs.createVC) as! CreateTaskViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
    }
    
}

extension MainTableViewController : CreateTaskDelegate{
    func taskCreated(task: TaskModel) {
        var oldTask = false
        for i in 0 ..< tasks.count{
            if task.id == tasks[i].id{
                tasks[i] = task
                oldTask = true
            }
        }
        if !oldTask{
            tasks.append(task)
        }
        
        mainTableView.reloadData()
    }
}


extension MainTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! TableViewCell
        
        let task = tasks [indexPath.row]
        
        cell.taskNumber.text = "Задача №\(task.id)"
        cell.mainLabel.text = "\(task.title)"
        cell.dateLabel.text = "\(task.date)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let task = tasks[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: StoryboardIDs.createVC) as! CreateTaskViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
        vc.currentTask = task
    }
    
}
