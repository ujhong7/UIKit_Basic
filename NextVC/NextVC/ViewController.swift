//
//  ViewController.swift
//  NextVC
//
//  Created by yujaehong on 2023/03/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // 1️⃣ 코드로 화면 이동 (다음화면이 코드로 작성되어 있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.someString = "첫번째 화면입니다😀"
        // firstVC.mainLabel.text = "첫번째 화면😢"
        // 코드로 만들때는 이런 식으로 만들어도 된다. 하지만,
        // 스토리보드로 만들땐 불가능하다.
        // 코드로 만들때는 모든 저장속성이 한꺼번에 올라가지만
        // 스토리보드로 만들때는 코드로 만들어진 뷰컨 메모리에 올리고 스토리보드 메모리에 올린 후
        // 코드, 스토리보드 연결
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true)
    }
    
    // 2️⃣ 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.someString = "두번째 화면입니다😀"
        // secondVC.mainLabel.text = "두번째 화면" // 에러발생 (스토리보드 객체가 나중에 생김)
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
    }
    
    // 3️⃣ 스토리보드에서의 화면 이동 (간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        // 세그웨이를 실행한다는 의미의 메서드 호출
        self.performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 데이터 전달을 위한 메서드 (prepare)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC"{
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "세번째 화면입니다"
            // thirdVC.mainLabel.text = "세번째 화면" // 에러발생 (스토리보드 객체가 나중에 생김)
        }
        
        // 4️⃣ 스토리보드에서의 화면 이동 (직접 세그웨이)
        if segue.identifier == "toFourthVC"{
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "네번째 화면입니다"
            // fourthVC.mainLabel.text = "네번째 화면" // 에러발생 (스토리보드 객체가 나중에 생김)
        }
        
    }
    
    // 참고 - 4) 직접 세그웨이에서만 호출되는 메서드
    // 조건에 따라 다음화면 이동할지/말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //print(#function)
//        if identifier == "toFourthVC" {
//            return false
//        }
        return true
    }
    
}

