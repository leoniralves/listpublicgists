//
//  GistsListView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import UIKit

class GistsListView: UIView {
    
    typealias State = RequestStates<[Gist]>
    
    // MARK: Private Outlets
    @IBOutlet private(set) var tableView: UITableView!
    
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
        self.tableView.loadingInFooterView(show: false)
        
        switch state {
        case .loading:
            if self.gists.count > 0 {
                self.tableView.loadingInFooterView(show: true)
            } else {
                self.tableView.loading(show: true)
            }
        case .load(let gists):
            self.gists.append(contentsOf: gists)
            self.tableView.reloadData()
            self.tableView.loading(show: false)
        case .error(let error):
            self.tableView.showError(title: "Error Title",
                                     description: String(describing: error),
                                     image: UIImage(),
                                     action: { [weak self] in
                                        guard let self = self else { return }
                                        self.delegate?.gistListRetry(self)
                                     })
        default:
            break
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

// MARK: UITableViewDataSource
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

// MARK: UITableViewDelegate
extension GistsListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.gistListView(self, didSelectGist: gists[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

// MARK: UITableViewDataSourcePrefetching
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
