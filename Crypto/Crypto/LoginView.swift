import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            Form {

                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Login")
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                        .padding([.trailing, .leading], 15)
                        .padding([.top, .bottom], 8)
                        .background(Color.yellow)
                        .cornerRadius(7)
                    }
                    Spacer()
                }
            }.navigationBarTitle("Crypto", displayMode: .automatic)
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
