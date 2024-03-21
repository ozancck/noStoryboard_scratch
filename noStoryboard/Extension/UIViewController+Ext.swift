//
//  UIViewController+Ext.swift
//  noStoryboard
//
//  Created by Ozan Çiçek on 17.03.2024.
//

import UIKit

extension UIViewController {
    
    
    func presentGFAlertOnMainThread(alertTitle: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func present2ButtonAlert(alertTitle: String, message: String, okButtonTitle: String, cancelButtonTitle: String){
        DispatchQueue.main.async {
            let alerVC = GF2ButtonAlertVC(alertTitle: alertTitle, message: message, okButtonTitle: okButtonTitle, cancelButtonTitle: cancelButtonTitle)
            
            alerVC.modalPresentationStyle = .overFullScreen
            alerVC.modalTransitionStyle = .crossDissolve
            
            alerVC.delegate = self as? GF2ButtonAlertVCDelegate
            
            self.present(alerVC, animated: true)
        }
        
        
        
        
        
    }
    
}
