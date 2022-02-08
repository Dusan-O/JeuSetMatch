//
//  Model.swift
//  TennisScore
//
//  Created by Dusan Orescanin on 05/02/2022.
//

import Foundation


import UIKit

enum Player {
    case one, two
}

class Game {

    // MARK: - Properties
    private static let points = [0, 15, 30, 40]
    var scores = [Player.one: 0, Player.two: 0]
    var winner: Player?
    var isOver: Bool {
        return winner != nil
    }

    // MARK: - Methods
    func incrementScore(forPlayer player: Player) {
        if let score = scores[player], let scoreIndex = Game.points.firstIndex(of: score) {
            if score < 40 {
                scores[player] = Game.points[scoreIndex + 1]
            } else {
                end(withWinner: player)
            }
        }
    }

    private func end(withWinner winner: Player) {
        self.winner = winner
    }
}
