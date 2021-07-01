//
//  UsersViewController.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import UIKit

class UsersViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var usersTableView: UITableView! {
        didSet{
            self.usersTableView.delegate = self
            self.usersTableView.dataSource = self
            usersTableView.register(UserTableViewCell.self)
            usersTableView.addPullToRefresh(controller: self, action: #selector(self.refreshTableView))
            usersTableView.tableFooterView = UIView()
        }
    }
    
    //MARK:- Declared Variables
    private var usersViewModel : UsersViewModel!
    private var networkManager = NetworkManager()

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    
    @objc
    fileprivate func refreshTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.usersTableView.refreshControl?.endRefreshing()
            self.usersViewModel.currentPage = 1
            self.usersTableView.reloadData()
        }
    }
}

//MARK:- Initialization
extension UsersViewController {
    
    fileprivate func initialization() {
        self.title = Constant.users
        initViewModel()
        usersTableView.setActivityLoader()
    }
    
    private func initViewModel() {
        self.usersViewModel = UsersViewModel(self.networkManager)
        self.usersViewModel.fetchUsers()
        self.usersViewModel.bindUsersViewModelToController = { [weak self] in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.usersTableView.restore()
                strongSelf.usersTableView.reloadData()
            }
        }
    }
}

//MARK:- UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.usersViewModel == nil {return 0}
        if self.usersViewModel.currentPage < self.usersViewModel.totalPage {
            return self.usersViewModel.currentPage * Constant.pageDataCount + 1
        } else {
            return self.usersViewModel.users.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueCell(UserTableViewCell.self)  else {
            return UITableViewCell()
        }
        if self.usersViewModel.currentPage < self.usersViewModel.totalPage && self.usersViewModel.currentPage * Constant.pageDataCount == indexPath.row {
            cell.showLoader(isShow: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.usersViewModel.currentPage += 1
                self.usersTableView.reloadData()
            }
        } else {
            cell.showLoader(isShow: false)
            cell.user = self.usersViewModel.users[indexPath.row]
        }
        return cell
    }
 
}

//MARK:- UITableView Delegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.usersViewModel.currentPage < self.usersViewModel.totalPage && self.usersViewModel.currentPage * Constant.pageDataCount == indexPath.row {
            return
        }
        
       //Navigate to details view
//        self.performSegue(withIdentifier: "showDetailSegue", sender: self)
        //This can be done in prepare for segue if using segue.
        if let controller = UserDetailsViewController.instantiate() {
            controller.userDetailViewModel = UserDetailViewModel(self.usersViewModel.users[indexPath.row])
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
