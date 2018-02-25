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

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "JoUIKit"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        (UIApplication.shared.delegate as! AppDelegate).textView.isHidden = true
    }
}

//MARK: UITableViewProcotol

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.jo.dequeueReusableCell(UITableViewCell.self)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            cell.textLabel?.text = "Supporting"
        } else if indexPath.item == 1 {
            cell.textLabel?.text = "Separator"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        if indexPath.item == 0 {
            present(SupportingExampleController(), animated: true, completion: nil)
        } else if indexPath.item == 1 {
            present(SeparatorViewController(), animated: true, completion: nil)
        }
    }
}

//MARK: Setup UI

extension ViewController {
    
    override func jo_setupSubviews() {
        super.jo_setupSubviews()
        
        setTableView()
    }
    
    override func jo_makeSubviewsLayout() {
        super.jo_makeSubviewsLayout()
        
        tableView.frame = view.bounds
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.jo.register(cell: UITableViewCell.self)
        view.addSubview(tableView)
    }
}
