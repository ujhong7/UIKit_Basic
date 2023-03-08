//
//  DetailViewController.swift
//  TableViewCode
//
//  Created by yujaehong on 2023/03/08.
//

import UIKit

class DetailViewController: UIViewController {

    // MVC 패턴을 위해 따로 만든 뷰
    private let detailVC = DetailView()
    
    // 전화면에서 Movie데이터 전달 받기 위한 변수
    var movieData: Movie?

    // view 화면 교환(설정)
    override func loadView() {
        view = detailVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI(){
        detailVC.mainImageView.image = movieData?.movieImage
        detailVC.movieNameLable.text = movieData?.movieName
        detailVC.descriptionLabel.text = movieData?.movieDescription
    }

}
