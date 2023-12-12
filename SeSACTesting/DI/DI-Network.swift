//
//  DI-Network.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/12/23.
//

import Foundation

//MARK: - Protocol
protocol NetworkProvider {
    func fetchLotto()
}

//MARK: - Class
final class NetworkManager: NetworkProvider {
    
    func fetchLotto() { // 실제 네트워크 진행 구현체
        // AlamoFire, JSONDecoder, Moya, ....
    }
}

//MARK: - Test
/*
 네트워크 테스트 시 Mock Data를 통해 네트워크 통신 없이 테스트를 진행하는 거싱 적합
 */
