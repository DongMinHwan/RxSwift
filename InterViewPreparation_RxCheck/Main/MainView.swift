//
//  MainView.swift
//  InterViewPreparation_RxCheck
//
//  Created by 황동민 on 5/6/25.
//

import Foundation
import UIKit
import SnapKit
import Then

class MainView : UIView {
    
    var test = UIView().then {
        $0.backgroundColor = .black
    }
    
    var button = UIButton().then {
        
        $0.backgroundColor = .white
        $0.setTitle("PublishSubject", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    var button2 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("PublishSubject_onNext", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    var button3 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("PublishSubject_onError", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    var button4 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("PublishSubject_onComplete", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    
//    func simulateButton2Tap() {
//        didTapButton2.onNext(())
//    }
//
//    func simulateButton2Error() {
//        didTapButton2.onError(NSError(domain: "TestError", code: 999, userInfo: [NSLocalizedDescriptionKey: "강제 에러 발생"]))
//    }
//
//    func simulateButton2Complete() {
//        didTapButton2.onCompleted()
//    }
    
    var label = UILabel().then {
        $0.backgroundColor = .white
    }
    
    var label2 = UILabel().then {
        $0.backgroundColor = .white
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setup()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setup() {
        addSubview(test)
        test.addSubview(button)
        test.addSubview(button2)
        test.addSubview(button3)
        test.addSubview(button4)
        test.addSubview(label)
        test.addSubview(label2)
    }
    
    func setLayout() {
        
        test.snp.makeConstraints { make in
            make.width.height.equalTo(400)
            make.center.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
        
        button2.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
        
        button3.snp.makeConstraints { make in
            make.top.equalTo(button2.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
        
        button4.snp.makeConstraints { make in
            make.top.equalTo(button3.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(button4.snp.bottom).offset(10)
            make.width.equalTo(button)
            make.centerX.equalTo(button)
        }
        
        label2.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.width.equalTo(label)
            make.centerX.equalTo(label)
        }
        
    }
}
