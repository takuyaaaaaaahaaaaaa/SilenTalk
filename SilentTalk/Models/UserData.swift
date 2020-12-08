//
//  UserData.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/9/20.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var answerCard: [AnswerCard] = answerCardData
    @Published var headMessage: String = "私は耳が聞こえづらいです"
    @Published var bottomMessage: String = "ありがとうございます"
}
