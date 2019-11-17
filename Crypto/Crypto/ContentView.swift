import SwiftUI

struct Coin: Identifiable{
    let id, name, price, icon: String
}

struct ContentView: View {
    
    var rates : [Coin] = [
        Coin(id: "BTC", name: "Bitcoin", price: "9733.95", icon: "bitcoin"),
        Coin(id: "LTC", name: "Litecoin", price: "78.70", icon: "litecoin"),
        Coin(id: "XRP", name: "Ripple", price: "0.30", icon: "ripple"),
        Coin(id: "TRX", name: "Tron", price: "0.02", icon: "tron"),
        Coin(id: "ETH", name: "Ethereum", price: "78.70", icon: "ethereum")
    ]
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Your crypto balance")
                Text("$3133.7")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                List {
                    Section(header: Text("Current Prices")) {
                        ForEach(rates) { coin in
                            HStack {
                                Image(coin.icon)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("\(coin.name) (\(coin.id))")
                                Spacer()
                                Text(coin.price).fontWeight(.bold)
                            }
                        }
                    }
                }.listStyle(GroupedListStyle())
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
