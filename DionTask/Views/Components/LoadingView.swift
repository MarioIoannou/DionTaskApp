import SwiftUI

struct LoadingView: View {
    
    var message: String = "Loading..."
    
    var body: some View {
        
        VStack(spacing: 12) {
            ProgressView()
                .scaleEffect(1.5)

            Text(message)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
