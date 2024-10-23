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
    
    func fetchUser(completion: @escaping (User?, Error?) -> Void) {
        guard let documentID = documentID else {
            UserDefaults.standard.set(false, forKey: "SignIn")
            NotificationCenter.default.post(name: Notification.Name("AuthStatusChanged"), object: nil)
            return
        }
        db.collection("Users").document(documentID).getDocument { document, error in
            guard let data = document?.data(), error == nil else {
                completion(nil, error)
                return
            }
            
            guard let name = data["Name"] as? String else {
                completion(nil, nil)
                return
            }
            
            let user = User(id: documentID, name: name)
            completion(user, nil)
        }
    }
    
}
