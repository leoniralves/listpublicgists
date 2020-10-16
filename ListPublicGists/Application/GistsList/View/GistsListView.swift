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
    
    typealias State = RequestStates<[Gist]>
    
    // MARK: Private Outlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: Public properties
    weak var delegate: GistsListViewDelegate?
    
    // MARK: Private properties
    private var gists: [Gist] = []
    private var state: State?
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(state: State) {
        self.state = state
        DispatchQueue.main.async {
            self.tableView.loadingInFooterView(show: false)
            
            switch state {
            case .loading:
                self.tableView.loadingInFooterView(show: true)
            case .load(let gists):
                self.gists.append(contentsOf: gists)
                self.tableView.reloadData()
            case .error(_):
                break
            case .empty:
                break
            default:
                break
            }
        }
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        
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
        
        guard let state = self.state,
              case State.load(_) = state,
              (indexPaths.contains { $0.row >= self.gists.count - 1 }) else {
            return
        }
        
        delegate?.gistListViewPrefetchGists(self)
    }
}