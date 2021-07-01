//
//  UserTableViewCell.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    //MARK:- Declard Variables
    var user: UserModel? {
        didSet {
            titleLabel.text = user?.title
            subtitleLabel.text = user?.subtitle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func showLoader(isShow: Bool) {
        titleLabel.isHidden = isShow
        subtitleLabel.isHidden = isShow
        indicatorView.isHidden = !isShow
        isShow ? indicatorView.startAnimating() : indicatorView.stopAnimating()
    }
}
