//
//  GistFileViewCell.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import UIKit

class GistFileViewCell: UITableViewCell {
    
    // MARK: Private Outlets
    @IBOutlet weak private var filenameLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var languageLabel: UILabel!
    @IBOutlet weak private var filenameInputLabel: UILabel!
    @IBOutlet weak private var typeInputLabel: UILabel!
    @IBOutlet weak private var languageInputLabel: UILabel!
    
    // MARK: Initializer
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    // MARK: Public Methods
    func configure(file: (key: String, value: GistFile)) {
        filenameInputLabel.text = file.key
        typeInputLabel.text = file.value.type
        languageInputLabel.text = file.value.language
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        filenameLabel.text = nil
        typeLabel.text = nil
        languageLabel.text = nil
        filenameInputLabel.text = nil
        typeInputLabel.text = nil
        languageInputLabel.text = nil
    }
    
    // MARK: Private Methods
    private func setupLayout() {
        filenameLabel.text = GistDetailsStrings.GistFileViewCell.filenameLabel
        typeLabel.text = GistDetailsStrings.GistFileViewCell.typeLabel
        languageLabel.text = GistDetailsStrings.GistFileViewCell.languageLabel
    }
}
