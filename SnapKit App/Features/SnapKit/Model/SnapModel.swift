//
//  SnapModel.swift
//  SnapKit App
//
//  Created by NomoteteS on 6.01.2023.
//

import Foundation

// MARK: - Welcome
struct PostModel {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info {
    let count, pages: Int?
    let next: String?
    let prev: NSNull?
}

// MARK: - Result
struct Result {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location {
    let name: String?
    let url: String?
}
