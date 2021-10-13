// \HxH School iOS Pass
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

final class HistoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var segmentedControll: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["One", "Two"]
        segmentedControll = UISegmentedControl(items: titles)
        
        segmentedControll.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 14) ?? "Arial",
             NSAttributedString.Key.foregroundColor: UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)]
            , for: .normal)
        
        segmentedControll.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 14) ?? "Arial",
             NSAttributedString.Key.foregroundColor: UIColor(red: 255, green: 255, blue: 255, alpha: 1)]
            , for: .selected)
        
        segmentedControll.backgroundColor = UIColor.blue
        segmentedControll.layer.borderColor = UIColor.blue.cgColor
        segmentedControll.selectedSegmentTintColor = UIColor.blue
        segmentedControll.layer.cornerRadius = 0
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.contentMode = .scaleAspectFill

        view.addSubview(segmentedControll)
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            segmentedControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            segmentedControll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            segmentedControll.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.imageOfProduct?.image = UIImage(named: "item.placeholder")
        tableView.tableFooterView = UIView()
        return cell
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
            
            let alertView = UIAlertController(title: "Title", message: "Delete", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                tableView.deleteRows(at: [indexPath], with: .fade)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert) in
                print("Cancel")
            })
            alertView.addAction(okAction)
            alertView.addAction(cancelAction)
            self.present(alertView, animated: true, completion: nil)
        }
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

