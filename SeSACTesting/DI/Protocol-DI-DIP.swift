//
//  Protocol-DI-DIP.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/12/23.
//

import Foundation

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
final class Noah: Owner {
    
    func makeMainMenu() -> String {
        return "Noah's Signature Hamburger"
    }
    
    /* 🔥 frenchFries -> OnionRing
     - 의존 관계에 의하여 하위 모듈(NoahRestaurant & Hue)에 모두 문제 발생
     */
    func makeSideMenu() -> String { // makeOnionRing()
        return "Noah's FrenchFries" //"Onion Ring"
    }
    
    func makeDrink() -> String {
        return "Noah's Soft Drink"
    }
}

final class Callie: Owner {
    
    func makeMainMenu() -> String {
        return "Callie's Gimbap"
    }
    
    func makeSideMenu() -> String {
        return "Callie's Ramyeon"
    }
    
    func makeDrink() -> String {
        return "Callie's EomukSoup"
    }
}

//MARK: - (2) Restaurants
final class NoahRestaurant: HamburgerRestaurant {
    
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

final class CallieRestaurant: BunsikRestaurant {
    
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
final class Andy: Customer {
    
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

//MARK: - (4) 의존성 주입 (Dependency Injection)
let noah = Noah()
let noahRestaurant = NoahRestaurant(owner: noah)

let callie = Callie()
let callieRestaurant = CallieRestaurant(owner: callie)

let andy = Andy(
    hamburgerRestaurant: noahRestaurant,
    bunsikRestaurant: callieRestaurant
)

//MARK: - (A) 의존 관계 문제 발생과 해결책
/*
 Noah -> Noah's Restaurant
 Hue -> trying to eat food in Noah's
 
 - 🔗 (1) 문제 발생 of 의존성
   - 휴는 상위 모듈, 브랜반점은 하위 모듈 (휴님이 브랜반점에 의존함)
     - 🔥 하위 모듈 변경 시 상위 모듈에 계속 영향을 준다
   - Hue --> NoahRestaurant --> Noah
     - 🔥 브랜반점의 코드 변화가 휴님에게 곧바로 영향을 미친다
     - 🔥 하위 모듈의 코드 변화가 상위 모듈에 영향을 미친다
 - ❓ 이를 어떻게 해결해야 할까?
 - 🔗 (2) 문제 해결 by 프로토콜
   --> 각각의 레스토랑이 레스토랑 프로토콜을 준수하도록
   --> 각각의 주방장이 주방장 프로토콜을 준수하도록
   --> 구현체가 아닌 추상화에 의존하도록 변경하기
 */

//MARK: - (B) 상위 모듈 & 하위 모듈
/*
 - 휴는 상위 모듈, 브랜반점은 하위 모듈 (휴님이 브랜반점에 의존함)
 - 의존 관계
   - Hue -> NoahRestaurant -> Noah
 
 - ❓ 상위 모듈이 하위 모듈의 변화를 모르고 코드만 가져올 수는 없을까?
*/

//MARK: - (C) 의존성 분리
/*
 - ✅ 브랜 & 코코의 생성 시점과 사용을 분리한다
 - ⭐️ 객체의 생성과 사용의 관심을 분리한다 -> 생성자를 통해서 의존성을 주입한다
   --> 구현체가 아닌 인터페이스(추상화)에 의존한다
 */

//MARK: - (D) 의존성 주입 (Dependency Injection)
/*
    let Noah = Noah()
    let NoahRestaurant = NoahRestaurant(owner: Noah)

    let Callie = Callie()
    let CallieRestaurant = CallieRestaurant(owner: Callie)

    let hue = Hue(
        hamburgerRestaurant: NoahRestaurant,
        bunsikRestaurant: CallieRestaurant
    )
 */

//MARK: - (E) DIP vs DI == 원칙 vs 수단
/*
 1. DI (Depenency Injection; 의존성 주입)
 2. DIP (Dependency Inversion Principle; 의존성 역전 원칙)
 -> DIP의 구현 기법으로 DI를 사용할 수 있다
 */
