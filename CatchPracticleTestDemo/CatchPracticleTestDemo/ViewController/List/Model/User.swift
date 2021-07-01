//
//  User.swift
//  CatchPracticleTestDemo
//
//  Created by Riya Kaniyawala on 01/07/21.
//

import Foundation

// MARK: - UserModel
struct User: Codable {
    let id: Int?
    let title, subtitle, content: String?
}

typealias Users = [User]
