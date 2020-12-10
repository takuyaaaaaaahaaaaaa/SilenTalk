//
//  File.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/10/20.
//

struct User: Hashable, Codable {
    var headMessage: String
    var bottomMessage: String
    var answerCard: [AnswerCard]
    var memo: String
}
