//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Edwin Cardenas on 5/19/25.
//

import UIKit

class ConversionViewController: UIViewController {
    
    var fahrenheitNumber: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "value"
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
        
        label.text = "degrees Fahrenheit"
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var connectorLabel: UILabel = {
        let label = UILabel()
        
        label.text = "is really"
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var celsiusNumber: UILabel = {
        let label = UILabel()
        
        label.text = "???"
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var celsiusText: UILabel = {
        let label = UILabel()
        
        label.text = "degrees Celsius"
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func setupUI() {
        view.addSubview(fahrenheitNumber)
        view.addSubview(fahrenheitText)
        view.addSubview(connectorLabel)
        view.addSubview(celsiusNumber)
        view.addSubview(celsiusText)
        
        NSLayoutConstraint.activate([
            fahrenheitNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            fahrenheitNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fahrenheitText.topAnchor.constraint(equalTo: fahrenheitNumber.bottomAnchor, constant: 8),
            fahrenheitText.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor),
            
            connectorLabel.topAnchor.constraint(equalTo: fahrenheitText.bottomAnchor, constant: 8),
            connectorLabel.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor),
            
            celsiusNumber.topAnchor.constraint(equalTo: connectorLabel.bottomAnchor, constant: 8),
            celsiusNumber.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor),
            
            celsiusText.topAnchor.constraint(equalTo: celsiusNumber.bottomAnchor, constant: 8),
            celsiusText.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tabBarItem.title = "Convert"
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
    }


}

// MARK: - Actions

extension ConversionViewController {
    @objc func fahrenheitFieldEditingChanged(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty {
            celsiusNumber.text = sender.text
        } else {
            celsiusNumber.text = "???"
        }
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitNumber.resignFirstResponder()
    }
}
