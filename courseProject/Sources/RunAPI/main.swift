import App
import Vapor
import APICore

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }
try configureAPI(app)
try app.run()