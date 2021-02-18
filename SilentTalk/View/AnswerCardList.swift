//
//  AnswerCardList.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCardList: View {
    @EnvironmentObject var modelData: ModelData
    var commentSize:CGFloat {
        return CGFloat(modelData.user.customSize + 2)
    }
    
    var body: some View {
        VStack(){
            Text(modelData.user.headMessage)
                .font(.custom("", size:commentSize))
                .padding()
            
            LazyVStack(content: {
                ForEach(modelData.answerCard.indices) { idx in
                    AnswerCardRow(index: idx)
                }
            })
            Text(modelData.user.bottomMessage).font(.custom("", size:commentSize))
                .padding()
            HStack{
                Spacer()
                Stepper( "", value: $modelData.user.customSize, in: modelData.charRange)
                    .padding(.bottom, 0.0)
                    .frame(width: 100, height: 50)
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
