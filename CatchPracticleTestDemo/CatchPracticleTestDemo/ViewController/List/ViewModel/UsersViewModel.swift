//
//  UsersViewModel.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import Foundation

class UsersViewModel {
    private var networkManager : Networkable!
    var currentPage: Int = 0
    var totalPage: Int = 0
    private(set) var users : Users! = [] {
        didSet {
            self.currentPage = 1
            self.totalPage = Int(users.count/Constant.pageDataCount)
            if users.count%Constant.pageDataCount != 0 {
                self.totalPage += 1
            }
            self.bindUsersViewModelToController()
        }
    }
    
    var bindUsersViewModelToController : (() -> ()) = {}
    
    
    init(_ networkManager: Networkable = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchUsers() {
        networkManager.fetchUserss (completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let users):
                strongSelf.users = users
            case .failure(let error):
                strongSelf.users = []
                print(error.localizedDescription)
            }
        })
    }
}
