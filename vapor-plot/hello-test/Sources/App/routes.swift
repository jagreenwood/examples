import Vapor

func routes(_ app: Application) throws {

    app.get("hello-plot-component") { req async -> Page in
        Hello(count: 1000)
    }
    app.get("hello-plot-node") { req async -> Page in
        HelloNode(count: 1000)
    }

    let count = Array<Int>.sequential(count: 1000)
    app.get("hello-leaf") { req async throws -> View in
        try await req.view.render("hello", ["count": count])
    }
}

extension Array where Element == Int {
    static func sequential(count: Int) -> Self {
        var value = Array<Int>()
        for number in 1...count {
            value.append(number)
        }

        return value
    }
}

