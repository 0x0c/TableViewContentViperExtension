//
//  TableViewFetchableInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2022/12/23.
//

import TableViewContent
import Foundation

public protocol TableViewFetchableInteractorInput: AnyObject {
    func reload() -> [any Sectionable]
    func fetch(force: Bool) -> [any Sectionable]
}

public extension TableViewFetchableInteractorInput {
    func reload() -> [any Sectionable] {
        return fetch(force: true)
    }

    func fetch(force: Bool = false) -> [any Sectionable] {
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
