//
//  UserTests.swift
//  SilentTalkTests
//
//  Created by takuya_tominaga on 2/19/21.
//

import XCTest
@testable import SilentTalk

class UserTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // 古いUser型
    struct OldUser: Hashable, Codable {
        var headMessage: String
        var bottomMessage: String
        var answerCard: [AnswerCard]
        var memo: String
    }
    
    /*
     [正常系]
     User型にcustomSizeフィールドを追加後のエンコード・デコードテスト
     */
    func testDecode() throws {
        let oldUser = OldUser(
            headMessage: "上部コメント",
            bottomMessage: "下部コメント",
            answerCard:[AnswerCard(id: 0, title: "タイトル", answers: ["回答"], selectedAnswer: 1, isShow: true)],
            memo: "テストメモ")
        
        do {
            let data = try JSONEncoder().encode(oldUser)
            let newUser = try JSONDecoder().decode(User.self, from: data)

            XCTAssertEqual(oldUser.headMessage, newUser.headMessage)
            XCTAssertEqual(oldUser.bottomMessage, newUser.bottomMessage)
            XCTAssertEqual(oldUser.answerCard, newUser.answerCard)
            XCTAssertEqual(oldUser.memo, newUser.memo)
            // customSizeが設定されていない場合はデフォルトで0が設定される
            XCTAssertEqual(28, newUser.customSize)
        } catch {
            XCTFail()
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
