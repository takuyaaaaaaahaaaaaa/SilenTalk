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
