import SwiftUI

struct UpdateNote: View {
    @State private var navigateToContentView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("New Update Available!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("nothing is new YET. the app is still in beta.")
                .font(.title2)
                .padding()
            
            Spacer()
            
            // Button to dismiss and navigate back to ContentView
            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                EmptyView()
            }
            
            Button(action: {
                // Mark the note as shown in UserDefaults
                UserDefaults.standard.set(true, forKey: "UpdateNoteShown")
                
                // Navigate to ContentView after clicking Got It
                navigateToContentView = true
            }) {
                Text("Got It!")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Update Note")
        .padding()
    }
}

struct UpdateNote_Previews: PreviewProvider {
    static var previews: some View {
        UpdateNote()
    }
}

