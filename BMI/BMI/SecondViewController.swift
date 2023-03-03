//
//  SecondViewController.swift
//  BMI
//
//  Created by yujaehong on 2023/03/03.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton! // 버튼 둥글게하기 위해
    
    // 전 화면에서 전달받은 데이터
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiNumberLabel.text = "\(bmiNumber!)"
        bmiNumberLabel.backgroundColor = bmiColor
        adviceLabel.text = adviceString
        
        configureUI()
        
    }
    
    func configureUI(){
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        backButton.layer.cornerRadius = 5
    }
    
    // 다시 계산하기 버튼
    @IBAction func backButtonTapped(_ sender: Any) {
        // 전 화면으로 돌아가는 메서드
        self.dismiss(animated: true, completion: nil)
    }
    

}
