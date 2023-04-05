//
//  MusicCollectionViewCell.swift
//  MusicAPP
//
//  Created by yujaehong on 2023/04/03.
//

import UIKit



class MusicCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    
    // 이미지 URL을 전달받는 속성
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // URL -> 이미지를 셋팅하는 메서드
    private func loadImage() {
        
    }
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행 ⭐️
        self.mainImageView.image = nil
    }
    
}
