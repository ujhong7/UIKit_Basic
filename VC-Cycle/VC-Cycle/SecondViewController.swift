//
//  SecondViewController.swift
//  VC-Cycle
//
//  Created by yujaehong on 2023/03/04.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("===== VC-2 viewDidLoad 호출")
    }
    
    // 뷰가 나타나기 전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("===== VC-2 viewWillAppear 호출")
    }
    
    // 뷰가 나타난 후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("===== VC-2 viewDidAppear 호출")
    }
    
    // 뷰가 사라지기 전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("===== VC-2 viewWillDisappear 호출")
    }
    
    // 뷰가 사라진 후
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("===== VC-2 viewDidDisappear 호출")
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    deinit{
        print("===== VC-2 메모리에서 내려감")
    }

}

// 결과
// VC-1 viewDidLoad 호출
// VC-1 viewWillAppear 호출
// VC-1 viewDidAppear 호출
// ===== VC-2 viewDidLoad 호출
// VC-1 viewWillDisappear 호출
// ===== VC-2 viewWillAppear 호출
// ===== VC-2 viewDidAppear 호출
// VC-1 viewDidDisappear 호출
