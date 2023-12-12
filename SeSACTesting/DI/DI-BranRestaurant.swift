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
 
 - 🔗 의존 관계
   - 휴는 상위 모듈, 브랜반점은 하위 모듈 (휴님이 브랜반점에 의존함)
     - 🔥 하위 모듈 변경 시 상위 모듈에 계속 영향을 준다
   - Hue -> BranRestaurant -> Bran
     - 🔥 브랜반점의 코드 변화가 휴님에게 곧바로 영향을 미친다
     - 🔥 하위 모듈의 코드 변화가 상위 모듈에 영향을 미친다
 - ❓ 이를 어떻게 해결해야 할까?
 
 */

//MARK: - ⭐️ (0) Protocol
protocol Restaurant {
    func makeLunchMenu() -> String
}

protocol OwnerRecipe {
    func makeMainMenu() -> String
    func makeSideMenu() -> String
    func makeDrink() -> String
}

//MARK: - (1) Owners
class Bran: OwnerRecipe {
    
    func makeMainMenu() -> String {
        return "Bran's Signature Hamburger"
    }
    
    /* 🔥 frenchFries -> OnionRing
     - 의존 관계에 의하여 하위 모듈(BranRestaurant & Hue)에 모두 문제 발생
     */
    func makeSideMenu() -> String { // makeOnionRing()
        return "Bran's FrenchFries" //"Onion Ring"
    }
    
    func makeDrink() -> String {
        return "Bran's Soft Drink"
    }
}

class Koko: OwnerRecipe {
    
    func makeMainMenu() -> String {
        return "Koko's Gimbap"
    }
    
    func makeSideMenu() -> String {
        return "Koko's Ramyeon"
    }
    
    func makeDrink() -> String {
        return "Koko's EomukSoup"
    }
}

//MARK: - (2) Restaurants
class BranRestaurant: Restaurant {
    
    private let owner = Bran()
    
    func makeLunchMenu() -> String {
        return owner.makeMainMenu() + owner.makeSideMenu() + owner.makeDrink()
    }
}

class KokoRestaurant: Restaurant {
    
    private let owner = Koko()
    
    func makeLunchMenu() -> String {
        return owner.makeMainMenu() + owner.makeSideMenu() + owner.makeDrink()
    }
}

//MARK: - (3) Customer
/*
 - 휴는 상위 모듈, 브랜반점은 하위 모듈 (휴님이 브랜반점에 의존함)
 - 의존 관계
   - Hue -> BranRestaurant -> Bran
 
 - ❓ 상위 모듈이 하위 모듈의 변화를 모르고 코드만 가져올 수는 없을까?
 */
class Hue {
    
    var hamburgerRestaurant = BranRestaurant()
    var bunsikRestaurant = KokoRestaurant()
    
    func selectHamburgerMenu() -> String {
        hamburgerRestaurant.makeLunchMenu()
    }
    
    func selectBunsikMenu() -> String {
        bunsikRestaurant.makeLunchMenu()
    }
}
