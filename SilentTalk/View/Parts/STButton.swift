//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct STButton: View {
    var text: String
    var action: ()->Void
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .padding(.horizontal, 10.0)
        }
        .padding(.all, 4.0)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct STButton_Previews: PreviewProvider {
    static var previews: some View {
        STButton(text: "ボタン名",action:{})
    }
}
