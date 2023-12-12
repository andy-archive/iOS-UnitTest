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
 - ✅ 프로토콜에 의해 해결
 -> 각각의 레스토랑이 레스토랑 프로토콜을 준수하도록
 -> 각각의 주방장이 주방장 프로토콜을 준수하도록
 -> 구현체가 아닌 추상화에 의존하도록 변경하기
 */

//MARK: - ⭐️ (0) Protocol
protocol HamburgerRestaurant {
    func makeLunchMenu() -> String
}

protocol BunsikRestaurant {
    func makeLunchMenu() -> String
}

protocol Owner {
    func makeMainMenu() -> String
    func makeSideMenu() -> String
    func makeDrink() -> String
}

protocol Customer {
    func selectHamburger() -> String
    func selectBunsik() -> String
}

//MARK: - (1) Owners
final class Bran: Owner {
    
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

final class Koko: Owner {
    
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
final class BranRestaurant: HamburgerRestaurant {
    
    private let owner: Owner
    
    init(
        owner: Owner
    ) {
        self.owner = owner
    }
    
    func makeLunchMenu() -> String {
        return owner.makeMainMenu() + owner.makeSideMenu() + owner.makeDrink()
    }
}

final class KokoRestaurant: BunsikRestaurant {
    
    private let owner: Owner
    
    init(
        owner: Owner
    ) {
        self.owner = owner
    }
    
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
final class Hue: Customer {
    
    private var hamburgerRestaurant: HamburgerRestaurant
    private var bunsikRestaurant: BunsikRestaurant
    
    init(
        hamburgerRestaurant: HamburgerRestaurant,
        bunsikRestaurant: BunsikRestaurant
    ) {
        self.hamburgerRestaurant = hamburgerRestaurant
        self.bunsikRestaurant = bunsikRestaurant
    }
    
    func selectHamburger() -> String {
        hamburgerRestaurant.makeLunchMenu()
    }
    
    func selectBunsik() -> String {
        bunsikRestaurant.makeLunchMenu()
    }
}

let hue = Hue(
    hamburgerRestaurant: BranRestaurant(owner: Bran()),
    bunsikRestaurant: KokoRestaurant(owner: Koko())
)
