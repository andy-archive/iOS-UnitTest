//
//  DI-BranRestaurant.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/12/23.
//

import Foundation

/*
 Bran -> Bran's Restaurant
 Hue -> trying to eat food in Bran's
 
 📌 의존 관계 발생
 - 휴는 상위 모듈, 브랜반점은 하위 모듈 (휴님이 브랜반점에 의존함)
   - 하위 모듈 변경 시 상위 모듈에 계속 영향을 준다
 - Hue -> BranRestaurant -> Bran
 */

//MARK: - (1) Owners
class Bran {
    
    func makeSignatureHamburger() -> String {
        return "Bran's Signature Hamburger"
    }
    
    /* 🔥 frenchFries -> OnionRing
     - 의존 관계에 의하여 하위 모듈(BranRestaurant & Hue)에 모두 문제 발생
     */
    func makeFrenchFries() -> String { // makeOnionRing()
        return "Bran's FrenchFries" //"Onion Ring"
    }
    
    func makeSoftDrink() -> String {
        return "Bran's Soft Drink"
    }
}

class Koko {
    
    func makeGimbap() -> String {
        return "Koko's Gimbap"
    }
    
    func makeRamyeon() -> String {
        return "Koko's Ramyeon"
    }
    
    func makeMandu() -> String {
        return "Koko's Mandu"
    }
}

//MARK: - (2) Restaurants
class BranRestaurant {
    
    private let owner = Bran()
    
    func makeLunchMenu() -> String {
        return owner.makeSignatureHamburger() + owner.makeFrenchFries() + owner.makeSoftDrink()
    }
}

class KokoRestaurant {
    
    private let owner = Koko()
    
    func makeLunchMenu() -> String {
        return owner.makeGimbap() + owner.makeRamyeon() + owner.makeMandu()
    }
}

//MARK: - (3) Customer
/*
 - 휴는 상위 모듈, 브랜반점은 하위 모듈 (휴님이 브랜반점에 의존함)
 - 의존 관계
   - Hue -> BranRestaurant -> Bran
 */
class Hue {
    
    var hamburgerRestaurant = BranRestaurant()
    
    func getlunchMenu() -> String {
        hamburgerRestaurant.makeLunchMenu()
    }
}
