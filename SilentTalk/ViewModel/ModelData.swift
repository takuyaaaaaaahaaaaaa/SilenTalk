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

// 文字の大きさ変更
extension ModelData {
    func sizeUpChar(){
        guard (user.customSize + CHAR_SIZE_CHENGE_STEP) < CHAR_SIZE_RENGE.upperBound else {
            return
        }
        user.customSize = user.customSize + CHAR_SIZE_CHENGE_STEP
    }
    
    func sizeDownChar(){
        guard (user.customSize - CHAR_SIZE_CHENGE_STEP) > CHAR_SIZE_RENGE.lowerBound else {
            user.customSize = CHAR_SIZE_RENGE.lowerBound
            return
        }
        user.customSize = user.customSize - CHAR_SIZE_CHENGE_STEP
    }
}
