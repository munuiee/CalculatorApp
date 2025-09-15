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
        
        let verticalStack = makeVertaicalStackView([])
        addSubview(verticalStack)
        // 내부 스택을 self에 붙여주기
        verticalStack.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeVertaicalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        
        // VerticalStackView 레이아웃
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        // HorizontalStackView 반복
        for row in nums {

            let hStackView = UIStackView()
            
            // HorizontalStackView 레이아웃
            hStackView.axis = .horizontal
            hStackView.backgroundColor = .black
            hStackView.spacing = 10
            hStackView.distribution = .fillEqually
            
            
            // 배열 안 문자열 반복
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
                
                // 연산자 버튼 색상 - enum 활용
                // let operators = ["+", "-", "*", "/", "=", "AC"]
                
                enum Operators: String {
                    case plus = "+"
                    case minus = "-"
                    case multiply = "*"
                    case divide = "/"
                    case equal = "="
                    case delete = "AC"
                }
                
                if Operators(rawValue: title) != nil {
                    button.backgroundColor = .orange
                    button.setTitleColor(.white, for: .normal)
                 } else {
                     button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                     button.setTitleColor(.white, for: .normal)
                 }
                
                hStackView.addArrangedSubview(button)
                mainButtons.append(button)

                button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

            }
            stackView.addArrangedSubview(hStackView)
            
            // HorizontalStackView 오토레이아웃
            hStackView.snp.makeConstraints { $0.height.equalTo(80) }
            
        }
        return stackView
 
    }
}
