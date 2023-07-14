
import SwiftUI

struct TabBarView: View {
    @State private var selection: String = "home"
    @State var tabSelection: TabBarItem
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
                HomeView()
                .tabBarItem(tab: .home, selection: $tabSelection)
                VibrationView()
                .tabBarItem(tab: .vibration, selection: $tabSelection)

        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(tabSelection: TabBarItem.home)
    }
}

