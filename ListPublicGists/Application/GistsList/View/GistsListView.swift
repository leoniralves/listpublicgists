//
//  GistsListView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import UIKit

protocol GistsListViewDelegate: AnyObject {
    func gistListViewPrefetchGists(_ gistListView: GistsListView)
}

class GistsListView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: Public properties
    weak var delegate: GistsListViewDelegate?
    
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
        self.gists.append(contentsOf: gists)
        tableView.reloadData()
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        
        tableView.register(OwnerViewCell.self)
        tableView.tableFooterView = UIView()
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 61

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
        let cell: OwnerViewCell = tableView.dequeueReusableCell(for: indexPath)
        let owner = gists[indexPath.row].owner
        cell.configure(owner)
        return cell
    }
}

extension GistsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension GistsListView: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard (indexPaths.contains { $0.row >= self.gists.count - 1 }) else {
            return
        }
        
        delegate?.gistListViewPrefetchGists(self)
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt: \(indexPaths)")
        // cancelar request items
    }
}
