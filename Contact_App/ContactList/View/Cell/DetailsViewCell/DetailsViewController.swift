//
//  DetailsView.swift
//  CustomTableView
//
// Created by MD Murad Hossain on 16/10/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgDt: UIImageView!
    @IBOutlet weak var lblDt: UILabel!
    @IBOutlet weak var nmbDt: UILabel!
    
    var name: String?
    var number: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

//        guard let imageName = imageName else { return }
//        guard let name = name else { return }
        if  (name != nil), (number != nil) {
            lblDt.text = name
            nmbDt.text = number
        
        }
    }

    // MARK: - Button Action.
    

    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
}
