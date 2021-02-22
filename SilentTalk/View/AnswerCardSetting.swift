//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCardSetting: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @State var cardNumber: Int
    var mainTitle:String = "タイトル"
    var subTitle:String = "選択肢"
    
    var nextNumber: Int {
        get {
            return (self.cardNumber + 1) % ANSWER_CARD_LIMIT
        }
    }
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 14.0) {
                Text("\(mainTitle) \(cardNumber + 1)").font(.largeTitle).foregroundColor(.gray)
                TextField("タイトル", text: $modelData.user.answerCard[cardNumber].title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title)
                Text(subTitle)
                    .font(.largeTitle).foregroundColor(.gray)
                ForEach(0..<ANSWER_LIMIT){ index in
                    TextField("回答", text: $modelData.user.answerCard[cardNumber].answers[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title)
                }
                Spacer()
                HStack{
                    STButton(text:"戻る",action:{
                        self.presentationMode.wrappedValue.dismiss()
                        
                    })
                   Spacer()
                    STButton(text:"次へ",action:{
                        cardNumber = nextNumber
                    })
                }
            }
        }.padding()
        .onDisappear(){
            //画面遷移時に保存
            modelData.save()
        }
    }
}

struct AnswerCardSetting_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCardSetting(cardNumber: 1).environmentObject(ModelData())
    }
}


