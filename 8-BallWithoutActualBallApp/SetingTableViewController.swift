//
//  SetingTableViewController.swift
//  8-BallWithoutActualBallApp
//
//  Created by Ihor Dovhyi on 25.01.2022.
//

import UIKit

class SetingTableViewController: UITableViewController {
    var arrayStandartReply = ["All is well",
                              "Most likely",
                              "My reply is no",
                              "Better not tell you now",
                              "It is certain",
                              "Ask again later"
    ]

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayStandartReply.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setingReply", for: indexPath)
        cell.textLabel?.text = arrayStandartReply[indexPath.row]
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let result = segue.destination as! GameViewController
            result.standartReply = arrayStandartReply[indexPath.row]
        }
    }

}
