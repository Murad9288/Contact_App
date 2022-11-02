//
//  CustomCell.swift
//  CustomTableView
//
// Created by MD Murad Hossain on 16/10/22.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = img.bounds.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
