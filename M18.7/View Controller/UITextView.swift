//
//  UITextView.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 23.04.2024.
//

import Foundation
import UIKit

//MARK: - TextView Custom
final class TextView: UITextView, UITextViewDelegate {
    
    //MARK: - Private Property
    private let placeHolder = "Результат поиска"
    
    //MARK: - Initializer
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        delegate = self
        self.setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Internal Methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if (textView.text == placeHolder && textView.textColor == .lightGray)  {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = placeHolder
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
    
    //MARK: - Private Methods
    private func setupTextView() {
        
        text = placeHolder
        textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        layer.cornerRadius = 7
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.1393499672, green: 0.149340719, blue: 0.1577528417, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
}
