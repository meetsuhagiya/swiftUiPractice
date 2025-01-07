import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggingIn = false
    @State private var loginScreen = false
    @State private var isLoading = false  // To control when to show the loading screen
    
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
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.10))
                        .cornerRadius(10)
                        .padding(.bottom, 20)

                    Button(action: {
                        isLoggingIn = true  // Show ProgressView
                        AuthenticateUser(username: username, password: password)
                    }) {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(.blue.opacity(0.78))
                            .cornerRadius(10)
                    }
                    .disabled(isLoggingIn)
                    // Disable the button while logging in
                    
                   
                    NavigationLink(
                        destination: LoadingScreen(),
                        isActive: $isLoading) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func AuthenticateUser(username: String, password: String) {
        // Simulate authentication
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {  // Simulate network delay
            if username == "Meet" && password == "12345" {
                // Successful login, show loading screen
                isLoading = true
            } else {
                // Invalid credentials, handle error
                isLoggingIn = false
            }
        }
    }
}

struct LoadingScreen: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()  // Semi-transparent background
            
            VStack {
                ProgressView("Logging In...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 20)
                
                Text("Please wait while we log you in.")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
        .onAppear {
            // Simulate loading delay before moving to the final screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // After the simulated loading, navigate to the "Logged In" page
                navigateToLoggedInPage()
            }
        }
    }
    
    func navigateToLoggedInPage() {
        NavigationStack {
            Text("You're logged in!")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview(body: {
    ContentView()
})
