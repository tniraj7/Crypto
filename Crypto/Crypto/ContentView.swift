import SwiftUI


struct GraphCoin: View {
    
    let title: String
    let lineCoordinates: [CGFloat]
    
    var body: some  View {
        LineChartController(lineCoordinates: [5000,8000,7000,11000,5000,6000,10000], inline: false)
        LineChartController(lineCoordinates: lineCoordinates, inline: false)
            .padding(.leading, 30)
        .navigationBarTitle(Text(title))
    }
}


struct Coin: Identifiable {
    let id, name, price, icon: String
}

struct BadgeSymbol: View {
    
    static let symbolColor = Color(red: 79.0/255, green: 79.0/255, blue: 191.0/255)
    
    var body : some View {
        GeometryReader { geometry in
            Path { path in
                
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.028
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle,y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topWidth / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
                
            }.fill(Self.symbolColor)
            
        }
    }
}

struct ContentView: View {
    
    var rates : [Coin] = [
        Coin(id: "BTC", name: "Bitcoin", price: "9733.95", icon: "bitcoin"),
        Coin(id: "LTC", name: "Litecoin", price: "78.70", icon: "litecoin"),
        Coin(id: "XRP", name: "Ripple", price: "0.30", icon: "ripple"),
        Coin(id: "TRX", name: "Tron", price: "0.02", icon: "tron"),
        Coin(id: "ETH", name: "Ethereum", price: "78.70", icon: "ethereum")
    ]
    
    var myWallet: [Coin] = [
    Coin(id: "BTC", name: "Bitcoin", price: "1000.0", icon: "bitcoin"),
    Coin(id: "LTC", name: "Litecoin", price: "2000.0", icon: "litecoin"),
    Coin(id: "TRX", name: "Tron", price: "133.7", icon: "tron"),
    ]
    
    @State var is360 = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Button(action: {
                    self.is360.toggle()
                }) {
                    
                    BadgeSymbol()
                        .frame(width: 150, height: 150)
                        .rotation3DEffect(.degrees(is360 ? 360 : 0), axis: (x: 0, y: 1, z: 1))
                        .animation(.easeIn)
                }

                LineChartController(lineCoordinates: [3,2,6], inline: true)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
                    .padding()
                
                Text("Your crypto balance")
                Text("$3133.7")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                
                List {
                    
                    Section(header: Text("My Wallet")) {
                        ForEach(myWallet) { coin in
                            HStack {
                                Image(coin.icon)
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .leading)
                                    
                                Text("\(coin.name) (\(coin.id))")
                                Spacer()
                                Text(coin.price).fontWeight(.bold)
                            }
                        }
                    }
                    
                    Section(header: Text("Current Prices")) {
                        ForEach(rates) { coin in
                            
                            NavigationLink(destination: GraphCoin(title: coin.name)) {

                                HStack {
                                    Image(coin.icon)
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .leading)
                                    
                                    Text("\(coin.name) (\(coin.id))")
                                    Spacer()
                                    Text(coin.price).fontWeight(.bold)
                                }
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
