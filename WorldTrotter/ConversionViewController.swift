//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Edwin Cardenas on 5/19/25.
//

import UIKit

class ConversionViewController: UIViewController {
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        
        return nf
    }()
    
    var fahrenheitTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = NSLocalizedString("fahrenheitValue", comment: "Fahrenheit value")
        textField.textAlignment = .center
        textField.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 70)
        textField.borderStyle = .none
        textField.keyboardType = .decimalPad
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(fahrenheitFieldEditingChanged), for: .editingChanged)
        
        return textField
    }()
    
    var fahrenheitText: UILabel = {
        let label = UILabel()
        
        label.text = NSLocalizedString("fahrenheitLabel", comment: "Fahrenheit label")
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var connectorLabel: UILabel = {
        let label = UILabel()
        
        label.text = NSLocalizedString("connectorLabel", comment: "Connector label")
        label.font = UIFont.systemFont(ofSize: 36)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var celsiusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "???"
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 70)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var celsiusText: UILabel = {
        let label = UILabel()
        
        label.text = NSLocalizedString("celsiusLabel", comment: "Celsius label")
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func setupUI() {
        view.addSubview(fahrenheitTextField)
        view.addSubview(fahrenheitText)
        view.addSubview(connectorLabel)
        view.addSubview(celsiusLabel)
        view.addSubview(celsiusText)
        
        NSLayoutConstraint.activate([
            fahrenheitTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            fahrenheitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fahrenheitTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            fahrenheitTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            fahrenheitText.topAnchor.constraint(equalTo: fahrenheitTextField.bottomAnchor, constant: 8),
            fahrenheitText.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            fahrenheitText.leadingAnchor.constraint(equalTo: fahrenheitTextField.leadingAnchor),
            
            connectorLabel.topAnchor.constraint(equalTo: fahrenheitText.bottomAnchor, constant: 8),
            connectorLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            connectorLabel.leadingAnchor.constraint(equalTo: fahrenheitTextField.leadingAnchor),
            
            celsiusLabel.topAnchor.constraint(equalTo: connectorLabel.bottomAnchor, constant: 8),
            celsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            celsiusLabel.leadingAnchor.constraint(equalTo: fahrenheitTextField.leadingAnchor),
            
            celsiusText.topAnchor.constraint(equalTo: celsiusLabel.bottomAnchor, constant: 8),
            celsiusText.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            celsiusText.leadingAnchor.constraint(equalTo: fahrenheitTextField.leadingAnchor),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tabBarItem.title = NSLocalizedString("convertTitle", comment: "Convert tabBarItem title")
        tabBarItem.image = UIImage(systemName: "thermometer")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = UIColor(red: 245 / 255.0, green: 244 / 255.0, blue: 241 / 255.0, alpha: 1)
        
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fahrenheitTextField.delegate = self
    }

    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
}

// MARK: - Actions

extension ConversionViewController {
    @objc func fahrenheitFieldEditingChanged(_ sender: UITextField) {
        if let text = sender.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }
}

// MARK: - UITextFieldDelegate

extension ConversionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        let replacingTextHasAlphabeticalCharacters = string.rangeOfCharacter(from: CharacterSet.letters)
        
        if replacingTextHasAlphabeticalCharacters != nil ||
            existingTextHasDecimalSeparator != nil &&
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}
