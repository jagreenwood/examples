//
//  HelloNode.swift
//
//
//  Created by Jeremy Greenwood on 12/6/23.
//

import Plot

final class HelloNode: Page {
    let count: Int

    init(count: Int) {
        self.count = count
    }

    override func body() -> Node<HTML.DocumentContext> {
        .body(.forEach(1...count, { number in
                .p("Hello, World")
        }))
    }
}
