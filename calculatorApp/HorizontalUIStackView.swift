//
//  HorizontalUIStackView.swift
//  calculatorApp
//
//  Created by 변지혜 on 9/4/25.
//

import UIKit
import SnapKit

class HorizontalUIStackView: UIStackView {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // StackView 서브뷰 추가하기
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalStackView = UIStackView()
        
        // stackView 레이아웃
        horizontalStackView.axis = .horizontal
        horizontalStackView.backgroundColor = .black
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        views.forEach { horizontalStackView.addArrangedSubview($0) }
        
        return horizontalStackView
    }

}
