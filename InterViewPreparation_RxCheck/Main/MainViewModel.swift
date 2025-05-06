//
//  MainViewModel.swift
//  InterViewPreparation_RxCheck
//
//  Created by 황동민 on 5/6/25.
//

import Foundation
import RxSwift

class MainViewModel {
    // ✅ 입력: View → ViewModel로 전달되는 이벤트
    let didTapButton = PublishSubject<Void>()
    
    // ✅ 출력: ViewModel → View로 전달될 데이터
    let message = PublishSubject<String>()
    
    private let disposeBag = DisposeBag()

    init() {
        bindInput()
    }

    private func bindInput() {
        didTapButton
            .subscribe(onNext: { [weak self] in
                self?.message.onNext("버튼이 눌렸습니다!")
            })
            .disposed(by: disposeBag)
    }
}
