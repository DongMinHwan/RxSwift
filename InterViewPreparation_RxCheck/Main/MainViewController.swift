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
        
        // ✅ 버튼이 눌릴 때마다 ViewModel의 didTapButton에 이벤트 전달
             // PublishSubject는 구독 이후 이벤트만 받기 때문에, 이 타이밍에만 반응
        mainView.button.rx.tap
                   .bind(to: viewModel.didTapButton)
                   .disposed(by: disposeBag)
        
        // ✅ ViewModel에서 방출한 message를 라벨 텍스트에 바인딩
        // 이 흐름을 통해 ViewModel → View로 단방향 데이터 흐름이 완성됨
        
        viewModel.message
            .bind(to: mainView.label.rx.text)
            .disposed(by: disposeBag)
        
        
//
//        viewModel.simulateButton2Tap()
//        // ✅ [onNext] 버튼2 탭 이벤트 발생
//
//        viewModel.simulateButton2Error()
//        // ❌ [onError] 에러 발생: 강제 에러 발생
//
//        viewModel.simulateButton2Complete()
//        // 🏁 [onCompleted] 스트림 종료됨
        
        mainView.button2
            .rx
            .tap
            .bind { [weak self] _ in
                guard let self = self else {return}
                self.viewModel.simulateButton2Tap()
            }.disposed(by: self.disposeBag)
        mainView.button3
            .rx
            .tap
            .bind { [weak self] _ in
                guard let self = self else {return}
                self.viewModel.simulateButton2Error()
            }.disposed(by: self.disposeBag)
        mainView.button4
            .rx
            .tap
            .bind { [weak self] _ in
                guard let self = self else {return}
                self.viewModel.simulateButton2Complete()
            }.disposed(by: self.disposeBag)
        
        viewModel.message2
            .bind(to: mainView.label2.rx.text)
            .disposed(by: disposeBag)

    }
    
    


}
