//
//  DI-Network.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/12/23.
//

import Foundation

import Alamofire

//MARK: - Protocol
protocol NetworkProvider {
    func fetchLotto(number: Int, completion: @escaping (LottoDTO) -> Void)
}

//MARK: - Class
final class NetworkManager: NetworkProvider {
    
    static let shared = NetworkManager()
    
    private init () { }
    
    func fetchLotto(number: Int, completion: @escaping (LottoDTO) -> Void) { // 실제 네트워크 진행하는 구현체
        // AlamoFire, JSONDecoder, Moya, ....
        
        let urlString = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(urlString).responseDecodable(of: LottoDTO.self) { response in
            switch response.result {
            case .success(let suceess):
                print(suceess)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    // 인터넷 연결이 되어야 테스트를 진행할 수 있다
}

//MARK: - Test
/*
 네트워크 테스트 시 Mock Data를 통해 네트워크 통신 없이 테스트를 진행하는 것이 적합
 */
