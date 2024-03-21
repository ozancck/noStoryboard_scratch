//
//  FollowerListVC.swift
//  noStoryboard
//
//  Created by Ozan Çiçek on 16.03.2024.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //diger sayfada gizelmistik. bu sayfada gozukmesini istiyoruz
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    


}
