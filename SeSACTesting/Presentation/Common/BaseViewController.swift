//
//  BaseViewController.swift
//  SeSACTesting
//
//  Created by Taekwon Lee on 12/15/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
        bind()
    }
    
    func configureUI() {
        view.backgroundColor = Constant.Color.background
    }
    func configureLayout() { }
    func bind() { }
}
