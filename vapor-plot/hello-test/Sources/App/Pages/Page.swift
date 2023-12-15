//
//  Page.swift
//
//
//  Created by Jeremy Greenwood on 12/6/23.
//

import Plot
import Vapor

class Page {
    final func head() -> Node<HTML.DocumentContext> {
        .head(
            .viewport(.accordingToDevice, initialScale: 1),
            .meta(.charset(.utf8)),
            .siteName("Hello")
        )
    }

    func body() -> Node<HTML.DocumentContext> {
        .body(
            .component(content())
        )
    }

    @ComponentBuilder
    func content() -> Component {
        Text("Default Content")
    }
}

extension Page: Renderable {
    func render(indentedBy indentationKind: Plot.Indentation.Kind?) -> String {
        HTML(
            head(),
            body()
        )
        .render(indentedBy: indentationKind)
    }
}

extension Page: AsyncResponseEncodable {
    public func encodeResponse(for request: Request) async throws -> Response {
        let response = Response(status: .ok, body: .init(string: render(indentedBy: .spaces(4))))
        response.headers.add(name: "Content-Type", value: "text/html; charset=utf-8")
        return response
    }
}
