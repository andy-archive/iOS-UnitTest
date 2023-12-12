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

class Bran {
    
    func makeSignatureHamburger() -> String {
        return "Signature Hamburger"
    }
    
    /* 🔥 frenchFries -> OnionRing
     의존 관계에 의하여 BranRestaurant & Hue에 모든 문제가 생김
     */
    func makeFrenchFries() -> String { // makeOnionRing()
        return "FrenchFries" //"Onion Ring"
    }
    
    func makeSoftDrink() -> String {
        return "Soft Drink"
    }
}

class BranRestaurant {
    
    private let owner = Bran()
    
    func makeLunchMenu() -> String {
        return owner.makeSignatureHamburger() + owner.makeFrenchFries() + owner.makeSoftDrink()
    }
}

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
