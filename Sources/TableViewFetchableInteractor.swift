//
//  TableViewFetchableInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2022/12/23.
//

import TableViewContent
import Foundation

public protocol TableViewFetchableInteractorInput: AnyObject {
    func reload() -> [Section]
    func fetch(force: Bool) -> [Section]
}

public extension TableViewFetchableInteractorInput {
    func reload() -> [Section] {
        return fetch(force: true)
    }

    func fetch(force: Bool = false) -> [Section] {
        return fetch(force: force)
    }
}

public protocol TableViewFetchableInteractorOutput: AnyObject {
    @MainActor
    func willFetchStart()
    @MainActor
    func willFetchEnd()
    @MainActor
    func didFetchEnd()
}
