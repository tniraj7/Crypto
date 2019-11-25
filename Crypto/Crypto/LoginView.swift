import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("username", text: $username)
                SecureField("password", text: $password)
                Button(action: {
                    
                }) {
                    Text("Login")
                        .padding([.trailing, .leading], 20)
                        .padding([.top, .bottom], 10)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
            }
        }.navigationBarTitle(Text("Crypto"))

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
