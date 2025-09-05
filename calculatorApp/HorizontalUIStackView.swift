import UIKit
import SnapKit

final class HorizontalUIStackView: UIStackView {
    
    // delegate 연결
    weak var delegate: HorizontalUIStackViewDelegate?
    
    @objc private func didTapButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        delegate?.keypadButtonTapped(title)
    }
    
    private var mainButtons: [UIButton] = []
    private let nums =  [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]
    
    init() {
        super.init(frame: .zero)
        makeVertaicalStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeVertaicalStackView() {
        self.axis = .vertical
        self.backgroundColor = .black
        self.spacing = 10
        self.distribution = .fillEqually
        

        for row in nums {
            let hStackView = UIStackView()
            // HotizontalStackView 레이아웃
            hStackView.axis = .horizontal
            hStackView.backgroundColor = .black
            hStackView.spacing = 10
            hStackView.distribution = .fillEqually
            
            for title in row {
                let button = UIButton()
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                button.layer.cornerRadius = 40
                button.snp.makeConstraints {
                    $0.width.equalTo(80)
                    $0.height.equalTo(80)
                }
                
                // 연산자 버튼 색상
                 let operators = ["+", "-", "*", "/", "=", "AC"]
                              
                 if operators.contains(title) {
                    button.backgroundColor = .orange
                    button.setTitleColor(.white, for: .normal)
                 } else {
                     button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                     button.setTitleColor(.white, for: .normal)
                 }
                
                hStackView.addArrangedSubview(button)
                mainButtons.append(button)
                
                button.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
                button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

            }

            self.addArrangedSubview(hStackView)
            hStackView.snp.makeConstraints { $0.height.equalTo(80) }
            
        }
 
    }
    
    @objc
    private func buttonClicked() {
        print("버튼이 잘 작동됨! 'ㅅ')👍")
    }
    
    
    
    
}
