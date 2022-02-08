//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Dusan Orescanin on 08/02/2022.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    func setPlayerOneScore(_ score: Int) {
        game.scores[.one] = score
    }
    
    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
        // 1
        let game = Game()
        
        // 2
        game.incrementScore(forPlayer: .one)
        
        // 3
        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
        
    func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
        game.scores[.one] = 15
            
        game.incrementScore(forPlayer: .one)
            
        XCTAssert(game.scores[.one]! == 30)
        XCTAssert(game.scores[.two]! == 0)
        }
        
    func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {
        game.scores[.one] = 30

        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 40)
        XCTAssert(game.scores[.two]! == 0)
        }
        
    func testGivenScoreIsForty_WhenIncrementingPlayer1Score_ThenGameIsOverAndWonByPlayer1() {
        setPlayerOneScore(40)

        game.incrementScore(forPlayer: .one)

        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
        }
}
