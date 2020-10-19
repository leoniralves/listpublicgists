//
//  ErrorViewStrings.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 18/10/20.
//

import Foundation

struct ErrorViewStrings {
    
    struct Network {
        static var title: String = "Hum... algo errado não está certo!"
        static var description: String = "Verifique sua conexão. Pode ser que alguma coisa esteja atrapalhando nosso trabalho."
    }
    
    struct Service {
        static var title: String = "Desculpe o transtorno"
        static var description: String = "Estamos tendo problemas para comunicar com o GitHub."
    }
    
    struct Generic {
        static var title: String = "Poxa... Deu ruim!"
        static var description: String = "Mas não se preocupe, estamos trabalhando para resolver.\nEm breve tudo estará normal novamente"
    }
}
