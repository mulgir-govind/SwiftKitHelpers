import Foundation

public enum MainThread {

    /// Runs `work` on the main queue immediately when already on the main thread; otherwise async.
    public static func run(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}

public extension DispatchQueue {

    /// Executes `work` on this queue after `delay` seconds.
    func asyncAfter(seconds delay: TimeInterval, execute work: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: work)
    }
}
