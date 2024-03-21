//
//  GF2ButtonAlertVC.swift
//  noStoryboard
//
//  Created by Ozan Çiçek on 17.03.2024.
//

import UIKit

class GF2ButtonAlertVC: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAligment: .center, fontSize: 22)
    let bodyLabel = GFBodyLabel(textAligment: .center)
    let okButton = GFButton(backgroundColor: .systemBlue, title: "Ok")
    let cancelButton = GFButton(backgroundColor: .systemPink, title: "Cancel")
    
    var alertTitle: String?
    var message: String?
    var okButtonTitle: String?
    var cancelButtonTitle: String?
    
    
    let padding: CGFloat = 22
    
    var delegate: GF2ButtonAlertVCDelegate?
    
    init(alertTitle: String, message: String, okButtonTitle: String, cancelButtonTitle: String) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = alertTitle
        self.message = message
        self.okButtonTitle = okButtonTitle
        self.cancelButtonTitle = cancelButtonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        containerViewCongigure()
        titleLabelConfigure()
        bodyLabelConfiguration()
        buttonsConfiguration()

    }
    
    
    
    func containerViewCongigure(){
        view.addSubview(containerView)
        containerView.layer.cornerRadius = 12
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.backgroundColor = .systemBackground
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
          
    }
    
    func titleLabelConfigure(){
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "something went wrong"
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func bodyLabelConfiguration(){
        containerView.addSubview(bodyLabel)
        bodyLabel.text = message ?? "write message"
        bodyLabel.numberOfLines = 5
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 11),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
            
        ])
        
        
        
    }
    
    
    func buttonsConfiguration(){
        containerView.addSubview(cancelButton)
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonCliced), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            cancelButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            cancelButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
        
        
        containerView.addSubview(okButton)
        okButton.setTitle(okButtonTitle, for: .normal)
        okButton.addTarget(self, action: #selector(okButtonClicked), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            okButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -12),
            okButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            okButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            okButton.heightAnchor.constraint(equalToConstant: 44)
        ])
           
        
    }
    
    
    @objc func okButtonClicked(){
        dismiss(animated: true)
        delegate?.okButtonTapped()
        
    }
    
    @objc func cancelButtonCliced(){
        dismiss(animated: true)
        delegate?.cancelButtonTapped()
        
    }
    
  
    

}


protocol GF2ButtonAlertVCDelegate {
    func okButtonTapped()
    func cancelButtonTapped()
}
