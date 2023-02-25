//
//  ViewController.swift
//  SliderTimer
//
//  Created by yujaehong on 2023/02/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    // 선택된 초를 관리하기 위한 변수
    var number = 0
    // 타이머 객체 담기 위한 변수
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // UI 세팅
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    // 슬라이더 값 바뀔때마다 호출되는 함수
    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(sender.value*60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    // 시작 버튼
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
    }
    
    // 셀렉터 동작 실행 함수
    @objc func doSomethingAfter1Second(){
        if number>0{
            number -= 1
            slider.value = Float(number)/Float(60)
            mainLabel.text = "\(number)초"
        }else{
            mainLabel.text = "시간이 모두 흘렀습니다"
            number = 0
            timer?.invalidate()
            AudioServicesPlaySystemSound(SystemSoundID(1000))
        }
    }
    
    // 리셋 버튼
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        mainLabel.text = "초를 다시 선택하세요"
        slider.value = 0.5
        number = 0
    }
    
}

