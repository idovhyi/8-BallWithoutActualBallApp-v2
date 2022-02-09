//
//  Model.swift
//  8-BallWithoutActualBallApp
//
//  Created by Ihor Dovhyi on 25.01.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let magic: Magic
}

// MARK: - Magic
struct Magic: Codable {
    let question, answer, type: String
}
