import class Foundation.Bundle

extension Foundation.Bundle {
    static var module: Bundle = {
        let mainPath = Bundle.main.bundlePath + "/" + "courseProject_App.resources"
        let buildPath = "/workspaces/CourseProject/.build/x86_64-unknown-linux-gnu/debug/courseProject_App.resources"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle != nil ? preferredBundle : Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}