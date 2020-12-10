//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct AnswerCardRow: View {
    @EnvironmentObject var modelData: ModelData
    var index: Int
    private var answerCard:AnswerCard {
        return modelData.answerCard[index]
    }
    
    var body: some View {
        VStack(alignment:.leading){
            HStack(alignment: .top){
                Toggle("",isOn: $modelData.user.answerCard[index].isShow)
                    .fixedSize()
                Spacer()
                VStack(spacing:10){
                    Text(answerCard.title)
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity,maxHeight: 37)
                        .border(Color.gray)
                    HStack{
                        Text(answerCard.answers[answerCard.selectedAnswer])
                            .font(.title)
                        Spacer()
                        STChangeStateButton(text:"切替",action: {
                            modelData.user.answerCard[index].selectedAnswer = emptyCheck(answerCard.selectedAnswer + 1)
                            modelData.save()
                        })
                    }
                }.isHidden(!answerCard.isShow)
            }
        }
        .padding(.trailing)
    }
}

extension AnswerCardRow {
    private func emptyCheck(_ index: Int) -> Int{
        // 選択可能な範囲を超えた場合
        if (index > answerCard.answers.count - 1 ){
            return 0
        }
        // 空文字の場合、次の文字まで再帰的に探す
        if (answerCard.answers[index] == ""){
            return emptyCheck(index + 1 )
        }
        return index
    }
}



struct AnswerCardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AnswerCardRow(index: 0).environmentObject(ModelData())
            AnswerCardRow(index: 1).environmentObject(ModelData())
        }.previewLayout(.fixed(width: 300, height: 120))
        
    }
}
