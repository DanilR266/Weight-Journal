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
    
    func setValuesForToday(weightDate: [String: String], completion: @escaping (Error?) -> Void) {
        guard let documentID = documentID else {
            print("Document ID is missing")
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Document ID is missing"]))
            return
        }
        
        db.collection("Users").document(documentID).updateData(["weightDate": weightDate]) { error in
            if let error = error {
                print("Error updating weightNow: \(error)")
                completion(error)
            } else {
                print("weightNow updated successfully")
                completion(nil)
            }
        }
    }

    
    func setUserInfo(_ userInfo: UserInfo, completion: @escaping (Error?) -> Void) {
        guard let documentID = documentID else {
            print("Document ID is missing")
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Document ID is missing"]))
            return
        }
        do {
            try db.collection("Users").document(documentID).setData(from: userInfo) { error in
                if let error = error {
                    print("Error setting user info: \(error)")
                    completion(error)
                } else {
                    print("User info updated successfully")
                    completion(nil)
                }
            }
        } catch let encodeError {
            print("Error encoding user info: \(encodeError)")
            completion(encodeError)
        }
    }


    
}
