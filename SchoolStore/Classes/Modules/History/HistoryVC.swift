// \HxH School iOS Pass
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

final class HistoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
