import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var router: AppRouter
    @StateObject private var viewModel: LoginViewModel
    @State private var name: String = ""
    
    init(session: SessionManager) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(session: session))
    }
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.headline)
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button {
                    viewModel.login()
                    router.navigate(to: .home)
                } label: {
                    Text("Login")
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView(session: SessionManager())
}
