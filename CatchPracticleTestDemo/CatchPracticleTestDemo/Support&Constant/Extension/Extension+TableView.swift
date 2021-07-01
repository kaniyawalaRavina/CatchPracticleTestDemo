//
//  Extension+TableView.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import Foundation
import UIKit

extension UITableView {
    
    func dequeueCell<T:UITableViewCell>(_ cell :T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: cell)) as? T
    }
    
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        
        let identifier = String(describing: T.self)
        let nib = UINib(nibName: identifier, bundle: Bundle.main)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func addPullToRefresh(controller: UIViewController,
                          action: Selector) {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        self.refreshControl = refreshControl
        self.refreshControl?.backgroundColor = .lightGray
        refreshControl.addTarget(controller, action: action, for: .valueChanged)
    }
    
    func setActivityLoader(_ color: UIColor = .black,
                           style: UIActivityIndicatorView.Style = .large) {
        let loader = UIActivityIndicatorView(style: style)
        loader.color = color
        loader.startAnimating()
        self.backgroundView = loader
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
