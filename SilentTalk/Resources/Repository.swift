//
//  Data.swift
//  SilentTalk
//
//  Created by takuya_tominaga on 12/8/20.
//

import Foundation
import UIKit
import SwiftUI

struct UserRepository {
    private let USER_KEY = "userData"
    
    func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
        
        // UserDefaultsからユーザ設定情報を読み込む
        if let data = UserDefaults.standard.data(forKey: "userData") {
                return try! JSONDecoder().decode(T.self, from: data)
        }
        
        // jsonファイルからデフォルトで設定されたユーザ設定情報を読み込む
        let file = Bundle.main.url(forResource: filename, withExtension: nil)!
        let data = try! Data(contentsOf: file)
        return try! JSONDecoder().decode(T.self, from: data)
    }
    
    func save<T: Encodable>(_ userData:T)-> Void {
        let data: Data
        do{
            data = try JSONEncoder().encode(userData)
        } catch {
            fatalError("Couldn't encode \(userData)")
        }
        //    print(String(data: data, encoding: .utf8)!)
        UserDefaults.standard.set(data, forKey: "userData")
    }
}
