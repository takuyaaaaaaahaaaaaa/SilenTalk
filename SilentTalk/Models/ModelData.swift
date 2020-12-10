//
//  UserData.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/9/20.
//

import SwiftUI
import Combine

final class ModelData: ObservableObject  {
    @Published var user: User = load("userData.json")
    // 設定可能なアンサーカード数
    let answerCardLimit = 4
    // 設定可能な回答数
    let answerLimit = 5
}

extension ModelData {
    func save() -> Void{
        SilentTalk.save(user)
    }
}

extension ModelData{
    var answerCard: [AnswerCard] {
        get{
            return user.answerCard
        }        
    }
}
