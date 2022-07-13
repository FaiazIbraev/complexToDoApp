//
//  TableViewCell.swift
//  ComplexToDoApp
//
//  Created by Student on 12/7/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var taskNumber: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup ()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(){
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 22
        taskView.layer.masksToBounds = true
        taskView.layer.cornerRadius = 22
    }
    
    
}
