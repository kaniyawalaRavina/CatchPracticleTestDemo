//
//  UserDetailsViewController.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import UIKit

class UserDetailsViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var detailsTextView: UITextView!
    
    //MARK:- Declared Variables
    var userDetailViewModel : UserDetailViewModel!
    static func instantiate() -> UserDetailsViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController
    }

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
}

//MARK:- Initialization
extension UserDetailsViewController {
    func initialization() {
        if let userData = userDetailViewModel {
            self.title = userData.userModel.title
            self.detailsTextView.text = userData.userModel.content
        }
    }
}
