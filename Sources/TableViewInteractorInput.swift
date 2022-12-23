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
    public static func buildBlock() -> [any Sectionable] {
        []
    }

    public static func buildBlock<C: Collection>(_ contents: C...) -> [any Sectionable] where C.Element == Section {
        return contents.flatMap { $0 }
    }

    public static func buildBlock(_ contents: Section...) -> [any Sectionable] {
        return contents
    }

    public static func buildOptional(_ component: [any Sectionable]?) -> [any Sectionable] {
        return component ?? []
    }

    public static func buildEither(first component: [any Sectionable]) -> [any Sectionable] {
        return component
    }

    public static func buildEither(second component: [any Sectionable]) -> [any Sectionable] {
        return component
    }

    public static func buildExpression(_ element: Section?) -> [any Sectionable] {
        return element.map { [$0] } ?? []
    }

    public static func buildExpression(_ element: Section) -> [any Sectionable] {
        return [element]
    }

    public static func buildExpression<C: Collection>(_ elements: C) -> [any Sectionable] where C.Element == Section {
        Array(elements)
    }

    public static func buildExpression<C: Collection>(_ elements: C) -> [any Sectionable] where C.Element == Section? {
        elements.compactMap { $0 }
    }

    public static func buildArray(_ components: [[any Sectionable]]) -> [any Sectionable] {
        components.flatMap { $0 }
    }
}

public protocol TableViewInteractorInput: AnyObject {
    var sections: [any Sectionable] { get set }

    func store(_ sections: [any Sectionable])
    func store(@TableViewSectionBuilder _ sections: () -> [any Sectionable])
    func section(for sectionIndex: Int) -> Section
}

public extension TableViewInteractorInput {
    func store(_ sections: [any Sectionable]) {
        self.sections = sections
    }

    func store(@TableViewSectionBuilder _ sections: () -> [any Sectionable]) {
        self.sections = sections()
    }

    func section(for sectionIndex: Int) -> Section {
        return sections[sectionIndex]
    }
}
