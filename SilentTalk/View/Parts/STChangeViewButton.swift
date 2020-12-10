//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct STChangeViewButton<NextView: View>: View {
    var text: String
    var nextView: NextView?
    @State var show: Bool = false
    var body: some View {
        Button(action: {
            self.show = true
        }) {
            Text(text)
                .foregroundColor(.white)
                .padding(.horizontal, 10.0)
                .font(.title3)
        }
        //次の画面への遷移
        .sheet(isPresented: self.$show) { nextView }
        .buttonStyle(CustomButtonStyle())
    }
}

struct STChangeCoverViewButton<NextView: View>: View {
    var text: String
    var nextView: NextView?
    @State var show: Bool = false
    var body: some View {
        Button(action: {
            self.show = true
        }) {
            Text(text)
                .foregroundColor(.white)
                .padding(.horizontal, 10.0)
                .font(.title3)
        }
        //次の画面への遷移
        .fullScreenCover(isPresented: self.$show) { nextView }
        .buttonStyle(CustomButtonStyle())
    }
}

struct STChangeStateButton: View {
    var text: String
    var action: ()->Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .foregroundColor(.white)
                .padding(.horizontal, 10.0)
                .font(.title3)
        }
        .buttonStyle(CustomButtonStyle())
    }
}


struct STChangeViewButton_Previews: PreviewProvider {
    static var previews: some View {
            //STChangeViewButton(text: "遷移ボタン", nextView: MessageSetting().environmentObject(UserData()))
            STChangeStateButton(text: "状態変化ボタン",action:{print("test")})
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding(.all, 7.0)
            .background(Color.gray)
            .cornerRadius(10)
    }  
}
