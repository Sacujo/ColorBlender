//
//  ViewController.swift
//  ColorBlender
//
//  Created by Igor Guryan on 09.09.2024.
//

import UIKit
import SnapKit

final class ColorBlenderViewController: UIViewController {

    private var activeButton: UIButton?
    private var activeLabel: UILabel?
    private let networkManager = NetworkManager.shared
    
    lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "ColorBlender"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .white
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
    
    lazy var firstColorPickerButton = UIButton(primaryAction: showColorPicker())
    lazy var secondColorPickerButton = UIButton(primaryAction: showColorPicker())
    lazy var thirdColorPickerButton = UIButton(primaryAction: showColorPicker())
    lazy var fourthColorPickerButton = UIButton(primaryAction: showColorPicker())
    
    lazy var resultColorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Result Color"
        label.textAlignment = .center
        return label
    }()
    
    lazy var firstColorNameLabel = UILabel()
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
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        
    }
    
    private func showColorPicker() -> UIAction {
        let action = UIAction { [weak self] action in
            let button = action.sender as? UIButton
            self?.activeButton = button
            
            switch button?.tag {
            case 0:
                self?.activeLabel = self?.firstColorNameLabel
            case 1:
                self?.activeLabel = self?.secondColorNameLabel
            case 2:
                self?.activeLabel = self?.thirdColorNameLabel
            default:
                self?.activeLabel = self?.fourthColorNameLabel
            }
            
            UIView.animate(withDuration: 1) {
                button?.setTitle("", for: .normal)
                button?.layer.borderWidth = 0
            }
            
            let colorPicker = UIColorPickerViewController()
            colorPicker.delegate = self
            self?.present(colorPicker, animated: true)
        }
        return action
    }
    
    private func blendColors() {
        guard let firstColor = firstColorPickerButton.backgroundColor,
              let secondColor = secondColorPickerButton.backgroundColor,
              let threeColor = thirdColorPickerButton.backgroundColor,
              let fourColor = firstColorPickerButton.backgroundColor else { return }
        
        let mixColors = UIColor.blendColors(firstColor, secondColor, threeColor, fourColor)
        
        UIView.animate(withDuration: 1) {
            self.resultColorView.backgroundColor = mixColors
        }
        
        fetchNameColor(mixColors, isResultColor: true)
    }
    
    private func fetchNameColor(_ color: UIColor, isResultColor: Bool = false) {
        func getRgbString(fromColor: UIColor) -> String {
            let rgbString = color.redValue.description
            + "," + color.greenValue.description
            + "," + color.blueValue.description
            return rgbString
        }
        
        networkManager.fetchColor(rgb: getRgbString(fromColor: color)) { [weak self] colorName in
            DispatchQueue.main.async {
                if isResultColor {
                    self?.resultColorNameLabel.text = colorName
                } else {
                    self?.activeLabel?.text = colorName
                }
            }
        }
    }
    
    func setupButtons(_ buttons: UIButton...) {
        var counter = 0
        buttons.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.borderWidth = 5
            $0.layer.borderColor = UIColor.white.cgColor
            $0.setTitle("Choose", for: .normal)
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .clear
            $0.tag = counter
            counter += 1
        }
    }
    
    func setupLabels(_ labels: UILabel...) {
        var count = 1
        labels.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 15, weight: .bold)
            $0.text = "Color №\(count):"
            count += 1
        }
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
        setupButtons(firstColorPickerButton, secondColorPickerButton, thirdColorPickerButton, fourthColorPickerButton)
        setupLabels(firstColorNameLabel, secondColorNameLabel, thirdColorNameLabel, fourthColorNameLabel, resultColorNameLabel)
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

extension ColorBlenderViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(
        _ viewController: UIColorPickerViewController,
        didSelect color: UIColor,
        continuously: Bool
    ) {
        guard let activeButton = activeButton else { return }
        
        UIView.animate(withDuration: 1) {
            activeButton.backgroundColor = viewController.selectedColor
        }
        
        blendColors()
        fetchNameColor(viewController.selectedColor)
    }
}
#Preview{ColorBlenderViewController()}
