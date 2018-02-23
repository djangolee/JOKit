//
//  ViewController.swift
//  Example
//
//  Created by Django Lee on 05/10/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

import UIKit
import JoUIKit

class ViewController: UIViewController {

    static var number = 0
    
    var number: Int = 0
    
    let inItem = UIButton(type: .system)
    let outItem = UIButton(type: .system)
    
    //MARK: Self.view Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print()
        title = "JoUIKit"
       
        let v = JoView()
        v.number = "\(number) v1"
        v.frame.size = CGSize(width: 100, height: 200)
        v.center = view.center
        v.layer.borderWidth = 1
        view.addSubview(v)
        
        let v2 = JoView()
        v2.number = "\(number) v2"
        v2.frame.size = CGSize(width: 100, height: 200)
        v2.center = view.center
        v2.layer.borderWidth = 1
        view.addSubview(v2)
        
        let v3 = JoSubView()
        v3.number = "\(number) v3"
        v3.frame.size = CGSize(width: 100, height: 200)
        v3.center = view.center
        v3.layer.borderWidth = 1
        view.addSubview(v3)
        
        let a = JoLayer()
        a.number = "\(number) a1"
        a.frame.size = CGSize(width: 50, height: 50)
        a.position = view.center
        a.borderWidth = 1
        v.layer.addSublayer(a)
        
        let a2 = JoLayer()
        a2.number = "\(number) a2"
        a2.frame.size = CGSize(width: 50, height: 50)
        a2.position = view.center
        a2.borderWidth = 1
        v.layer.addSublayer(a2)
        
        let a3 = JoSubLayer()
        a3.number = "\(number) a3"
        a3.frame.size = CGSize(width: 50, height: 50)
        a3.position = view.center
        a3.borderWidth = 1
        v.layer.addSublayer(a3)

    }
    
    override func jo_viewWillInstallSubviews() {
        super.jo_viewWillInstallSubviews()
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_viewDidInstallSubviews() {
        super.jo_viewDidInstallSubviews()
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        
        setupInItem()
        setupOutItem()
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_makeSubviewsLayout() {
        super.jo_makeSubviewsLayout()
        
        inItem.sizeToFit()
        inItem.center = CGPoint(x: 50, y: 120)
        
        outItem.sizeToFit()
        outItem.center = CGPoint(x: 150, y: 120)
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    deinit {
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    @objc private func onClickIn(_ send: UIControl) {
        ViewController.number += 1
        let vc = ViewController()
        vc.number = ViewController.number
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func onClickOut(_ send: UIControl) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupInItem() {
        inItem.layer.cornerRadius = 3;
        inItem.layer.borderWidth = 1;
        inItem.layer.borderColor = inItem.titleLabel?.textColor.cgColor;
        inItem.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15);
        inItem.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        inItem.setTitle("In", for: .normal)
        inItem.addTarget(self, action: #selector(onClickIn(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(inItem)
    }
    
    private func setupOutItem() {
        outItem.layer.cornerRadius = 3;
        outItem.layer.borderWidth = 1;
        outItem.layer.borderColor = outItem.titleLabel?.textColor.cgColor;
        outItem.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15);
        outItem.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        outItem.setTitle("Out", for: .normal)
        outItem.addTarget(self, action: #selector(onClickOut(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(outItem)
    }
}

class JoView: UIView {
    
    var number: String = ""
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        
        let subView = JoDemoSubView()
        subView.number = number + " 1"
        subView.frame.size = CGSize(width: 100, height: 200)
        subView.center = center
        subView.layer.borderWidth = 1
        addSubview(subView)

        let subView2 = JoDemoSubView()
        subView2.number = number + " 2"
        subView2.frame.size = CGSize(width: 100, height: 200)
        subView2.center = center
        subView2.layer.borderWidth = 1
        addSubview(subView2)
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_viewWillAppear() {
        super.jo_viewWillAppear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_viewDidAppear() {
        super.jo_viewDidAppear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_viewWillDisappear() {
        super.jo_viewWillDisappear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    override func jo_viewDidDisappear() {
        super.jo_viewDidDisappear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewWillInstallSubviews() {
        super.jo_viewWillInstallSubviews()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewDidInstallSubviews() {
        super.jo_viewDidInstallSubviews()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_makeSubviewsLayout() {
        super.jo_makeSubviewsLayout()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }

    deinit {
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
}

class JoSubView: JoView {
    
}

class JoDemoSubView: UIView {
    var number: String = ""
    
    override func jo_viewDidLoad() {
        super.jo_viewDidLoad()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewWillAppear() {
        super.jo_viewWillAppear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewDidAppear() {
        super.jo_viewDidAppear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewWillDisappear() {
        super.jo_viewWillDisappear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewDidDisappear() {
        super.jo_viewDidDisappear()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewWillInstallSubviews() {
        super.jo_viewWillInstallSubviews()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_viewDidInstallSubviews() {
        super.jo_viewDidInstallSubviews()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_makeSubviewsLayout() {
        super.jo_makeSubviewsLayout()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    deinit {
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
}

class JoLayer: CALayer {
    
    var number: String = ""

    override func jo_layerDidLoad() {
        super.jo_layerDidLoad()
        
        let subLayer = JoDemoSubLayer()
        subLayer.number = number + " 1"
        subLayer.frame.size = CGSize(width: 50, height: 50)
        subLayer.position = position
        subLayer.borderWidth = 1
        addSublayer(subLayer)
        
        let subLayer2 = JoDemoSubLayer()
        subLayer2.number = number + " 2"
        subLayer2.frame.size = CGSize(width: 50, height: 50)
        subLayer2.position = position
        subLayer2.borderWidth = 1
        addSublayer(subLayer2)
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_layerWillInstallSublayers() {
        super.jo_layerWillInstallSublayers()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_layerDidInstallSublayers() {
        super.jo_layerDidInstallSublayers()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_setupSublayers() {
        super.jo_setupSublayers()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_makeSublayersLayout() {
        super.jo_makeSublayersLayout()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    deinit {
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
}


class JoSubLayer: JoLayer {
    
}

class JoDemoSubLayer: CALayer {
    var number: String = ""
    
    override func jo_layerDidLoad() {
        super.jo_layerDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_layerWillInstallSublayers() {
        super.jo_layerWillInstallSublayers()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_layerDidInstallSublayers() {
        super.jo_layerDidInstallSublayers()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_setupSublayers() {
        super.jo_setupSublayers()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    override func jo_makeSublayersLayout() {
        super.jo_makeSublayersLayout()
        
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
    
    deinit {
        (UIApplication.shared.delegate as! AppDelegate).addText(obj: self, text: "\(number): " + #function)
    }
}

