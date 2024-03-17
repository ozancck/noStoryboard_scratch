//
//  GFTextField.swift
//  noStoryboard
//
//  Created by Ozan Çiçek on 16.03.2024.
//

import UIKit

class GFTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configur()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configur() {
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor

        textColor = .label
        tintColor = .label
        textAlignment = .center

        font = UIFont.preferredFont(forTextStyle: .title2)

        // big text problem fixed
        adjustsFontSizeToFitWidth = true

        minimumFontSize = 12

        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        
        //keyboard enter tusu
        returnKeyType = .go

        placeholder = "Enter a username"
    }
}
