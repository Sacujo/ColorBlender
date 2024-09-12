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
    
    lazy var topPickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var bottomPickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()

    
    lazy var firstColourPickerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var secondColourPickerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var thirdColourPickerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var fourthColourPickerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var resultColorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var firstColorPickerButton = UIButton.createColorPickerButton()
    lazy var secondColorPickerButton = UIButton.createColorPickerButton()
    lazy var thirdColorPickerButton = UIButton.createColorPickerButton()
    lazy var fourthColorPickerButton = UIButton.createColorPickerButton()
    
    lazy var resultColorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Color"
        label.textAlignment = .center
        return label
    }()
    
    lazy var firstColorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Color"
        label.textAlignment = .center
        return label
    }()
    lazy var secondColorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Color"
        label.textAlignment = .center
        return label
    }()
    lazy var thirdColorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Color"
        label.textAlignment = .center
        return label
    }()
    lazy var fourthColorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Color"
        label.textAlignment = .center
        return label
    }()
    
    lazy var resultColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupView()
        setupLayout()
        
    }
    
    func setupView() {
        view.addSubview(appNameLabel)
        view.addSubview(topPickerStackView)
        view.addSubview(bottomPickerStackView)
        view.addSubview(resultColorStack)
        firstColourPickerStack.addArrangedSubview(firstColorPickerButton)
        firstColourPickerStack.addArrangedSubview(firstColorNameLabel)
        secondColourPickerStack.addArrangedSubview(secondColorPickerButton)
        secondColourPickerStack.addArrangedSubview(secondColorNameLabel)
        thirdColourPickerStack.addArrangedSubview(thirdColorPickerButton)
        thirdColourPickerStack.addArrangedSubview(thirdColorNameLabel)
        fourthColourPickerStack.addArrangedSubview(fourthColorPickerButton)
        fourthColourPickerStack.addArrangedSubview(fourthColorNameLabel)
        topPickerStackView.addArrangedSubview(firstColourPickerStack)
        topPickerStackView.addArrangedSubview(secondColourPickerStack)
        bottomPickerStackView.addArrangedSubview(thirdColourPickerStack)
        bottomPickerStackView.addArrangedSubview(fourthColourPickerStack)
        resultColorStack.addArrangedSubview(resultColorView)
        resultColorStack.addArrangedSubview(resultColorNameLabel)
    }
    
    func setupLayout() {
        appNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        topPickerStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(appNameLabel.snp.bottom).offset(50)
        }
        
        bottomPickerStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(topPickerStackView.snp.bottom).offset(50)
        }
        
        resultColorStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        [
            firstColorPickerButton,
            secondColorPickerButton,
            thirdColorPickerButton,
            fourthColorPickerButton,
            resultColorView
        ].forEach({
            $0.snp.makeConstraints { make in
                make.size.equalTo(view.frame.width / 3)
            }
        })
        
        
    }
    
}
#Preview{ColorBlenderViewController()}
