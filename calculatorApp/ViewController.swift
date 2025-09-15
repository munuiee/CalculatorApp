import UIKit
import SnapKit

final class ViewController: UIViewController {
    let label = UILabel()
    let labelScroll = UIScrollView()
    private let stackView = HorizontalUIStackView()
    // 수식 변수
    private var labelInput: String = "0"
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        stackView.delegate = self
        view.addSubview(stackView)
        
        // VerticalStackView 오토레이아웃
        stackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    func configure() {
        
        view.addSubview(labelScroll)
        view.addSubview(label)
        
        // view 레이아웃
        view.backgroundColor = .black
        
        // label 레이아웃
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        label.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
}

extension ViewController: HorizontalUIStackViewDelegate {
    func keypadButtonTapped(_ title: String) {
        
        switch title {
        // 0을 입력하는 경우
        case "0"..."9":
            if labelInput == "0" { labelInput = title }
            else { labelInput += title }
            label.text = labelInput
            
            // 예외처리: 음수를 먼저 입력하는 경우 0 제거
            if labelInput.hasPrefix("0-") {
                labelInput.remove(at: labelInput.startIndex)
                label.text = labelInput
            }
            
        // AC 버튼 클릭시 0으로 만듦
        case "AC":
            labelInput = "0"
            label.text = labelInput
            
        // 연산
        case "=":
            if let result = calculate(expression: labelInput) {
                
                // 예외처리: 0으로 나누는 경우 0 출력
                if labelInput.contains("/0") {
                    labelInput = "0"
                    label.text = labelInput
                }
                labelInput = String(result)
                label.text = labelInput
            } else {
                labelInput = "0"
                label.text = labelInput // 계산 실패시 0으로 되돌림
            }
            
        default:
            // 연산자 중복 입력 방지
            let operators: Set<Character> = ["+", "-", "*", "/"]
            if let last = labelInput.last, operators.contains(last) {
                return
            }
            
            labelInput.append(title)
            label.text = labelInput
        }
    }

    
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}

