@testable import App
@testable import XCTVapor

final class AppTests: XCTestCase {
    var app: Application!

    override func setUp() async throws {
        app = try await Application.testable()
    }

    override func tearDownWithError() throws {
        app.shutdown()
        app = nil
    }

    func testLeaf() async throws {
        measure(metrics: [XCTMemoryMetric.init(), XCTClockMetric.init()]) {
            for _ in 0...100 {
                do {
                    _ = try app.performTest(request: XCTHTTPRequest.make(with: .GET, path: "hello-leaf"))
                } catch {
                    XCTFail(error.localizedDescription)
                }
            }
        }
    }

    func testPlotComponent() async throws {
        measure(metrics: [XCTMemoryMetric.init(), XCTClockMetric.init()]) {
            for _ in 0...100 {
                do {
                    _ = try app.performTest(request: XCTHTTPRequest.make(with: .GET, path: "hello-plot-component"))
                } catch {
                    XCTFail(error.localizedDescription)
                }
            }
        }
    }

    func testPlotNode() async throws {
        measure(metrics: [XCTMemoryMetric.init(), XCTClockMetric.init()]) {
            for _ in 0...100 {
                do {
                    _ = try app.performTest(request: XCTHTTPRequest.make(with: .GET, path: "hello-plot-node"))
                } catch {
                    XCTFail(error.localizedDescription)
                }
            }
        }
    }
}

extension Application {
    static func testable() async throws -> Application {
        let app = Application(.testing)
        try await configure(app)

        return app
    }
}

extension XCTHTTPRequest {
    static func make(with method: HTTPMethod, path: String) -> XCTHTTPRequest {
        XCTHTTPRequest(
            method: method,
            url: .init(path: path),
            headers: [:],
            body: ByteBufferAllocator().buffer(capacity: 0)
        )
    }
}
