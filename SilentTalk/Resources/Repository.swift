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
        
        // ユーザデフォルトに登録済みの場合
        if let data = UserDefaults.standard.data(forKey: "userData") {
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
            }
        }
        
        // ユーザデフォルトに未登録の場合はjsonファイルの設定値から読み込む
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        let data: Data
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
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
