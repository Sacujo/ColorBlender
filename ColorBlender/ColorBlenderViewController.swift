//
//  ViewController.swift
//  ColorBlender
//
//  Created by Igor Guryan on 09.09.2024.
//

import UIKit
import SnapKit

class ColorBlenderViewController: UIViewController {

    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "ColorBlender"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var firstColourPickerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var secondColourPickerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var firstColorPickerButton = UIButton.createColorPickerButton()
    lazy var secondColorPickerButton = UIButton.createColorPickerButton()
    lazy var thirdColorPickerButton = UIButton.createColorPickerButton()
    lazy var fourthColorPickerButton = UIButton.createColorPickerButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupView()
        setupLayout()
        
    }
    
    func setupView() {
        view.addSubview(appNameLabel)
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(firstColorPickerButton)
        topStackView.addArrangedSubview(secondColorPickerButton)
    }
    
    func setupLayout() {
        appNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        topStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(appNameLabel.snp.bottom).offset(50)
        }
        
        [
            firstColorPickerButton,
            secondColorPickerButton,
            thirdColorPickerButton,
            fourthColorPickerButton
        ].forEach({
            $0.snp.makeConstraints { make in
                make.size.equalTo(view.frame.width / 3)
            }
        })
        
        
    }
    
}
#Preview{ColorBlenderViewController()}
