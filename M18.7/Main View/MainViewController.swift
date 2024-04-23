//
//  ViewController.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 14.04.2024.
//

import UIKit
import SnapKit
import Alamofire

//MARK: - MainViewController
final class MainViewController: UIViewController {
    
    // MARK: - Private View
    private let textField = TextField(placeHolder: "Введите текс")
    private let textView = TextView()
    
    private lazy var buttonAlamofire: UIButton = {
        let buttonAlamofire = UIButton()
        buttonAlamofire.setTitle("Alamofire", for: .normal)
        buttonAlamofire.layer.borderWidth = 1
        buttonAlamofire.layer.cornerRadius = 5
        buttonAlamofire.backgroundColor = .systemBlue
        buttonAlamofire.translatesAutoresizingMaskIntoConstraints = false
        return buttonAlamofire
    }()
    
    private lazy var buttonURLSession: UIButton = {
        let buttonURLSession = UIButton()
        buttonURLSession.setTitle("URLSession", for: .normal)
        buttonURLSession.layer.borderWidth = 1
        buttonURLSession.layer.cornerRadius = 5
        buttonURLSession.backgroundColor = .systemBlue
        return buttonURLSession
    }()
    

    private lazy var textViewResult: UITextView = {
        let textViewResult = UITextView()
        textViewResult.backgroundColor = .systemGray6
        textViewResult.layer.borderWidth = 2
        textViewResult.layer.cornerRadius = 10
        textViewResult.isScrollEnabled = true
        textViewResult.textColor = .darkGray
        return textViewResult
    }()

    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center.y = 0
        activityIndicator.style = .large
        return activityIndicator
    }()

    // MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
}

// MARK: - Setting Views
private extension MainViewController {
    
    func setupView() {
        addSubview()
        setupConstraints()
    }
}

// MARK: - Setting
private extension MainViewController {
    
    func addSubview() {
        view.addSubview(textField)
        view.addSubview(buttonAlamofire)
        view.addSubview(buttonURLSession)
        view.addSubview(textView)
    }
}

// MARK: - Layout
private extension MainViewController {
    
    func setupConstraints() {
        
        // Constraints textField
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        // Constraints buttonAlamofire
        buttonAlamofire.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(32)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.right.equalTo(view.snp.right).offset((view.frame.width / -2) - 32)
            make.height.equalTo(buttonAlamofire.snp.height).inset(10)
        }
        
        // Constraints buttonURLSession
        buttonURLSession.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(32)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-32)
            make.left.equalTo(view.snp.left).offset((view.frame.width / 2 ) + 32)
            make.height.equalTo(buttonURLSession.snp.height).inset(10)
        }
        
        // Constraints textViewResult
        textView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(300)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        
    }
}
