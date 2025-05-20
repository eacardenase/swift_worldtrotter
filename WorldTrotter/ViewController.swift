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
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var fahrenheitText: UILabel = {
        let label = UILabel()
        
        label.text = "degrees Fahrenheit"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var connectorLabel: UILabel = {
        let label = UILabel()
        
        label.text = "is really"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var celsiusNumber: UILabel = {
        let label = UILabel()
        
        label.text = "100"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var celsiusText: UILabel = {
        let label = UILabel()
        
        label.text = "degrees Celsius"
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
            fahrenheitNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fahrenheitNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fahrenheitText.topAnchor.constraint(equalTo: fahrenheitNumber.bottomAnchor, constant: 40),
            fahrenheitText.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor),
            
            connectorLabel.topAnchor.constraint(equalTo: fahrenheitText.bottomAnchor, constant: 40),
            connectorLabel.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor),
            
            celsiusNumber.topAnchor.constraint(equalTo: connectorLabel.bottomAnchor, constant: 40),
            celsiusNumber.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor),
            
            celsiusText.topAnchor.constraint(equalTo: celsiusNumber.bottomAnchor, constant: 40),
            celsiusText.centerXAnchor.constraint(equalTo: fahrenheitNumber.centerXAnchor)
        ])
    }
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = .white
        
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

