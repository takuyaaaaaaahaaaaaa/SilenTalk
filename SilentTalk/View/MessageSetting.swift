////
////  ContentView.swift
////  SilentTalk
////
////  Created by takuya_tominaga on 12/8/20.
////
//
//import SwiftUI
//
//struct MessageSetting: View {
//    @State var answerCard: AnswerCard
//
//    var body: some View {
//        VStack(alignment:.leading){
//            HStack(alignment: .top){
//                Toggle("",isOn: $answerCard.isShow)
//                    .fixedSize()
//                Spacer()
//                VStack(spacing:10){
//                    if answerCard.isShow {
//                        Text(answerCard.title)
//                            .font(.title)
//                            .frame(maxWidth:.infinity,maxHeight: 30)
//                            .border(Color.gray)
//                    } else {
//                        Text(answerCard.title)
//                            .foregroundColor(Color(white: 0.7, opacity: 0.5))
//                            .font(.title)
//                            .frame(maxWidth:.infinity,maxHeight: 30)
//                            .border(Color(white: 0.7, opacity: 0.5))
//                    }
//                    if answerCard.isShow {
//                        HStack{
//                            Text(answerCard.answers[answerCard.selectedAnswer])
//                                .font(.title)
//                            Spacer()
//                            STButton(text:"切替",action: {
//                                if ((answerCard.answers.count-1) > answerCard.selectedAnswer ){
//                                    answerCard.selectedAnswer += 1
//                                } else {
//                                    answerCard.selectedAnswer = 0
//                                }
//
//                            })
//                        }
//                    }
//                }
//            }
//        }
//        .padding(.trailing)
//    }
//}
//
//struct MessageSetting_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageSetting(answerCard: answerCardData)
//    }
//}
//
