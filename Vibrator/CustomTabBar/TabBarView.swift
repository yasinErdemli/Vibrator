
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

extension TabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image("tabDaily")
                    Text("Daily")
                }
            
            Color.blue
                .tabItem {
                    Image("tabTarot")
                    Text("Tarot")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "tabRunes")
                    Text("Runes")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "tabDreams")
                    Text("Dreams")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "tabJournal")
                    Text("Journal")
                }
        }
        .tabViewStyle(.automatic)
    }
}
