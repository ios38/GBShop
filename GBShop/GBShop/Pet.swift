//
//  Pet.swift
//  GBShop
//
//  Created by Maksim Romanov on 19.07.2020.
//  Copyright © 2020 Maksim Romanov. All rights reserved.
//

import Foundation
import Swinject



protocol Pet {
    func info() -> String
}

class Cat: Pet {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func info() -> String {
        return "кот по имени \(name)"
    }
}

class Rabbit: Pet {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func info() -> String {
        return "кролик по имени \(name)"
    }
}

class PetOwner {
    //let pet = Cat(name: "Барсик")
    let pet: Pet
    
    init(pet: Pet) {
        self.pet = pet
    }
    
    func petInfo() -> String {
        return "Мое животное - \(pet.info())"
    }
}
