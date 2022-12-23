//
//  TableViewFetchablePresenter.swift
//
//
//  Created by Akira Matsuda on 2022/12/23.
//

import Combine
import Foundation

public protocol TableViewFetchablePresenter {
    var isLoadingPublisher: Published<Bool>.Publisher { get }

    func reload()
    func fetch(force: Bool)
}

public extension TableViewFetchablePresenter {
    func reload() {
        fetch(force: true)
    }

    func fetch(force: Bool = false) {
        fetch(force: force)
    }
}
