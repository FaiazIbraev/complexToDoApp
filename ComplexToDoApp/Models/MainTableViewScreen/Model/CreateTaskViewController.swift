//
//  CreateTaskViewController.swift
//  ComplexToDoApp
//
//  Created by Student on 14/7/22.
//

import UIKit

protocol CreateTaskDelegate{
    func taskCreated(task:TaskModel) {
        
    }
}

class CreateTaskViewController : UIViewController{
    
    
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var mainTitle: UITextField!
    @IBOutlet weak var subTitle: UITextView!
    @IBOutlet weak var createButton: UIButton!
    
    var titleString: String?
    var subtitleString: String?
    var id: Int = Int.random(in: 0..<100)
    var date: String = ""
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
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
        
        if let stitle = subTitle.text{
            if !stitle.isEmpty{
                self.subtitleString = stitle
            }
        }
        
        guard let titleString = self.titleString, let subtit else {
            return
        }

        
        let task = TaskModel
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    
}
