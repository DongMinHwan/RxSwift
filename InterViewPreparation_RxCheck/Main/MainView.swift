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
    }
    
    func setLayout() {
        
        test.snp.makeConstraints { make in
            make.width.height.equalTo(400)
            make.center.equalToSuperview()
        }
        
    }
}
