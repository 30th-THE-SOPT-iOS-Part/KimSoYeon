//
//  ViewController.swift
//  7th-Seminar
//
//  Created by 소연 on 2022/05/28.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = [] {
        didSet {
            print("new value update")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setData()
    }

    private func setTableView() {
        tableView.dataSource = self
    }
    
    private func setData() {
        guard let data = MockParser.load([Todo].self, from: "Todo") else { return }
        print(data)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todos[indexPath.row].title
        return cell
    }
}
