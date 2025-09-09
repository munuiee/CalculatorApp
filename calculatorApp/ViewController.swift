import UIKit
import SnapKit

/*
  예외처리를 생각해보아요...
  1. =을 입력하는 경우 바로 결과물 도출
  2. 연산자를 연달아 입력하는 경우
  3. 0으로 나누는 경우?
*/

final class ViewController: UIViewController {
    let label = UILabel()
    private let stackView = HorizontalUIStackView()
    // 계산 문자열 저장 변수
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

// UIStackView delegate
extension ViewController: HorizontalUIStackViewDelegate {
    func keypadButtonTapped(_ title: String) {
        // 0을 입력하는 경우
        switch title {
            
        case "0"..."9":
            if labelInput == "0" { labelInput = title }
            else { labelInput += title }
            label.text = labelInput
            
        // AC 버튼 클릭시 0으로 만듦
        case "AC":
            labelInput = "0"
            label.text = labelInput
            
        // 계산
        case "=":
            // 함수가 옵셔널로 반환되므로 옵셔널 바인딩
            if let result = calculate(expression: labelInput) {
                labelInput = String(result) // 화면에 나타내기 위해 result를 문자열로 변환
                label.text = labelInput
            } else {
                labelInput = "0"
                label.text = labelInput // 계산 실패시 0으로 되돌림
            }
     
        default:
            // 연산자 중복 입력 방지
            let operators: Set<Character> = ["+", "-", "*", "/"]
            if let last = labelInput.last, operators.contains(last) {
                return // 중복된 연산자가 마지막에 오면 바로 함수 종료
            }
            labelInput.append(title)
            label.text = labelInput
        }
    }

    
    // NSExpression을 이용해서 문자열을 계산하는 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: labelInput) // format에 문자열이 들어가야함
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}

