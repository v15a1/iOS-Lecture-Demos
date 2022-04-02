//
//  HistoryViewController.swift
//  UtilityConverterDemo
//
//  Created by Visal Rajapakse on 2022-03-16.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var history: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        history = UserDefaults.standard.array(forKey: "SAVED_WEIGHTS") as? [String]
        tableView.reloadData()
    }


}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "History", for: indexPath)
        let historyItem = history[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = historyItem
        cell.contentConfiguration = content
        return cell
    }
}
