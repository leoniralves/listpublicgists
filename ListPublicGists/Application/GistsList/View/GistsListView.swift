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
        tableView.register(OwnerViewCell.self)
        tableView.tableFooterView = UIView()
    }
}

extension GistsListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        gists.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OwnerViewCell = tableView.dequeueReusableCell()
        let owner = gists[indexPath.row].owner
        cell.configure(owner)
        return cell
    }
}
