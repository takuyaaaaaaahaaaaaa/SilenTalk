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
                HStack{
                    Text("上部コメント")
                        .font(.largeTitle).foregroundColor(.gray)
                    Toggle(isOn: $modelData.user.coloredMessage) {
                    }.toggleStyle(SwitchToggleStyle(tint: UIColor.MESSAGE_COLOR)).fixedSize()
                }
                MessageTextField(defaultMessage: "上部メッセージ", binding: $modelData.user.headMessage, isColor: modelData.user.coloredMessage)
                Text("下部コメント")
                    .font(.largeTitle).foregroundColor(.gray)
                MessageTextField(defaultMessage: "下部メッセージ", binding: $modelData.user.bottomMessage, isColor:  modelData.user.coloredMessage)
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

