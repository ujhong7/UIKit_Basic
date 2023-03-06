//
//  FirstViewController.swift
//  N&TProjectCode2
//
//  Created by yujaehong on 2023/03/06.
//

import UIKit

class FirstViewController: UIViewController {

    // 로그인 여부 저장하는 속성
    var isLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        makeUI()
    }
    
    // ⭐️⭐️⭐️
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ⭐️로그인이 되어있지 않다면 로그인 화면 띄우기⭐️
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    func makeUI(){
        view.backgroundColor = .gray
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        //appearance.backgroundColor = .brown     // 색상설정
        
        //appearance.configureWithTransparentBackground()  // 투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
    }
    
}
