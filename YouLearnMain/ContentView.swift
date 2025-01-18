import SwiftUI

struct ContentView: View {
    @State private var showPopup = false
    @State private var navigateToHomePage = false
    @State private var navigateToUpdateNote = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Main white background
                Color.white
                    .ignoresSafeArea()
                
                // Logo image in the middle of the screen
                Image("LogoMain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                // Button to show the popup
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showPopup = true
                        }
                    }) {
                        Text("Show Popup")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                
                // Popup overlay
                if showPopup {
                    ZStack {
                        // Semi-transparent shadow layer
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showPopup = false
                                }
                            }
                        
                        // Popup content
                        VStack(spacing: 20) {
                            Text("Hello! By clicking Get started you will proceed to use our application/app.")
                                .font(.headline)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            NavigationLink(destination: HomePage(), isActive: $navigateToHomePage) {
                                EmptyView()
                            }
                            
                            Button(action: {
                                withAnimation {
                                    showPopup = false
                                    navigateToHomePage = true
                                }
                            }) {
                                Text("Get Started")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                        .padding(.horizontal, 20) // Adjusted for better spacing
                        .frame(maxWidth: 300) // Limit the popup width
                    }
                }
            }
            .onAppear {
                // Check if the update note has been shown before
                if UserDefaults.standard.bool(forKey: "UpdateNoteShown") == false {
                    // Navigate to UpdateNote if it's the first time the app is launched
                    navigateToUpdateNote = true
                }
            }
            .background(
                NavigationLink(destination: UpdateNote(), isActive: $navigateToUpdateNote) {
                    EmptyView()
                }
            )
            .navigationBarHidden(true) // Hides the navigation bar
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures proper rendering on all devices
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

