import UIKit
import SnapKit

final class ViewController: UIViewController {
    let label = UILabel()
    private let stackView = HorizontalUIStackView()
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
        
        [label]
            .forEach { view.addSubview($0) }
        

        // view 레이아웃
        view.backgroundColor = .black
        
        // label 레이아웃
        label.textColor = .white
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        label.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
       
    }
    

}

extension ViewController: HorizontalUIStackViewDelegate {
    func keypadButtonTapped(_ title: String) {
        
        switch title {
        case "0"..."9":
            if labelInput == "0" { labelInput = title }
            else { labelInput += title }
            label.text = labelInput
 
        default:
            print("")
        }
    }
}

