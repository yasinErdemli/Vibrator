
import SwiftUI



struct CustomTabBarContainerView<Content: View>: View {
    let content: Content
    @Binding var selection:  TabBarItem
    @State private var tabs: [TabBarItem] = []
    init(selection: Binding<TabBarItem> ,@ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: .vibration)
                .ignoresSafeArea(edges: .bottom)
                .offset(y: 4)
                
        }
        .ignoresSafeArea()
//        .overlay(alignment: .bottom, content: {
//            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: .vibration)
//                .ignoresSafeArea()
//        })
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { item in
            tabs = item
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(TabBarItem.vibration)) {
            Color.red
        }
    }
}
