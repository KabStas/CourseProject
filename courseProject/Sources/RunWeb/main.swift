import App
import Vapor
import APICore
// import Leaf
// import LeafKit

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
defer { app.shutdown() }
try configureWeb(app)
try app.run()