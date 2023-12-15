//
//  Hello.swift
//
//
//  Created by Jeremy Greenwood on 12/6/23.
//

import Plot

final class Hello: Page {
    let count: Int

    init(count: Int) {
        self.count = count
    }

    @ComponentBuilder
    override func content() -> Component {
        for _ in 1...count {
            Paragraph {
                Text("Hello, World!")
            }
        }
    }
}
