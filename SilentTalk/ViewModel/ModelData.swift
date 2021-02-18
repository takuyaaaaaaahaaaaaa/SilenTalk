//
//  UserData.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/9/20.
//

import SwiftUI
import Combine

final class ModelData: ObservableObject  {
    @Published var user: User = UserRepository().load("userData.json")
    // 設定可能なアンサーカード数
    let answerCardLimit = 4
    // 設定可能な回答数
    let answerLimit = 5
    // 文字サイズ変更のステップ数
    let charStep = 1.0
    // 文字サイズの範囲
    let charRange = 10...40.0
}

extension ModelData {
    func save() -> Void{
        UserRepository().save(user)
    }
}

extension ModelData{
    var answerCard: [AnswerCard] {
        get{
            return user.answerCard
        }        
    }
}
