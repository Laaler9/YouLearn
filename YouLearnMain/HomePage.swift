import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Buttons in a vertical stack
                VStack(spacing: 20) {
                    // Google Translate Button
                    NavigationLink(destination: GoogleTranslate()) {
                        Text("GoogleTranslate")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 120)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    // Learn Button - Navigates to Learn.swift
                    NavigationLink(destination: Learn()) {
                        Text("Learn")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 120)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    // Credits Button - Navigates to Credits.swift
                    NavigationLink(destination: Credits()) {
                        Text("Credits")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 120)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 40)
            }
            .navigationTitle("Home Page")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

