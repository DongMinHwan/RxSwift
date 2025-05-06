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
        $0.backgroundColor = .green
    }
    
    var button = UIButton().then {
        
        $0.backgroundColor = .yellow
        $0.setTitle("버튼버튼", for: .normal)
    }
    
    var label = UILabel().then {
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
        test.addSubview(label)
    }
    
    func setLayout() {
        
        test.snp.makeConstraints { make in
            make.width.height.equalTo(400)
            make.center.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.center.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.centerX.equalTo(button)
        }
        
    }
}
