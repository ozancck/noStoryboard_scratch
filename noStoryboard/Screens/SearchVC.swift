//
//  SearchVC.swift
//  noStoryboard
//
//  Created by Ozan Çiçek on 24.02.2024.
//

import UIKit

class SearchVC: UIViewController, GF2ButtonAlertVCDelegate {
    func okButtonTapped() {
        print("ok")
    }
    
    func cancelButtonTapped() {
        print("cancel")
    }
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
  
    
    
    

    var usernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureButton()
        createDismissKeyboardTapGesture()
        
        
    }

    // her gorundugunde calisir
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @objc func pushFollowerListVC() {
        
        guard usernameEntered else {
            
            //false ise calisacak olan kisim
            //presentGFAlertOnMainThread(alertTitle: "Emty Username", message: "Please Enter Username 😀", buttonTitle: "Ok")
            
            present2ButtonAlert(alertTitle: "emty user name", message: "message", okButtonTitle: "ok", cancelButtonTitle: "cancel")

           
            
            return
        }
        
        
        
        let followerListVC = FollowerListVC()
        followerListVC.title = usernameTextField.text
        followerListVC.username = usernameTextField.text

        navigationController?.pushViewController(followerListVC, animated: true)
    }

    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(systemName: "book")
        logoImageView.tintColor = .systemBlue

        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),

        ])
    }

    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self

        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            usernameTextField.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 47),
            
            

        ])
    }

    func configureButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    // when i clicked go botton from keyboard.9
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
