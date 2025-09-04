import UIKit
import SnapKit

class HorizontalUIStackView: UIStackView {
    
    var mainButtons: [UIButton] = []
    let nums = ["7", "8", "9", "+"]
    //let horizontalStackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // StackView 서브뷰 추가하기
    func makeHorizontalStackView(_ nums: [String]) -> UIStackView {
        
        // stackView 레이아웃
        self.axis = .horizontal
        self.backgroundColor = .black
        self.spacing = 10
        self.distribution = .fillEqually
        
        for num in nums {
            let button = UIButton()
            button.setTitle("\(num)", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
            
            button.snp.makeConstraints {
                $0.width.equalTo(80)
                $0.height.equalTo(80)
            }
            
            button.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
            
            
            self.addArrangedSubview(button)
            mainButtons.append(button)
        }
        
                
        return self
    }
    
    @objc private func buttonClicked() {
        print("버튼 눌림 'ㅅ'")
    }
    
   
    


    
}
