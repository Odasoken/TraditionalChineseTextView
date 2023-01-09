//
//  TraditionalChineseTextView.swift
//  wordWrap
//
//  Created by juliano on 9/1/16.
//  Copyright © 2016 Juliano. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


@IBDesignable class TraditionalChineseTextView: UIView {
   @IBInspectable var font: UIFont?
    {
        didSet
        {
            label.font = font
            setNeedsLayout()
        }
    }
    @IBInspectable var textColor  = UIColor.black
        {
            didSet
            {
                label.textColor = textColor
                setNeedsLayout()
        }
    }
   @IBInspectable var text : String?
    {
        didSet
        {
            label.text = text
            label.textColor = textColor
            label.font = font
            setNeedsLayout()
        }
    }
    var contentView : UIScrollView!
    var label : TraditonChineseLable!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
           }
    
    func setupSubview()  {
        contentView = UIScrollView()
        addSubview(contentView)
        label = TraditonChineseLable()
        //        label.backgroundColor = UIColor.orangeColor()
        contentView.addSubview(label)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         setupSubview()
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        contentView.frame = bounds
//        label.frame = bounds
        if text != nil  && text?.count > 0 {
            let labelWidth = label.getTextWidthWithConstraintHeight(frame.height)
            label.frame = CGRect(x: 0, y: 0,width: labelWidth,height: frame.height)
            contentView.contentSize = CGSize(width: labelWidth, height: 0)
        }else
        {
            label.frame = CGRect.zero
        }
        
        
    }


}
