//
//  MainTableViewCell.swift
//  MyApp01
//
//  Created by puchimilk on 2021/11/05.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(title: String) {
        print("TableViewCell - setUp()")
        self.titleLabel.text = title
    }
    
}
