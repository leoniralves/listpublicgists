//
//  TestHelper.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

@testable import ListPublicGists

func tap(_ btn: UIButton) {
    btn.sendActions(for: .touchUpInside)
}

func initGistMock() -> Gist {
    return Gist(owner: GistOwner(login: "Dummy",
                                 avatarUrl: "http://"),
                files: [
                    "File" : GistFile(filename: "filename",
                                      type: "type",
                                      language: "language",
                                      rawUrl: "http://dummy.com")
                ],
                createdAt: "10/10/2020".toDate(formatt: "dd/MM/yyyy")!,
                updatedAt: "10/10/2020".toDate(formatt: "dd/MM/yyyy")!,
                description: "Dummy description")
}
