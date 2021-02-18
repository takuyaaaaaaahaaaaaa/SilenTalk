//
//  AnswerCardList.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCardList: View {
    @EnvironmentObject var modelData: ModelData
    var messageSize:CGFloat {
        return CGFloat(modelData.user.customSize + 2)
    }
    
    var body: some View {
        VStack(){
            MessageText(text: modelData.user.headMessage, size: messageSize, isColor: modelData.user.coloredMessage)
                .padding()
            
            LazyVStack(content: {
                ForEach(modelData.answerCard.indices) { idx in
                    AnswerCardRow(index: idx)
                }
            })
            MessageText(text: modelData.user.bottomMessage, size: messageSize, isColor: modelData.user.coloredMessage)
                .padding()
            HStack{
                Spacer()
                Stepper( "", value: $modelData.user.customSize, in: CHAR_SIZE_RENGE)
                    .padding(.bottom, 0.0)
                    .fixedSize()
                Spacer()
                STChangeViewButton(text:"設定",nextView: MessageSetting())
                Spacer()
                STChangeCoverViewButton(text:"メモ",nextView: Memo())
                Spacer()
            }.padding(.trailing)
        }
        .padding(.vertical)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnswerCardList().environmentObject(ModelData())
        }.previewDevice(PreviewDevice(rawValue: "iPhone 7"))
    }
}
