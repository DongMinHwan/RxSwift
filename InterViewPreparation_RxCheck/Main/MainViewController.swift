//
//  MainViewController.swift
//  InterViewPreparation_RxCheck
//
//  Created by 황동민 on 5/6/25.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    
    var mainView = MainView()
    let disposeBag = DisposeBag()
    let viewModel = MainViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        buttonTest()
        // Do any additional setup after loading the view.
    }
    
    
    func buttonTest() {
        
        // ✅ 버튼 탭 → ViewModel 입력
        mainView.button.rx.tap
                   .bind(to: viewModel.didTapButton)
                   .disposed(by: disposeBag)
        
        viewModel.message
            .bind(to: mainView.label.rx.text)
            .disposed(by: disposeBag)

    }
    
    


}
