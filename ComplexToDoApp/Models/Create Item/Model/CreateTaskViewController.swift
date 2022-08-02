//
//  CreateTaskViewController.swift
//  ComplexToDoApp
//
//  Created by Student on 14/7/22.
//

import UIKit

protocol CreateTaskDelegate{
    func taskCreated(task:TaskModel)
}

class CreateTaskViewController : UIViewController{
    
    
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var mainTitle: UITextField!
    @IBOutlet weak var subTitle: UITextView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    var titleString: String?
    var subtitleString: String?
    var id: Int = Int.random(in: 0..<100)
    var date: String?
    var currentTask: TaskModel?
    
    var delegate: CreateTaskDelegate?
    
    fileprivate func setup() {
        topBarView.layer.cornerRadius = 22
        topBarView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        mainTitle.layer.cornerRadius = 18
        mainTitle.layer.masksToBounds = true
        subTitle.layer.cornerRadius = 18
        subTitle.layer.masksToBounds = true
        mainTitle.layer.borderWidth = 1
        mainTitle.layer.borderColor = UIColor.red.cgColor
        subTitle.layer.borderWidth = 1
        subTitle.layer.borderColor = UIColor.green.cgColor
        
        createButton.layer.cornerRadius = createButton.frame.size.height / 2
        createButton.layer.masksToBounds = true
    }
    
    fileprivate func datePickerSetup() {
        self.date = formatDate(date: Date())
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        datePickerSetup()
        initialSetup()
        
        let tap = UIGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(tap)
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        if let title = mainTitle.text {
            if !title.isEmpty{
                self.titleString = title
            }
        }
        
        if let subtitle = subTitle.text{
            if !subtitle.isEmpty{
                self.subtitleString = subtitle
            }
        }
        
        guard let titleString = self.titleString, let subtitleString = self.subtitleString, let taskDate = self.date else {
            return
        }
        let task = TaskModel(title: titleString, subTitle: subtitleString, date: taskDate, id: self.id, isDone: false)
        delegate?.taskCreated(task: task)
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
        if Date() <= sender.date{
            self.date = formatDate(date: sender.date)
            errorLabel.text = ""
        } else{
            self.date = nil
            errorLabel.text = "Wrond date"
        }
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a | dd.MM.yyyy"
        let selectedDate: String = formatter.string(from: date)
        return selectedDate
    }
    
    func initialSetup(){
        if let currentTask = currentTask{
            self.id = currentTask.id
            mainTitle.text = currentTask.title
            subTitle.text = currentTask.subTitle
            if let date = getDate(taskDate: currentTask.date){
                datePicker.date = date
            }
            
            createButton.setTitle("Редактировать", for: .normal)
            
        }
    }
    
    func getDate (taskDate: String) -> Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a | dd.MM.yyyy"
        let date = formatter.date(from: taskDate)
        return date
    }
    
}
