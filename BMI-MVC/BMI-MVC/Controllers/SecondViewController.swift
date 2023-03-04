//
//  SecondViewController.swift
//  BMI-MVC
//
//  Created by yujaehong on 2023/03/03.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // 전화면에서 전달받은 BMI를 통해 셋팅
        bmiNumberLabel.text  = "(\(bmi!.bmiNumber)"
        bmiNumberLabel.backgroundColor = bmi?.bmiColor
        adviceLabel.text = bmi?.adviceString
        
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
