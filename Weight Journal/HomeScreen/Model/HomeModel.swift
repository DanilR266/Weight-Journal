//
//  HomeModel.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import Firebase


class HomeModel {
    
    private let db = Firestore.firestore()
    let documentID = UserDefaults.standard.string(forKey: "DocumentID")

    func fetchUser(completion: @escaping (UserInfo?, Error?) -> Void) {
        guard let documentID = documentID else {
            UserDefaults.standard.set(false, forKey: "SignIn")
            NotificationCenter.default.post(name: Notification.Name("AuthStatusChanged"), object: nil)
            return
        }
        
        db.collection("Users").document(documentID).getDocument { snapshot, error in
            if let error = error {
                print("Error fetching user: \(error)")
                completion(nil, error)
                return
            }
            
            if let snapshot = snapshot, snapshot.exists {
                do {
                    let user = try snapshot.data(as: UserInfo.self)
                    completion(user, nil)
                } catch let decodeError {
                    print("Error decoding user data: \(decodeError)")
                    completion(nil, decodeError)
                }
            } else {
                print("User not found.")
                completion(nil, nil)
            }
        }
    }

    
}
