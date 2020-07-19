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
        //let auth = requestFactory.makeAuthRequestFactory()
        self.auth = requestFactory.makeAuthRequestFactory()
        
        guard let auth = auth else { return }
        auth.login(userName: "user", password: "password") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
