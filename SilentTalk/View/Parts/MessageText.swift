//
//  Text+.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 2/19/21.
//

import Foundation
import SwiftUI

//上部コメント・下部コメントのメッセージパーツ
struct MessageText: View {
    var text: String
    var size: CGFloat
    var isColor: Bool
    var body: some View {
        if(isColor){
            Text(text)
                .font(.custom("Bold", size:size))
                .foregroundColor(UIColor.MESSAGE_COLOR)
                .lineLimit(nil)
        } else {
            Text(text)
                .font(.custom("Bold", size:size))
                .lineLimit(nil)
        }
    }
}

//上部コメント・下部コメントのメッセージテキストフィールドパーツ
struct MessageTextField: View {
    var defaultMessage: String
    var binding: Binding<String>
    var isColor: Bool
    var size: CGFloat
    var body: some View {
        if(isColor){
            TextEditor(text: binding)
                .font(.custom("Bold", size:size))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(minHeight:80,maxHeight:.infinity)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .foregroundColor(UIColor.MESSAGE_COLOR)
        } else {
            TextField(defaultMessage, text: binding)
                .font(.custom("Bold", size:size))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .frame(minHeight:80,maxHeight:.infinity)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}


struct MessagText_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MessageText(text: "こんにちは", size: 30, isColor: true).environmentObject(ModelData())
            MessageText(text: "こんにちは", size: 30, isColor: false).environmentObject(ModelData())
        }.previewLayout(.fixed(width: 300, height: 150))
        Group{
            MessageTextField(defaultMessage: "上部コメント", binding:.constant("耳が聞こえづらいです") , isColor: true,size: 30)
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}

