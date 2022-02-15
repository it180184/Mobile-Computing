//
//  DrawView.swift
//  gestures
//
//  Created by Ettinger Fabian on 15.02.22.
//

import UIKit

class DrawView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        UIColor.init(white: 0.6, alpha: 0.4).setStroke()
        UIColor.clear.setFill()
        
        // Outline
        let outline = UIBezierPath();
        
        outline.move(to: CGPoint(x: 250, y: 130))
        outline.addLine(to: CGPoint(x: 280, y: 200))
        outline.addArc(withCenter: CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2), radius: UIScreen.main.bounds.width/3, startAngle: 0.2, endAngle: 2.9415, clockwise: true)
        outline.addLine(to: CGPoint(x: 110, y: 200))
        outline.addLine(to: CGPoint(x: 140, y: 130))
        outline.addLine(to: CGPoint(x: 180, y: 190))
        outline.addLine(to: CGPoint(x: 210, y: 190))
        
        outline.lineWidth = 10;
        outline.close()
        outline.stroke()
        
        // eyes
        let eye1 = UIBezierPath();
        eye1.move(to: CGPoint(x: 160, y: 280))
        eye1.addArc(withCenter: CGPoint(x: 150, y: 280), radius: 10, startAngle: 0, endAngle: 6.182, clockwise: true)
        
        eye1.lineWidth = 5;
        eye1.close()
        eye1.stroke()
        
        
        let eye2 = UIBezierPath();
        eye2.move(to: CGPoint(x: 240, y: 280))
        eye2.addArc(withCenter: CGPoint(x: 230, y: 280), radius: 10, startAngle: 0, endAngle: 6.182, clockwise: true)
        
        eye2.lineWidth = 5;
        eye2.close()
        eye2.stroke()
        
        // whiskers
        let center = CGPoint(x: 190, y: 360)
        let whiskers = UIBezierPath();
        whiskers.move(to: center)
        whiskers.addLine(to: center.applying(CGAffineTransform(translationX: -100, y: 0)))
        whiskers.addLine(to: center)
        whiskers.addLine(to: center.applying(CGAffineTransform(translationX: -90, y: 20)))
        whiskers.addLine(to: center)
        whiskers.addLine(to: center.applying(CGAffineTransform(translationX: -90, y: -20)))
        whiskers.addLine(to: center)
        whiskers.addLine(to: center.applying(CGAffineTransform(translationX: 100, y: 0)))
        whiskers.addLine(to: center)
        whiskers.addLine(to: center.applying(CGAffineTransform(translationX: 90, y: 20)))
        whiskers.addLine(to: center)
        whiskers.addLine(to: center.applying(CGAffineTransform(translationX: 90, y: -20)))
        
        whiskers.lineWidth = 5
        whiskers.stroke()
    }

}
