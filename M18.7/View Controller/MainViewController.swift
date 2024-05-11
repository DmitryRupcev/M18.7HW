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
    
    // MARK: - Private Property
    private let textField = TextField(placeHolder: "Введите текст")
    private let placeHolder = "   Результат поиска"
    private let alamofireRequest = AlamofireRequestManager.shared
    private lazy var keyword = ""
    
    //MARK: - Private View
    
    lazy var requestTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите слово для поиска"
        textField.textColor = Constants.Color.textColorDark
        textField.font = Constants.Fonts.secondaryFont
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        return textField
    }()
    
    private lazy var textViewResult: UITextView = {
        let textViewResult = UITextView()
        textViewResult.text = placeHolder
        textViewResult.textColor = Constants.Color.textColorSystemGray
        textViewResult.layer.cornerRadius = 7
        textViewResult.layer.borderWidth = 1
        textViewResult.layer.borderColor = #colorLiteral(red: 0.1393499672, green: 0.149340719, blue: 0.1577528417, alpha: 1)
        textViewResult.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textViewResult.font = Constants.Fonts.secondaryFont
        return textViewResult
    }()
    
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
    
    /// The loading indicator
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center.y = 0
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    @objc private func onLoad(_ animation: UIButton) {
        
        let originalColor = animation.backgroundColor
        animation.backgroundColor = .systemGray
        animation.backgroundColor = .orange
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            animation.backgroundColor = originalColor
        }
        
        self.getInfo()
    }
    
    private func getInfo() {
        
        view.endEditing(true)
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
        
        if let word = requestTextField.text {
            keyword = word.lowercased()
        }
        
        alamofireRequest.searchMovies(by: keyword) { (result: Result<SearchModel, Error>) in
            switch result {
            case .success(let searchModel):
                let film = searchModel.films
                
                DispatchQueue.main.async { [weak self] in
                    self?.textViewResult.textColor = Constants.Color.textColorDark
                    self?.textViewResult.text = "\(film)"
                    self?.activityIndicator.stopAnimating()
                }
                
            case .failure(let error):
                print("Error:", error)
            }
        }
    }
        
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
        buttonAlamofire.addTarget(self, action: #selector(onLoad), for: .touchUpInside)
    }
}

// MARK: - Setting
private extension MainViewController {
    
    func addSubview() {
        view.addSubview(requestTextField)
        view.addSubview(buttonAlamofire)
        view.addSubview(buttonURLSession)
        view.addSubview(textViewResult)
        view.addSubview(activityIndicator)
    }
}

// MARK: - Extension Layout
private extension MainViewController {
    
    func setupConstraints() {
        
        // Constraints textField
        requestTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        // Constraints buttonAlamofire
        buttonAlamofire.snp.makeConstraints { make in
            make.top.equalTo(requestTextField.snp.bottom).offset(32)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.right.equalTo(view.snp.right).offset((view.frame.width / -2) - 32)
            make.height.equalTo(buttonAlamofire.snp.height).inset(10)
        }
        
        // Constraints buttonURLSession
        buttonURLSession.snp.makeConstraints { make in
            make.top.equalTo(requestTextField.snp.bottom).offset(32)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-32)
            make.left.equalTo(view.snp.left).offset((view.frame.width / 2 ) + 32)
            make.height.equalTo(buttonURLSession.snp.height).inset(10)
        }
        
        // Constraints textViewResult
        textViewResult.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}
