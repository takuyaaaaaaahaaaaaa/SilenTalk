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
        VStack(spacing:0){
            Spacer()
            MessageText(text: modelData.user.headMessage, size: messageSize, isColor: modelData.user.coloredMessage)
            Spacer()
            LazyVStack(content: {
                ForEach(modelData.answerCard.indices) { idx in
                    AnswerCardRow(index: idx)
                }
            })
            Spacer()
            MessageText(text: modelData.user.bottomMessage, size: messageSize, isColor: modelData.user.coloredMessage)
            Spacer()
            HStack(spacing:30){
                STCharSizeButton(sizeUpAction: sizeUp, sizeDownAction:sizeDown)
                STChangeViewButton(text:"設定",nextView: MessageSetting())
                STChangeCoverViewButton(text:"メモ",nextView: Memo())
            }
        }
        .padding(.vertical, 20.0)
    }
    
    // 文字の大きさ大
    func sizeUp(){
        modelData.sizeUpChar()
    }
    // 文字の大きさ小
    func sizeDown(){
        modelData.sizeDownChar()
    }
    
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnswerCardList().environmentObject(ModelData())
        }.previewDevice(PreviewDevice(rawValue: "iPhone 7"))
    }
}
