//
//  ViewController.swift
//  MusicAPP
//
//  Created by yujaehong on 2023/03/30.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var musicTableView: UITableView!
    
    
    // 네트워크 매니저 (싱글톤)
    var networkManger = NetworkManger.shared
    
    // (음악 데이터를 다루기 위함) 빈 배열로 시작
    var musicArrays: [Music] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


    
    
    // 테이블뷰 셋팅
    func setupTableView(){
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        
        // Nib파일을 사용한다면 등록의 과정이 필요
//        musicTableView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>),
//        forCellReuseIdentifier: <#T##String#>)
    }
    
    
    // 데이터 셋업
    func setupDatas(){
        // 네트워킹 시작
        networkManger.fetchMusic(searchTerm: "jazz") { result in
            switch result {
            case .success(let musicDatas):
                // 데이터(배열)을 받아오고 난 후
                self.musicArrays = musicDatas
                // 테이블뷰 리로드
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}



// 🔴
extension ViewController: UITableViewDataSource{
    
    // 1️⃣ 테이블뷰에 몇개의 데이터를 표시할 것인지(셀이 몇개인지)를 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicArrays.count
    }
    
    
    // 2️⃣ 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        
//        cell.imageUrl = musicArrays[indexPath.row].imageUrl
        
        cell.songNameLabel.text = musicArrays[indexPath.row].songName
        cell.artistNameLabel.text = musicArrays[indexPath.row].artistName
        cell.albumNameLabel.text = musicArrays[indexPath.row].albumName
        cell.releaseDateLabel.text = musicArrays[indexPath.row].releaseDateString
        
        cell.selectionStyle = .none
        return cell
        
        
    }
    
    
}



// 🔴
extension ViewController: UITableViewDelegate{
    
    // 테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    // (musicTableView.rowHeight = 120 대신에 사용가능)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UITableView.automaticDimension
    //    }
    
    
}
