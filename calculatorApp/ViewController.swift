import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    let mainStackView = HorizontalUIStackView()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       
        let stack = mainStackView.makeHorizontalStackView(["7", "8", "9", "+"])
        view.addSubview(stack)
    
        
        
        // stackView 오토레이아웃
        mainStackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.bottom.equalTo(label.snp.bottom).offset(40)
            $0.center.equalToSuperview()
        }
    }
    
    func configure() {
        
        [label]
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
       
    }
    

}

