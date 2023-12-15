//
//  Hello.swift
//
//
//  Created by Jeremy Greenwood on 12/6/23.
//

import Plot

final class Hello: Page {

    @ComponentBuilder
    override func content() -> Component {
        Paragraph {
            Text("Hello, World!")
        }
    }
}
