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
                .font(.custom("", size:size))
                .foregroundColor(UIColor.MESSAGE_COLOR)
        } else {
            Text(text)
                .font(.custom("", size:size))
        }
    }
}

//上部コメント・下部コメントのメッセージテキストフィールドパーツ
struct MessageTextField: View {
    var defaultMessage: String
    var binding: Binding<String>
    var isColor: Bool
    var body: some View {
        if(isColor){
            TextField(defaultMessage, text: binding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title)
                .foregroundColor(UIColor.MESSAGE_COLOR)
        } else {
            TextField(defaultMessage, text: binding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title)
        }
    }
}


struct MessagText_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MessageText(text: "こんにちは", size: 30, isColor: true).environmentObject(ModelData())
            MessageText(text: "こんにちは", size: 30, isColor: false).environmentObject(ModelData())
//            MessageTextField(defaultMessage: "上部コメント", binding:.constant("string") , isColor: true)
        }.previewLayout(.fixed(width: 300, height: 150))
        
    }
}
