//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Edwin Cardenas on 5/19/25.
//

import UIKit

class ViewController: UIViewController {
    
    var fahrenheitNumber: UILabel = {
        let label = UILabel()
        
        label.text = "212"
        label.textColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        
        label.text = "100"
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.yellow.cgColor,
            UIColor.red.cgColor,
            UIColor.blue.cgColor,
            UIColor.cyan.cgColor,
            UIColor.green.cgColor,
        ].reversed()
                
        view.layer.addSublayer(gradientLayer)
        
        setupUI()
    }
}

