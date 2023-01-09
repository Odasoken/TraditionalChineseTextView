//
//  TraditonChineseLable.swift
//  wordWrap
//
//  Created by juliano on 9/1/16.
//  Copyright © 2016 Juliano. All rights reserved.
//

import UIKit

class TraditonChineseLable: UILabel {
    var maxWidth : CGFloat
    {
        get{
            let maxX: CGFloat = 0
             if let text = self.text {
                
            }
           return max(10, 20)
        }
    }
    override func drawText(in rect: CGRect) {
       
        let attributeDict:[NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor : textColor,
            NSAttributedString.Key.font : font
        ];
        if let text = self.text {
            
//            let width = rect.width
            let height = rect.height;
            let textHeight:CGFloat = self.font.pointSize + 2
            var numberPerVolumn = Int(height / textHeight)
            if numberPerVolumn == 0 {
                numberPerVolumn = 1
            }
            for i in 0 ..< text.count
            {
                let xIndex = i / numberPerVolumn;
                let yIndex = i % numberPerVolumn;
//                let range = Range( Range<String.Index>(text.characters.index(text.startIndex, offsetBy: i) ..< text.characters.index(text.startIndex, offsetBy: i + 1))
                let startIndex = text.index(text.startIndex, offsetBy: i)
                let endIndex = text.index(text.startIndex, offsetBy: i+1)
                
                let subRang = text[startIndex..<endIndex];
//                    text.substring(with: range)
                let subStr = String(subRang)
                let textRect = CGRect( x: CGFloat(xIndex) *  textHeight, y: CGFloat(yIndex) *  textHeight, width: textHeight, height: textHeight)
                let aText =  NSString.init(string: subStr)
                aText.draw(in: textRect, withAttributes: attributeDict)
//                substr.draw(in: textRect, withAttributes: attributeDict)
//                maxWidth = textRect.maxX
            }
        }
    }
    func getTextWidthWithConstraintHeight(_ constraintHeight : CGFloat) -> CGFloat
    {
        let height = constraintHeight;
        let textHeight:CGFloat = font.pointSize + 2
        var numberPerVolumn = Int(height / textHeight)
        if numberPerVolumn == 0 {
            numberPerVolumn = 1
        }
       if let text = self.text
       {
          let length = text.count
          let xIndex = (length - 1) / numberPerVolumn;
          let yIndex = (length - 1) % numberPerVolumn;
          let textRect = CGRect( x: CGFloat(xIndex) *  textHeight, y: CGFloat(yIndex) *  textHeight, width: textHeight, height: textHeight)
           return textRect.maxX
        }
        
        return 0.0
    }

}
