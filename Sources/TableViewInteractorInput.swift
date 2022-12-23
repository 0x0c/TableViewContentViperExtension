//
//  TableViewInteractorInput.swift
//
//
//  Created by Akira Matsuda on 2022/12/23.
//

import TableViewContent
import UIKit

@resultBuilder
public enum TableViewSectionBuilder {
    public static func buildBlock() -> [Section] {
        []
    }

    public static func buildBlock<C: Collection>(_ contents: C...) -> [Section] where C.Element == Section {
        return contents.flatMap { $0 }
    }

    public static func buildBlock(_ contents: Section...) -> [Section] {
        return contents
    }

    public static func buildOptional(_ component: [Section]?) -> [Section] {
        return component ?? []
    }

    public static func buildEither(first component: [Section]) -> [Section] {
        return component
    }

    public static func buildEither(second component: [Section]) -> [Section] {
        return component
    }

    public static func buildExpression(_ element: Section?) -> [Section] {
        return element.map { [$0] } ?? []
    }

    public static func buildExpression(_ element: Section) -> [Section] {
        return [element]
    }

    public static func buildExpression<C: Collection>(_ elements: C) -> [Section] where C.Element == Section {
        Array(elements)
    }

    public static func buildExpression<C: Collection>(_ elements: C) -> [Section] where C.Element == Section? {
        elements.compactMap { $0 }
    }

    public static func buildArray(_ components: [[Section]]) -> [Section] {
        components.flatMap { $0 }
    }
}

public protocol TableViewInteractorInput: AnyObject {
    var sections: [Section] { get set }

    func store(_ sections: [Section])
    func store(@TableViewSectionBuilder _ sections: () -> [Section])
    func section(for sectionIndex: Int) -> Section
}

public extension TableViewInteractorInput {
    func store(_ sections: [Section]) {
        self.sections = sections
    }

    func store(@TableViewSectionBuilder _ sections: () -> [Section]) {
        self.sections = sections()
    }

    func section(for sectionIndex: Int) -> Section {
        return sections[sectionIndex]
    }
}
