//
//  AnswerCardList.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCardList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(){
            Text(modelData.user.headMessage)
                .font(.custom("上部コメント", size:30))
                
            LazyVStack(content: {
                ForEach(modelData.answerCard.indices) { idx in
                    AnswerCardRow(index: idx)
                }
            })
            Text(modelData.user.bottomMessage).font(.custom("下部コメント", size:30))
            HStack{
                Spacer()
                STChangeViewButton(text:"設定",nextView: MessageSetting())
                    .offset(x: 40)
                Spacer()
                STChangeCoverViewButton(text:"メモ",nextView: Memo())
            }.padding(.trailing)
        }
        .padding(.vertical)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnswerCardList().environmentObject(ModelData())
        }.previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
