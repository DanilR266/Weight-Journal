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
    
    var delegate: LoaderProtocol?
    
    private var auth = Auth.auth()
    private let db = Firestore.firestore()
    
    var registrationCompletion: ((String?, String?, String?) -> Void)?

    func registration(email: String, password: String, name: String, age: Int, calories: Int, height: Double, weightNow: Double, weightGoal: Double, sex: String) {
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
                caloriesGoal: calories,
                age: age,
                height: height,
                weightNow: weightNow,
                weightGoal: weightGoal,
                sex: sex,
                caloriesNow: 0,
                max: weightNow,
                min: weightNow,
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
                        UserDefaults.standard.set(name, forKey: "UserName")
                        self.registrationCompletion?(email, password, name)
                        self.logIn(email: email, password: password)
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
            guard let self = self else {
                self?.delegate?.stopLoad()
                return
            }
            if let result = result {
                self.db.collection("Users").whereField("email", isEqualTo: email).getDocuments { result, error in
                    guard let result = result else {
                        self.delegate?.stopLoad()
                        return
                    }
                    print(result.documents, "ResDoc")
                    if !result.documents.isEmpty { UserDefaults.standard.set(result.documents[0].documentID, forKey: "DocumentID") }
                    else {
                        self.delegate?.stopLoad()
                        return
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.delegate?.stopLoad()
                        UserDefaults.standard.set(true, forKey: "SignIn")
                        NotificationCenter.default.post(name: Notification.Name("AuthStatusChanged"), object: nil)
                    }
                }
            }
            if let error = error {
                self.delegate?.stopLoad()
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
