//
//  GistsListViewTests.swift
//  ListPublicGistsTests
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import XCTest
import UIKit

@testable import ListPublicGists

class GistsListViewTest: XCTestCase {
    
    func testFail() {
        
        let state = RequestStates<[Gist]>.empty
        
        let sut = GistsListView(frame: .zero)
        sut.configure(state: state)
    }
}
