//
//  TableViewInput.swift
//
//
//  Created by Akira Matsuda on 2022/12/23.
//

import TableViewContent
import UIKit

public protocol TableViewInput: AnyObject {
    @MainActor
    func update(sections: [Section])
}
