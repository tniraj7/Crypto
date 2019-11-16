import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Your crypto balance")
                Text("3133.7$")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                

            }
            
            .navigationBarTitle(Text("Dashboard"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
