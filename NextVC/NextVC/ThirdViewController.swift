//
//  ThirdViewController.swift
//  NextVC
//
//  Created by yujaehong on 2023/03/01.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
