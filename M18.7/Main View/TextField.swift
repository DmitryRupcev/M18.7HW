//
//  TextField.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 22.04.2024.
//

import Foundation
import UIKit

//MARK: - TextField Custom
final class TextField: UITextField {
    
    //MARK: - Initializer
    init(placeHolder: String) {
        super.init(frame: .zero)
        setupTextField(placeHolder: placeHolder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupTextField(placeHolder: String) {
        textColor = #colorLiteral(red: 0.1393499672, green: 0.149340719, blue: 0.1577528417, alpha: 1)
        
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.shadowColor = UIColor.black.cgColor
        //layer.shadowRadius = 10
        //layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 10, height: 10)
        
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        font = .boldSystemFont(ofSize: 18)
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
