
import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding   var selection: TabBarItem
    @Namespace var nameSpace
    @State var localSelection: TabBarItem
    var body: some View {
        tabBar1()
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: [.home,.vibration], selection: .constant(.home), localSelection: .home)
        }
    }
}

extension CustomTabBarView {
    private func tabView(item: TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 20, alignment: .center)
                .foregroundStyle(selection == item ? LinearGradient(colors: [.white, Color(hue: 25/360, saturation: 1, brightness: 1), Color(hue: 302/360, saturation: 0.8, brightness: 0.6)], startPoint: .top, endPoint: .bottom) : .linearGradient(colors: [.white], startPoint: .top, endPoint: .bottom))
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }
    
    private func switchToTab(item: TabBarItem) {
        selection = item
    }
}

extension CustomTabBarView {
    private func tabBar1() -> some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(item: tab)
                    .onTapGesture {
                        switchToTab(item: tab)
                    }
            }
        }
        .padding(.horizontal, 15)
        .frame(height: 65)
        .padding(.bottom)
        .background(content: {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(
                    Color("TabBarColor").opacity(0.5).shadow(.drop(color: Color("ShadowColor2"), radius: 6.4, x: 7, y: 7))
                        .shadow(.inner(color: .white.opacity(0.01), radius: 2, x: -3, y: -3))
                    
                )
        })
        .cornerRadius(100)
        .padding(.horizontal, 1)
    }
}
