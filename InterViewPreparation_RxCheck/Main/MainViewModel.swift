//
//  MainViewModel.swift
//  InterViewPreparation_RxCheck
//
//  Created by 황동민 on 5/6/25.
//

import Foundation
import RxSwift



class MainViewModel {
    
    //MARK: - PublishSubject
    /// 초기값 없고
    /// 구독한 시점 이후에 발생하는 이벤트만 전달받는 Subject입니다.
    /// ✅ View(Input)에서 들어오는 이벤트를 받기 위한 PublishSubject
    /// onNext, onCompleted, onError를 통해 수동으로 이벤트를 발생시킬 수 있습니다.
    ///보통 버튼 탭, 사용자 액션 등 일회성 이벤트 처리에 적합합니다.
    ///
    ///
    ///PublishSubject는 초기값 없이, 구독 이후의 이벤트만 전달받는 Subject입니다. 버튼 탭이나 셀 선택처럼 일회성 이벤트를 처리할 때 주로 사용하며, .onNext()를 수동 호출해 ViewModel 내 이벤트 흐름을 설계할 수 있습니다
    
    // 버튼이 눌렸을 때 해당 이벤트를 여기로 전달받음
    let didTapButton = PublishSubject<Void>()
    let didTapButton2 = PublishSubject<Void>()

    // ✅ View(Output)로 내보낼 텍스트 메시지
    // 버튼이 눌리면 해당 메시지를 ViewController로 전달
    let message = PublishSubject<String>()
    let message2 = PublishSubject<String>()

    private let disposeBag = DisposeBag()

    init() {
        bind()
    }

    private func bind() {
        // ✅ 버튼 탭 이벤트를 구독하여, 메시지를 발행
        didTapButton
            .subscribe(onNext: { [weak self] in
                // ✅ View로 보낼 메시지를 .onNext로 직접 발행
                self?.message.onNext("버튼이 눌렸습니다!")
            })
            .disposed(by: disposeBag)
        
        // MARK: - didTapButton2: 전체 이벤트 흐름 테스트용
        didTapButton2
            .subscribe(
                onNext: { [weak self] in
                    print("✅ [onNext] 버튼2 탭 이벤트 발생")
                    self?.message2.onNext("버튼2 탭됨")
                },
                onError: { error in
                    print("❌ [onError] 에러 발생: \(error.localizedDescription)")
                },
                onCompleted: {
                    print("🏁 [onCompleted] 스트림 종료됨")
                }
            )
            .disposed(by: disposeBag)

        
    }
    
    /// 버튼2가 탭되었을 때의 onNext 이벤트를 수동으로 발생시킵니다.
    /// 실제 버튼이 눌렸다고 가정하고 이벤트 스트림에 값을 흘려보냅니다.
    func simulateButton2Tap() {
        didTapButton2.onNext(())
    }

    /// 버튼2 관련 스트림에 강제로 에러를 발생시킵니다.
    /// 에러가 발생하면 이후 onNext는 전달되지 않고, 스트림이 종료됩니다.
    func simulateButton2Error() {
        didTapButton2.onError(NSError(
            domain: "TestError",
            code: 999,
            userInfo: [NSLocalizedDescriptionKey: "강제 에러 발생"]
        ))
    }

    /// 버튼2 관련 스트림을 수동으로 종료합니다.
    /// 이후 onNext는 무시되며, 리소스 정리에 사용됩니다.
    func simulateButton2Complete() {
        didTapButton2.onCompleted()
    }

}

