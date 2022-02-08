//
//  Set.swift
//  Jeu Set & Match
//
//  Created by Dusan Orescanin on 05/02/2022.
//

import Foundation

class Set {
    // MARK: - Properties
    var games = [Game()]

    var winner: Player? {
        return getWinner()
    }

    var isOver: Bool {
        return winner != nil
    }

    var scores: [Player: Int] {
        return getScores()
    }

    static let maxNumberOfWonGames = 6

    // MARK: - Private Getters
    private func getWinner() -> Player? {
        for (player, score) in scores where score == Set.maxNumberOfWonGames {
                return player
        }
        return nil
    }

    private func getScores() -> [Player: Int] {
        var scores = [Player.one: 0, Player.two: 0]

        for game in games {
            if let gameWinner = game.winner {
                scores[gameWinner]! += 1
            }
        }
        return scores
    }
}
