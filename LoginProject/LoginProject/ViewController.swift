//
//  ViewController.swift
//  LoginProject
//
//  Created by yujaehong on 2023/02/27.
//

import UIKit

final class ViewController: UIViewController {

    
    // MARK: - 이메일 입력 텍스트뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    // "이메일 또는 전화번호" 안내문구
    private let emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    // 로그인 - 이메일 입력 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // MARK: - 비밀번호 입력 텍스트뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        //view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    
    // 패스워드 텍스트필드 안내문구
    private let passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private lazy var passwordTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    
    // 패스워드 '표시'버튼 (비밀번호 가리기 기능)
    private lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    
    
    
    // MARK: - 로그인버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
        
    // 이메일텍스트필드, 패스워드, 로그인버튼 스택뷰에 배치
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [emailTextFieldView,passwordTextField,loginButton])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    
    // 비밀번호 재설정 버튼
    private lazy var passwordResetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48
    
    // 오토레이아웃 향후 변경을 위한 변수(애니메이션)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    private func configureUI(){
        view.backgroundColor = .black
        emailTextField.delegate = self
        passwordTextField.delegate = self
        [stackView, passwordResetButton].forEach{ view.addSubview($0)}
    }
    
    
    // 오토레이아웃
    
    
    
    
    // MARK: - 비밀번호 가리기 모드 켜고 끄기
    @objc private func passwordSecureModeSetting(){
        // 이미 텍스트필드에 내장되어 있는 기능
        passwordTextField.isSecureTextEntry.toggle()
    }

    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped(){
        // 서버와 통신해서 다음 화면으러 넘어가는 내용 구현
        print("다음 화면으로 넘어가기")
    }
    
    // 비밀번호 재설정 버튼이 눌리면 동작하는 함수
    @objc func resetButtonTapped(){
        let alert = UIAlertController(title: "비밀번호 바꾸기", message:"비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        self.present(alert, animated: true, completion: nil)
    }
    
    // 앱의 화면을 터치하면 동작하는 함수 (키보드 내림)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


extension ViewController: UITextFieldDelegate{
    // MARK: - 텍스트필드 편집 시작할때의 설정 - 문구가 위로 올라가면서 크기 작아지고, 오토레이아웃 업데이트
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // dd
    }
    
    // dddd
    func textFieldDidEndEditing(_ textField: UITextField) {
        // dd
    }
    
    
    
    
}
