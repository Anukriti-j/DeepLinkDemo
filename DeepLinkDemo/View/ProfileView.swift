import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var router: AppRouter
    let session: SessionManager
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Image(systemName: "person")
                    Text("Username")
                }
            } header: {
                Text("Profile")
            }
            
            Section {
                Button {
                    router.logout()
                } label: {
                    Text("Logout")
                        .foregroundStyle(.red)
                }
                
            }
        }
    }
}

#Preview {
    ProfileView(session: SessionManager())
}
