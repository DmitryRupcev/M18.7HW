//
//  ViewController.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 14.04.2024.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: - Private View
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.layer.borderWidth = 1
        mainStackView.layer.cornerRadius = 10
        return mainStackView
    }()
    
    private lazy var searchText: UITextField = {
        let searchText = UITextField()
        return searchText
    }()
    
    private lazy var buttonAlamofire: UIButton = {
        let buttonAlamofire = UIButton()
        buttonAlamofire.setTitle("Alamofire", for: .normal)
        buttonAlamofire.layer.borderWidth = 1
        buttonAlamofire.layer.cornerRadius = 5
        buttonAlamofire.backgroundColor = .systemBlue
        return buttonAlamofire
    }()
    
    private lazy var buttonURLSession: UIButton = {
        let buttonURLSession = UIButton()
        return buttonURLSession
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center.y = 0
        activityIndicator.style = .large
        return activityIndicator
    }()

    // MARK: - System Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(mainStackView)
        
        //mainStackView.addArrangedSubview(searchText)
        mainStackView.addArrangedSubview(buttonAlamofire)
        mainStackView.addArrangedSubview(buttonURLSession)
        mainStackView.addArrangedSubview(textView)
    }
}

// MARK: - Extension ViewController
extension ViewController {
    
    private func setupConstraints() {
        
        //
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        //
        textView.snp.makeConstraints { make in
            make.bottom.equalTo(mainStackView.snp.bottom).offset(8)
            make.leading.equalTo(mainStackView.snp.leading).offset(8)
            make.rightMargin.equalTo(mainStackView.snp.rightMargin).offset(8)
            make.top.equalTo(mainStackView.snp.top).offset(200)
        }
        
        //
        buttonAlamofire.snp.makeConstraints { make in
            make.bottom.equalTo(textView.snp.top).offset(-32)
            make.leading.equalTo(mainStackView.snp.leading).offset(16)
            make.top.equalTo(mainStackView.snp.top).offset(120)
        }
        
        //
        buttonURLSession.snp.makeConstraints { make in
            make.bottom.equalTo(textView.snp.top).offset(-32)
            make.leading.equalTo(buttonAlamofire.snp.trailing).offset(-30)
        }
    }
}

