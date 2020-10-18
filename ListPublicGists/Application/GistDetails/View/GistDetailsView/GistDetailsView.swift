//
//  GistDetailsView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import UIKit

class GistDetailsView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var gistDetailsHeaderView: GistDetailsHeaderView!
    
    // MARK: Private Properties
    private var gist: Gist!
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(gist: Gist) {
        self.gist = gist
        tableView.reloadData()
        gistDetailsHeaderView.configure(gist: gist)
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GistFileViewCell.self)
        tableView.tableFooterView = UIView()
    }
}

// MARK: UITableViewDataSource
extension GistDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gist?.files.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GistFileViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(file: gist[file: indexPath.row])
        return cell
    }
}

extension GistDetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
