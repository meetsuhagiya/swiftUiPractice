import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var loginScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("natural")
                    .resizable()
                    .ignoresSafeArea()
             
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.10))
                        .cornerRadius(10)
                        .border(Color(red: 0.0392, green: 0.0392, blue: 242), width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.10))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .padding(.bottom,20)
                    
                    Button("Login") {
                        AuthenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue.opacity(0.78))
                    .cornerRadius(10)
                    
                    NavigationLink(
                        destination: Text("You're logged In"),
                        isActive: $loginScreen){
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func AuthenticateUser(username: String, password: String) {
        if username == "Meet" {
            wrongUsername = 0
            if password == "12345" {
                wrongPassword = 0
                loginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    ContentView()
}
