//
//  SeparatorViewController.swift
//  Example
//
//  Created by Panghu Lee on 25/02/2018.
//  Copyright © 2018 Django Lee. All rights reserved.
//

import UIKit
import JoUIKit

class SeparatorViewController: UIViewController {
    
    let backgroundView = UIVisualEffectView()
    let switchItem = UISwitch()
    let segmentedControl = UISegmentedControl()
    let boxView = UIView()

    let topTextField = UITextField()
    let leadingTextField = UITextField()
    let bottomTextField = UITextField()
    let trailingTextField = UITextField()
    let thicknessTextField = UITextField()
    
    let resetItem = UIButton(type: .system)
    let outItem = UIButton(type: .system)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    @objc private func onClickReset(_ sender: UIControl) {
        
        let top: CGFloat = CGFloat(Float(topTextField.text ?? "0 ") ?? 0)
        let leading: CGFloat = CGFloat(Float(leadingTextField.text ?? "0 ") ?? 0)
        let bottom: CGFloat = CGFloat(Float(bottomTextField.text ?? "0 ") ?? 0)
        let trailing: CGFloat = CGFloat(Float(trailingTextField.text ?? "0 ") ?? 0)
        let thickness: CGFloat = CGFloat(Float(thicknessTextField.text ?? "0 ") ?? 0)
        let corner = JoViewSeparatorCorner(top: top, leading: leading, bottom: bottom, trailing: trailing, thickness: thickness)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            boxView.jo.setSeparatorToplineCorner(corner, animated: switchItem.isOn)
        } else if segmentedControl.selectedSegmentIndex == 1 {
            boxView.jo.setSeparatorLeadinglineCorner(corner, animated: switchItem.isOn)
        } else if segmentedControl.selectedSegmentIndex == 2 {
            boxView.jo.setSeparatorBottomlineCorner(corner, animated: switchItem.isOn)
        } else if segmentedControl.selectedSegmentIndex == 3 {
            boxView.jo.setSeparatorTrailinglineCorner(corner, animated: switchItem.isOn)
        }
    }
    
    @objc private func onClickOut(_ send: UIControl) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SeparatorViewController {
    
    override func jo_viewDidInstallSubviews() {
        super.jo_viewDidInstallSubviews()
        
        boxView.jo.setSeparator(.all)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        setupBackgroundView()
        setupSegmentedControl()
        setupBoxView()
        setupTextField()
        setupResetItem()
        setupSwitch()
        setupOutItem()
    }
    
    override func jo_makeSubviewsLayout() {
        super.jo_makeSubviewsLayout()
        
        backgroundView.frame = view.bounds
        
        segmentedControl.sizeToFit()
        segmentedControl.center = CGPoint(x: view.frame.midX, y: 100)
        
        boxView.bounds.size = CGSize(width: 200, height: 200)
        boxView.center = CGPoint(x: view.frame.midX, y: segmentedControl.frame.maxY + 100 + 20)
        
        topTextField.bounds.size = CGSize(width: 50, height: 35)
        leadingTextField.bounds.size = CGSize(width: 50, height: 35)
        bottomTextField.bounds.size = CGSize(width: 50, height: 35)
        trailingTextField.bounds.size = CGSize(width: 50, height: 35)
        thicknessTextField.bounds.size = CGSize(width: 50, height: 35)
        
        topTextField.center = CGPoint(x: 0, y: boxView.frame.maxY + 50)
        leadingTextField.center = CGPoint(x: 0, y: boxView.frame.maxY + 50)
        bottomTextField.center = CGPoint(x: 0, y: boxView.frame.maxY + 50)
        trailingTextField.center = CGPoint(x: 0, y: boxView.frame.maxY + 50)
        thicknessTextField.center = CGPoint(x: 0, y: boxView.frame.maxY + 50)
        
        let offsetX = (view.bounds.width - (50 * 5)) / 6
        topTextField.frame.origin.x = offsetX
        leadingTextField.frame.origin.x = offsetX + topTextField.frame.maxX
        bottomTextField.frame.origin.x = offsetX + leadingTextField.frame.maxX
        trailingTextField.frame.origin.x = offsetX + bottomTextField.frame.maxX
        thicknessTextField.frame.origin.x = offsetX + trailingTextField.frame.maxX
        
        resetItem.sizeToFit()
        resetItem.center = CGPoint(x: view.frame.midX, y: thicknessTextField.frame.maxY + 40)
        
        outItem.sizeToFit()
        outItem.center = CGPoint(x: resetItem.frame.maxX + 50, y: resetItem.center.y)
        
        switchItem.sizeToFit()
        switchItem.center = CGPoint(x: resetItem.frame.minX - 50, y: resetItem.center.y)
    }
    
    private func setupSegmentedControl() {
        segmentedControl.insertSegment(withTitle: "TopLine", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "LeadingLine", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "BottomLine", at: 2, animated: false)
        segmentedControl.insertSegment(withTitle: "TrailingLine", at: 3, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        view.addSubview(segmentedControl)
    }
    
    private func setupBoxView() {
        view.addSubview(boxView)
    }
    
    private func setupBackgroundView() {
        backgroundView.effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        view.addSubview(backgroundView)
    }
    
    private func setupTextField() {
        topTextField.placeholder = "top"
        leadingTextField.placeholder = "leading"
        bottomTextField.placeholder = "bottom"
        trailingTextField.placeholder = "trailing"
        thicknessTextField.placeholder = "thickness"
        
        topTextField.text = "0"
        leadingTextField.text = "0"
        bottomTextField.text = "0"
        trailingTextField.text = "0"
        thicknessTextField.text = "\(UIScreen.main.jo.apixel)"
        
        topTextField.keyboardType = .numberPad
        leadingTextField.keyboardType = .numberPad
        bottomTextField.keyboardType = .numberPad
        trailingTextField.keyboardType = .numberPad
        thicknessTextField.keyboardType = .numberPad
        
        topTextField.layer.borderWidth = 1
        leadingTextField.layer.borderWidth = 1
        bottomTextField.layer.borderWidth = 1
        trailingTextField.layer.borderWidth = 1
        thicknessTextField.layer.borderWidth = 1
        
        topTextField.textAlignment = .center
        leadingTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
        trailingTextField.textAlignment = .center
        thicknessTextField.textAlignment = .center
        
        view.addSubview(topTextField)
        view.addSubview(leadingTextField)
        view.addSubview(bottomTextField)
        view.addSubview(trailingTextField)
        view.addSubview(thicknessTextField)
    }
    
    private func setupResetItem() {
        resetItem.setTitle("Reset", for: .normal)
        resetItem.layer.borderWidth = 1
        resetItem.layer.borderColor = resetItem.titleLabel?.textColor.cgColor
        resetItem.layer.cornerRadius = 5
        resetItem.contentEdgeInsets = UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)
        resetItem.addTarget(self, action: #selector(onClickReset(_:)), for: .touchUpInside)
        view.addSubview(resetItem)
    }
    
    private func setupOutItem() {
        outItem.setTitle("Out", for: .normal)
        outItem.layer.cornerRadius = 3;
        outItem.layer.borderWidth = 1;
        outItem.layer.borderColor = outItem.titleLabel?.textColor.cgColor;
        outItem.contentEdgeInsets = UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)
        outItem.addTarget(self, action: #selector(onClickOut(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(outItem)
    }
    
    private func setupSwitch() {
        switchItem.isOn = false
        view.addSubview(switchItem)
    }
    
}
