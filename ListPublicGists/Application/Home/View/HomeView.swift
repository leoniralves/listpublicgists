//
//  HomeView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

class HomeView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak private(set) var titleLabel: UILabel!
    @IBOutlet weak private(set) var descriptionLabel: UILabel!
    @IBOutlet weak private(set) var showPublicGistListButton: UIButton!
    
    // MARK: Public Properties
    weak var delegate: HomeViewDelegate?
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        iconImageView.image = #imageLiteral(resourceName: "github")
        titleLabel.text = HomeStrings.View.title
        descriptionLabel.text = HomeStrings.View.description
        showPublicGistListButton.setTitle(HomeStrings.View.showPublicGistsButton,
                                          for: .normal)
        showPublicGistListButton.layer.cornerRadius = 10.0
    }
    
    // MARK: Actions
    @IBAction func showPublicGistsList(_ sender: Any) {
        delegate?.homeViewDidShowPublicGistisList(self)
    }
}
