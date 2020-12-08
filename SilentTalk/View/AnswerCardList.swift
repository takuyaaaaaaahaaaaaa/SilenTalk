//
//  AnswerCardList.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCardList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{
            Text(self.userData.headMessage).font(.custom("上部コメント", size:26))
            Spacer()
            LazyVStack(content: {
                ForEach(userData.answerCard, id: \.id) { answerCard in
                    AnswerCardRow(answerCard: answerCard)
                }
            })
            Spacer()
            Text(self.userData.bottomMessage).font(.custom("下部コメント", size:26))
            HStack{
                Spacer()
                STButton(text:"設定",action: {})
                STButton(text:"メモ",action: {})
            }.padding(.trailing)
        }
        .padding(.vertical)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnswerCardList()
        }
    }
}
