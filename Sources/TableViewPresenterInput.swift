//
//  TableViewPresenterInput.swift
//
//
//  Created by Akira Matsuda on 2022/12/23.
//

import TableViewContent
import UIKit

public protocol TableViewPresenterInput: AnyObject {
    var sections: [Section] { get }

    func section(for sectionIndex: Int) -> Section
    @MainActor
    func didSelectRow(at indexPath: IndexPath)
}
