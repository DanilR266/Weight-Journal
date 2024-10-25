//
//  FirebaseAuthenticate.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class FirebaseAuthenticate {
    
    static let shared = FirebaseAuthenticate()
    
    private var auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var registrationCompletion: ((String?, String?, String?) -> Void)?

    func registration(email: String, password: String, name: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error registration:", error.localizedDescription)
                self.registrationCompletion?(nil, nil, nil)
                return
            }
            
            guard let result = result else { return }

            let newUser = UserInfo(
                name: name,
                email: email,
                uid: result.user.uid,
                caloriesGoal: 2000,
                age: 0,
                height: 0,
                weightNow: 50,
                weightGoal: 50,
                sex: "M",
                caloriesNow: 0,
                max: 50,
                min: 50,
                savedFood: [],
                foodDate: [:],
                weightDate: [:],
                caloriesDate: [:]
            )
            
            do {
                let data = try Firestore.Encoder().encode(newUser)
                self.db.collection("Users").document(result.user.uid).setData(data) { error in
                    if let error = error {
                        print("Error adding user data to Firestore:", error.localizedDescription)
                        self.registrationCompletion?(nil, nil, nil)
                    } else {
                        print("User added successfully!")
                        self.registrationCompletion?(email, password, name)
                    }
                }
            } catch let encodingError {
                print("Error encoding user:", encodingError.localizedDescription)
                self.registrationCompletion?(nil, nil, nil)
            }
        }
    }

    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                self.db.collection("Users").whereField("email", isEqualTo: email).getDocuments { result, error in
                    guard let result = result else { return }
                    print(result.documents, "ResDoc")
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
