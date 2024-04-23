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
    let placeHolder = "Результат поиска"
    
    //MARK: - Initializer
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: .zero, textContainer: textContainer)
        self.setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Internal Methods
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeHolder && textView.textColor == .lightGray  {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    internal func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = placeHolder
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
    
    //MARK: - Private Methods
    private func setupTextView() {
        
        text = placeHolder
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        delegate = self
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
