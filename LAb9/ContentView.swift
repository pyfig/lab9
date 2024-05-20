import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        HStack {
            Spacer()
            Text(viewModel.displayText)
                .font(.largeTitle)
                .padding()
                .background(Color.white)
                .cornerRadius(55)
            
            Divider()
            
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) {
                ForEach(0..<9) { index in
                    Button(action: {
                        viewModel.handleDigit(String(index))
                    }) {
                        Text(String(index))
                            .font(.title2)
                            .frame(maxWidth:.infinity)
                            .frame(height: 20)
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
                Button(action: {
                    viewModel.setOperation("+")
                }) {
                    Text("+")
                        .font(.title2)
                        .frame(maxWidth:.infinity)
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    viewModel.setOperation("-")
                }) {
                    Text("-")
                        .font(.title2)
                        .frame(maxWidth:.infinity)
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    viewModel.setOperation("*")
                }) {
                    Text("*")
                        .font(.title2)
                        .frame(maxWidth:.infinity)
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    viewModel.setOperation("/")
                }) {
                    Text("/")
                        .font(.title2)
                        .frame(maxWidth:.infinity)
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    viewModel.handleOperation("=")
                    viewModel.calculate()
                }) {
                    Text("=")
                        .font(.title2)
                        .frame(maxWidth:.infinity)
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    viewModel.reset()
                }) {
                    Text("C")
                        .font(.title2)
                        .frame(maxWidth:.infinity)
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
