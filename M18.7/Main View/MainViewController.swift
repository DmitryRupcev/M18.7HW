//
//  ViewController.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 14.04.2024.
//

import UIKit
import SnapKit
import Alamofire

final class MainViewController: UIViewController {
    
    // MARK: - Private View
    
    private lazy var searchText: UITextField = {
        let searchText = UITextField()
        searchText.layer.borderWidth = 1
        searchText.layer.cornerRadius = 5
        searchText.backgroundColor = .lightGray
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
        textView.backgroundColor = .systemGray6
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
        
        view.addSubview(searchText)
        view.addSubview(buttonAlamofire)
        view.addSubview(buttonURLSession)
        view.addSubview(textView)
        view.addSubview(activityIndicator)
    }
}

// MARK: - Extension ViewController
extension MainViewController {
    
    private func setupConstraints() {
        
        textView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.bottom.equalToSuperview().inset(32)
            make.height.equalTo(textView.snp.height).offset(250)
        }
    }
}

