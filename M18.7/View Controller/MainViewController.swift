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
    
    //MARK: - Private View
    private lazy var textViewResult: UITextView = {
        let textViewResult = UITextView()
        textViewResult.text = placeHolder
        textViewResult.textColor = Constants.Color.textColorSystemGray
        textViewResult.layer.cornerRadius = 7
        textViewResult.layer.borderWidth = 1
        textViewResult.layer.borderColor = #colorLiteral(red: 0.1393499672, green: 0.149340719, blue: 0.1577528417, alpha: 1)
        textViewResult.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textViewResult.font = .boldSystemFont(ofSize: 18)
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
        self.textViewResult.delegate = self
    }
}

// MARK: - Setting
private extension MainViewController {
    
    func addSubview() {
        view.addSubview(textField)
        view.addSubview(buttonAlamofire)
        view.addSubview(buttonURLSession)
        view.addSubview(textViewResult)
    }
}

// MARK: - Extension Layout
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
        textViewResult.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
    }
}

// MARK: - Extension UITextViewDelegate
extension MainViewController: UITextViewDelegate {
    
    //MARK: - Internal Methods
    internal func textViewDidBeginEditing(_ textView: UITextView) {

        textView.text = ""
        textView.textColor = .black
        textView.font = .boldSystemFont(ofSize: 18)
        
        if textView.text == placeHolder  {
            textView.textColor = .systemGray
        }
        textView.becomeFirstResponder()
    }
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text == "" {
            textView.text = placeHolder
            textView.textColor = .systemGray
        }
        textView.resignFirstResponder()
    }
}
