//
//  GFButton.swift
//  noStoryboard
//
//  Created by Ozan Çiçek on 2.03.2024.
//

import UIKit

class GFButton: UIButton {
    
    
    
    //this is my custom uibutton GF meaninig github follower
    override init(frame: CGRect) {
        super.init(frame: frame)
        configur()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configur()
    }
    
    
    private func configur(){
        layer.cornerRadius       = 10
        titleLabel?.textColor    = .white
        titleLabel?.font         = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}
