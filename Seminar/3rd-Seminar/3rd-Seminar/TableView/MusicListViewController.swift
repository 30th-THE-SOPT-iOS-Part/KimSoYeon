//
//  MusicListViewController.swift
//  3rd-Seminar
//
//  Created by 소연 on 2022/04/23.
//

import UIKit

final class MusicListViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    // MARK: - Custom Method
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: MusicTableViewCell.CellIdentifier, bundle: nil), forCellReuseIdentifier: MusicTableViewCell.CellIdentifier)
    }
}

extension MusicListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension MusicListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.CellIdentifier, for: indexPath) as? MusicTableViewCell else { return UITableViewCell() }
        cell.initCell(MusicDataModel.sampleData[indexPath.row])
        return cell
    }
}
