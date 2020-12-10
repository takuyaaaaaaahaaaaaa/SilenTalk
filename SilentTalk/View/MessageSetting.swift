//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct MessageSetting: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 26.0) {
                Text("上部コメント")
                    .font(.largeTitle).foregroundColor(.gray)
                TextField("上部メッセージ", text: $modelData.user.headMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title)
                Text("下部コメント")
                    .font(.largeTitle).foregroundColor(.gray)
                TextField("下部メッセージ", text: $modelData.user.bottomMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title)
                Spacer()
                HStack{
                    STChangeStateButton(text:"戻る",action:{
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    Spacer()
                    STChangeViewButton(text:"次へ",nextView: AnswerCardSetting(cardNumber: 0))
                }
            }
            Spacer()
        }.padding()
        .onDisappear(){
            //画面遷移時に保存
            modelData.save()
        }
    }
}

struct MessageSetting_Previews: PreviewProvider {
    static var previews: some View {
        MessageSetting().environmentObject(ModelData())
    }
}

