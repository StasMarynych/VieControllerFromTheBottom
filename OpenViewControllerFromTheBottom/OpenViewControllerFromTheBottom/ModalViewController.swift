//
//  ModalViewController.swift
//  OpenViewControllerFromTheBottom
//
//  Created by Stanislav Marynych on 5/30/19.
//  Copyright © 2019 Stanislav Marynych. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, HalfModalPresentable {
    
    let array = [1, 2, 3]
    
    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdentifier = "cell"

    @IBAction func maximizeButtonTapped(sender: AnyObject) {
        maximizeToFullScreen()
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        if let delegate = navigationController?.transitioningDelegate as? HalfModalTransitioningDelegate {
            delegate.interactiveDismiss = false
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 18
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "rect")?.scaleImageToFitSize(size: CGSize(width: 35, height: 12)))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    
}


extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = String(self.array[indexPath.row])
        return cell
    }
    
    
}
