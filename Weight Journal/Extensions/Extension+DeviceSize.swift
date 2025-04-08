//
//  Extension+DeviceSize.swift
//  Weight Journal
//
//  Created by Данила on 22.10.2024.
//

import Foundation
import UIKit


public class Size {
    
    static let shared = Size()
    
    public func scaleWidth(_ value : CGFloat) -> CGFloat{
        let x = UIScreen.main.bounds.width/375
        return value * x
    }

    public func scaleHeight(_ value : CGFloat) -> CGFloat{
        let y = UIScreen.main.bounds.height/812
        return value * y
    }
    
    public func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    public func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
