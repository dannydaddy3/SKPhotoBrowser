//
//  SKButtons.swift
//  SKPhotoBrowser
//
//  Created by 鈴木 啓司 on 2016/08/09.
//  Copyright © 2016年 suzuki_keishi. All rights reserved.
//

import Foundation

// helpers which often used
private let bundle = Bundle(for: SKPhotoBrowser.self)

class SKButton: UIButton {
    var showFrame: CGRect!
    var hideFrame: CGRect!
    var insets: UIEdgeInsets {


        return UI_USER_INTERFACE_IDIOM() == .phone
            ?  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) : UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    var size: CGSize = CGSize(width: 55, height: 55)
    var margin: CGFloat = 5
    
    var buttonTopOffset: CGFloat { return 5 }
    
    func setup(_ imageName: String) {
        backgroundColor = UIColor.clear
        imageEdgeInsets = insets
//        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = true
        autoresizingMask = [.flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin]
        
        let image = UIImage(named: "SKPhotoBrowser.bundle/images/\(imageName)",
                            in: bundle, compatibleWith: nil) ?? UIImage()
        setImage(image, for: UIControlState())
    }
  
    func updateFrame() { }
  
    func setFrameSize(_ size: CGSize) {
        let newRect = CGRect(x: margin, y: buttonTopOffset, width: size.width, height: size.height)
        self.frame = newRect
        showFrame = newRect
        hideFrame = CGRect(x: margin, y: -20, width: size.width, height: size.height)
    }
}

class SKCloseButton: SKButton {
    let imageName = "btn_common_close_wh"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(imageName)
        showFrame = CGRect(x: SKMesurement.screenWidth / 2 - 25, y: SKMesurement.screenHeight - 66.0, width: 55.0, height: 55.0)
        hideFrame = CGRect(x: SKMesurement.screenWidth / 2 - 25, y: SKMesurement.screenHeight + 66.0, width: 55, height: 55)
    }
    
    override func updateFrame() {
    }
}

class SKDeleteButton: SKButton {
    let imageName = "btn_common_delete_wh"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(imageName)
        showFrame = CGRect(x: SKMesurement.screenWidth - size.width, y: buttonTopOffset, width: size.width, height: size.height)
        hideFrame = CGRect(x: SKMesurement.screenWidth - size.width, y: -20, width: size.width, height: size.height)
    }
    
    override func updateFrame() {
    }
  
    override func setFrameSize(_ size: CGSize) {
        let newRect = CGRect(x: SKMesurement.screenWidth - size.width, y: buttonTopOffset, width: size.width, height: size.height)
        self.frame = newRect
        showFrame = newRect
        hideFrame = CGRect(x: SKMesurement.screenWidth - size.width, y: -20, width: size.width, height: size.height)
    }
}
