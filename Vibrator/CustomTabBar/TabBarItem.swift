
import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, vibration
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .vibration: return "waveform"
        }
    }
}
