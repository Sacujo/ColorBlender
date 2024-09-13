//
//  ModelColor.swift
//  ColorBlender
//
//  Created by Igor Guryan on 13.09.2024.
//

import Foundation

struct ModelColor: Decodable {
    let name: Name
}

struct Name: Decodable {
    let value: String
}
