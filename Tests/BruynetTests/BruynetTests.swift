import XCTest
@testable import Bruynet

final class BruynetTests: XCTestCase {
    
    func testExample() {
        URLSession.shared.baseURL = "bruynet"
        XCTAssertNotEqual(URLSession.shared.baseURL, nil)
        XCTAssertEqual(URLSession.shared.baseURL, "bruynet")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
