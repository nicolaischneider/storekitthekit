import Foundation
import os

extension Logger {
    
    static let subsystem = "com.nicolaischneider.storekitthekit"
    
    static let store = Logger(subsystem: subsystem, category: "STORE")
    
    func addLog (
        _ message: String,
        input: String? = nil,
        level: OSLogType = .default,
        shareWithCtashlytics: Bool = true
    ) {
        if let input = input {
            addlog("\(message): \(String(describing: input))", level: level)
        } else {
            addlog(message, level: level)
        }
    }
    
    func addLog (
        _ message: String,
        input: CGFloat,
        level: OSLogType = .default,
        shareWithCtashlytics: Bool = true
    ) {
        let text = "\(message): \(input)"
        addlog(text, level: level)
    }
    
    private func addlog(_ message: String, level: OSLogType) {
        
        switch level {
        case .debug:
            debug("\(message, privacy: .private)")
        case .info:
            info("\(message, privacy: .private)")
        case .error:
            error("\(message, privacy: .private)")
        case .fault:
            fault("\(message, privacy: .private)")
        default:
            log("\(message, privacy: .private)")
        }
    }
}
