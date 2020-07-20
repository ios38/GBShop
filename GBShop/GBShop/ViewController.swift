//
//  ViewController.swift
//  GBShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import UIKit
import Swinject
import Alamofire

class ViewController: UIViewController {
    var auth: AuthRequestFactory?
    var registration: RegistrationRequestFactory?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = Container()
        
        container.register(Pet.self) { _ in Cat(name: "Барсик") }
        container.register(PetOwner.self) {r in
            PetOwner(pet: r.resolve(Pet.self)!)
        }
        let petOwner = container.resolve(PetOwner.self)!
        print(petOwner.petInfo())
        
        let requestFactory = RequestFactory()
        
        self.registration = requestFactory.makeRegistrationRequestFactory()
        guard let registration = self.registration else { return }
        
        registration.register(userName: "user", password: "password", email: "user@gmail.com") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
        
        self.auth = requestFactory.makeAuthRequestFactory()
        guard let auth = self.auth else { return }

        auth.login(userName: "user", password: "password") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        auth.logout(userId: "123") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
