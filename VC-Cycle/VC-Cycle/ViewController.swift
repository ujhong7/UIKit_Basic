//
//  ViewController.swift
//  VC-Cycle
//
//  Created by yujaehong on 2023/03/04.
//

import UIKit

class ViewController: UIViewController {

//    // view(메인뷰)를 만들어 내는 시점/지점 (한번만 호출): 코드로 짤때 뷰 교체 가능 시점
//    // 스토리보드에선 호출하면 화면 로드 안됨 ⭐️
//    override func loadView() {
//        // super.loadView() // 필요X 하면안됨
//        print("VC-1 loadView 호출")
//    }
    
    // 스토리보드 뷰와 연결된 후 (한번만 호출): 코드와 스토리보드의 뷰가 연결된 후
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC-1 viewDidLoad 호출")
    }
    
    // 뷰가 나타나기 전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC-1 viewWillAppear 호출")
    }
    
    // 뷰가 나타난 후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC-1 viewDidAppear 호출")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC-1 viewWillDisappear 호출")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC-1 viewDidDisappear 호출")
    }

    deinit{
        print("VC-1 메모리에서 내려감")
    }
    
}

