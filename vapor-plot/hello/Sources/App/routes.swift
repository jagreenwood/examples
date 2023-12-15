import Vapor

func routes(_ app: Application) throws {
    app.get("hello") { req async -> Page in
        Hello()
    }
}
