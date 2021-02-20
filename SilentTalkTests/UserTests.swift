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
    
    /*
     [正常系]
     UserDefaultsに保存されてある古いUser構造体のData型から新たなUser構造体のUser型にエンコードするテスト
     前提：version 1.0 → 1.1の際にUser構造体に新たに文字サイズと色付き文字の項目が追加された
     事前：古いUser構造体がdata型で保存されている
     期待：新しいUser型にエンコードできること
     期待：値が正しくエンコードされていること
     期待：デフォルト値が設定されていること
     */
    func testDecode() throws {
        /* 準備 */
        struct OldUser: Hashable, Codable {
            var headMessage: String
            var bottomMessage: String
            var answerCard: [AnswerCard]
            var memo: String
        }
        let oldUser = OldUser(
            headMessage: "上部コメント",
            bottomMessage: "下部コメント",
            answerCard:[AnswerCard(id: 0, title: "タイトル", answers: ["回答"], selectedAnswer: 1, isShow: true)],
            memo: "テストメモ")
        let data = try! JSONEncoder().encode(oldUser)
        do {
            /* 実行 */
            let newUser = try JSONDecoder().decode(User.self, from: data)
            /* 検証 */
            XCTAssertEqual(oldUser.headMessage, newUser.headMessage)
            XCTAssertEqual(oldUser.bottomMessage, newUser.bottomMessage)
            XCTAssertEqual(oldUser.answerCard, newUser.answerCard)
            XCTAssertEqual(oldUser.memo, newUser.memo)
            //設定されていない項目はデフォルト値が設定される
            XCTAssertEqual(28, newUser.customSize)//文字サイズ
            XCTAssertEqual(true, newUser.coloredMessage)//色付き文字
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
