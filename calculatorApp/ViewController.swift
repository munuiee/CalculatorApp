//
//  ViewController.swift
//  calculatorApp
//
//  Created by 변지혜 on 9/4/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let plusButton = UIButton()
    
    let mainStackView = HorizontalUIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        let stackView = mainStackView.makeHorizontalStackView([button1, button2, button3, plusButton])

        view.addSubview(stackView)
        
        // stackView 오토레이아웃
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.bottom.equalTo(label.snp.bottom).offset(40)
            $0.center.equalToSuperview()
        }
        
    }

    
    func configure() {
        [label, button1, button2, button3, plusButton]
            .forEach { view.addSubview($0) }
         
        // view 레이아웃
        view.backgroundColor = .black
        
        // label 레이아웃
        label.textColor = .white
        label.text = "12345"
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        label.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        
        
        // Button 레이아웃
        button1.setTitle("7", for: .normal)
        button1.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button1.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        //button1.layer.cornerRadius = 40
        button1.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
        
        button2.setTitle("8", for: .normal)
        button2.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button2.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        //button2.layer.cornerRadius = 40
        
        button2.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
    
        
        button3.setTitle("9", for: .normal)
        button3.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button3.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        //button2.layer.cornerRadius = 40
        
        button3.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        plusButton.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        //button2.layer.cornerRadius = 40
        
        plusButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
       
    }


}

