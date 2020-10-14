//
//  GistsListView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import UIKit

class GistsListView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: Private properties
    private var gists: [Gist] = []
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public Methods
    func configure(gists: [Gist]) {
        self.gists = gists
        tableView.reloadData()
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
}

extension GistsListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        gists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gists[section].files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let file = gists[indexPath.section][file: indexPath.row]
        cell.textLabel?.text = file.key
        return cell
    }
}

extension GistsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIStackView()
        let label = UILabel()
        label.text = gists[section].owner.login
        view.addArrangedSubview(label)
        return view
    }
}
