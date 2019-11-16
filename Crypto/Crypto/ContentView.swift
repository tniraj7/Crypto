import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Your crypto balance")
                Text("3133.7$")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                List {
                    Text("Item 1")
                    Text("Item 2")
                }
            }
            
            .navigationBarTitle(Text("Dashboard"))
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
