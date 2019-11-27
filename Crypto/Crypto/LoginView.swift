import SwiftUI
import Combine


struct ServerMessage: Decodable {
    let status, message: String
}

class HttpAuth: ObservableObject {
    
    var didChange = PassthroughSubject<HttpAuth, Never>()
    
    var authenticated = false {
        didSet {
            didChange.send(self)
        }
    }
    
    func checkDetails(username: String, password : String) {
        guard let url = URL(string: "") else { return }
        
        let body = ["username": username, "password": password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            
            let finalData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            
            if finalData.status == "ok" {
                DispatchQueue.main.async {
                    self.authenticated = true
                }
            }
        }.resume()
    }
}

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var manager = HttpAuth()
    
    var body: some View {
        NavigationView {
            Form {

                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                if manager.authenticated {
                    Text("You are logged in :D")
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.manager.checkDetails(username: self.username, password: self.password)
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
