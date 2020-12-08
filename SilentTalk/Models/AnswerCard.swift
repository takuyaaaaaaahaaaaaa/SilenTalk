//
//  File.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCard : Hashable, Codable {
    var id: Int
    var title: String
    var answers: [String]
    var selectedAnswer: Int
    var isShow: Bool
}

