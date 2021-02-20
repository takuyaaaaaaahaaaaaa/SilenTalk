//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

/*
 標準ボタン・テキスト
 */
// 標準テキスト
struct STText: View {
    var text: String
    var body: some View{
        Text(text)
            .foregroundColor(.white)
            .padding(.horizontal, 10.0)
            .font(.title3)
    }
}

// サイレントーク標準ボタン
struct STButton: View {
    var text: String
    var action: ()->Void
    var body: some View {
        Button(action: {
            action()
        }) {
            STText(text: text)
        }
        .buttonStyle(CustomButtonStyle())
    }
}

// サイレントーク標準ボタンスタイル
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding(.all, 7.0)
            .background(Color.gray)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .cornerRadius(10)
    }
}

/*
 画面遷移ボタン
 */
// 画面遷移ボタン（シートで移動）
struct STChangeViewButton<NextView: View>: View {
    var text: String
    var nextView: NextView?
    @State var show: Bool = false
    var body: some View {
        Button(action: {
            self.show = true
        }) {
            STText(text: text)
        }
        //次の画面への遷移
        .sheet(isPresented: self.$show) { nextView }
        .buttonStyle(CustomButtonStyle())
    }
}
// 画面遷移ボタン（フルスクリーンで移動）
struct STChangeCoverViewButton<NextView: View>: View {
    var text: String
    var nextView: NextView?
    @State var show: Bool = false
    var body: some View {
        Button(action: {
            self.show = true
        }) {
            STText(text: text)
        }
        //次の画面への遷移
        .fullScreenCover(isPresented: self.$show) { nextView }
        .buttonStyle(CustomButtonStyle())
    }
}

/*
 文字変更ボタン
 */
// 文字変更ボタンテキスト
struct STCharSizeText: View {
    var text: String
    var body: some View{
        Text(text)
            .foregroundColor(.black)
            .padding(.horizontal, 10.0)
            .font(.title3)
    }
}
// 文字変更ボタンスタイル
struct STCharSizeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .frame(width:38,height:26)
            .padding(.all, 5)
            .background(configuration.isPressed ? Color.gray.opacity(0.5):Color.gray.opacity(0.01))
            .cornerRadius(10)
    }
}
// 文字変更ボタンスタイル
struct STCharSizeButtonBackGroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .frame(width:86,height:26)
            .padding(.all, 5)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}
// 文字変更ボタン
struct STCharSizeButton: View {
    var sizeUpAction: ()->Void
    var sizeDownAction: ()->Void
    
    var body: some View {
        Button(""){}
            .buttonStyle(STCharSizeButtonBackGroundStyle())
            .disabled(true)
            .overlay(
                HStack(spacing: 0.0){
                    //小文字化
                    Button(action: { sizeDownAction() }) {
                        Text("A")
                            .padding(.horizontal, 10.0)
                    }.buttonStyle(STCharSizeButtonStyle())
                    
                    Divider()
                    
                    //大文字化
                    Button(action: { sizeUpAction()}) {
                        Text("A")
                            .padding(.horizontal, 10.0)
                            .font(.title)
                    }
                    .buttonStyle(STCharSizeButtonStyle())
                }
                .foregroundColor(.black)
            )
    }
}

struct STChangeViewButton_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            STButton(text: "標準",action:{print("test")})
            STChangeViewButton<AnswerCardList>(text: "画面遷移(ポップ)")
            STChangeCoverViewButton<Memo>(text: "画面遷移(カバー)")
            STCharSizeButton(sizeUpAction: {}, sizeDownAction: {})
        }
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
