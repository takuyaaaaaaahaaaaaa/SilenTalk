//
//  ContentView.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import SwiftUI

struct Memo: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 26.0) {
            
            TextEditor(text:$modelData.user.memo )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.gray)
                .frame(maxHeight:.infinity)
                .font(.title)
            HStack{
                STChangeStateButton(text:"戻る",action:{
                    self.presentationMode.wrappedValue.dismiss()
                })
                Spacer()
                STChangeStateButton(text:"保存",action:{
                    modelData.save()
                    UIApplication.shared.endEditing()
                })
            }
        }
        .padding()
        .onDisappear(){
            //画面遷移時に保存
            modelData.save()
        }
    }
}

struct Memo_Previews: PreviewProvider {
    static var previews: some View {
        Memo().environmentObject(ModelData())
    }
}

// キーボードを下げる拡張機能
extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

