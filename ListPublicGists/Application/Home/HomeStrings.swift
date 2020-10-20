//
//  HomeStrings.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import Foundation

struct HomeStrings {
    
    // MARK: HomeViewController
    struct Controller {
        static var title: String = "Home"
    }
    
    // MARK: HomeView
    struct View {
        static var title: String = "GitHub Gists"
        static var description: String = """
        Aqui você vai econtrar uma lista com os Gists públicos mais recentes.
        Eles estarão dispostos do mais recente para o mais antigo.
        """
        static var showPublicGistsButton: String = "Gists Públicos"
    }
}
