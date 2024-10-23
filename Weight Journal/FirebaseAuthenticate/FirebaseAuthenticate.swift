//
//  FirebaseAuthenticate.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import FirebaseAuth
import Firebase

class FirebaseAuthenticate {
    
    static let shared = FirebaseAuthenticate()
    
    private var auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var registrationCompletion: ((String?, String?, String?) -> Void)?
    
    func registration(email: String, password: String, name: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                self.db.collection("Users").addDocument(data: [
                    "Name": name,
                    "Email": email,
                    "uid": result.user.uid,
                    "CaloriesGoal": 2000,
                    "Age": 0,
                    "Height": 0,
                    "WeightNow": "50",
                    "WeightGoal": "50",
                    "Sex": "M",
                    "CaloriesNow": 0,
                    "Max": "50",
                    "Min": "50",
                    "SavedFood": [],
                    "FoodDate": [:],
                    "WeightDate": [:],
                    "CaloriesDate": [:]
                ])
                print("registration2")
                self.registrationCompletion?(email, password, name)
            }
            if let error = error {
                print("Error registartion:", error.localizedDescription)
                self.registrationCompletion?(nil, nil, nil)
            }
        }
    }
    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                self.db.collection("Users").whereField("Email", isEqualTo: email).getDocuments { result, error in
                    guard let result = result else { return }
                    UserDefaults.standard.set(result.documents[0].documentID, forKey: "DocumentID")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        UserDefaults.standard.set(true, forKey: "SignIn")
                        NotificationCenter.default.post(name: Notification.Name("AuthStatusChanged"), object: nil)
                    }
                }
            }
            if let error = error {
                print("Error auth:", error.localizedDescription)
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        do {
            UserDefaults.standard.set(false, forKey: "SignIn")
            NotificationCenter.default.post(name: Notification.Name("AuthStatusChanged"), object: nil)
        }
        catch {
            print("Error logout:", error.localizedDescription)
        }
    }
    
}
