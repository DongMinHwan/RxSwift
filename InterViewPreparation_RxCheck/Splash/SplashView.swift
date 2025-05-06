//
//  SplashView.swift
//  InterViewPreparation_RxCheck
//
//  Created by 황동민 on 5/6/25.
//

import Foundation
import SnapKit
import Then
import UIKit

class SplashView : UIView {
    
    
    let splashView = UIView().then {
        $0.backgroundColor = .blue
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
        addSubview(splashView)
    }
    
    func setLayout() {
        
        splashView.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.center.equalToSuperview()
        }
    }
        
}
