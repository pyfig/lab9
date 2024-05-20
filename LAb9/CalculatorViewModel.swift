import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var displayText: String = "0"
    private var numberStack: [Double] = []
    private var operationStack: [String] = []
    
    func handleDigit(_ digit: String) {
        if digit == "0" && displayText == "0" {
            return
        }
        
        if displayText == "0" || displayText.contains(".") {
            displayText = digit
        } else {
            displayText += digit
        }
    }
    
    func handleOperation(_ operation: String) {
        if operationStack.isEmpty {
            numberStack.append(Double(displayText) ?? 0)
            operationStack.append(operation)
            displayText = ""
        } else {
            operationStack.append(operation)
            
        }
    }
    
    func setOperation(_ symbol: String) {
        handleOperation(symbol)
    }
    
    func calculate() {
         
        
        let lastOperation = operationStack.removeLast()
        switch lastOperation {
        case "+":
            numberStack[numberStack.count - 2] += numberStack.removeLast()
        case "-":
            numberStack[numberStack.count - 2] -= numberStack.removeLast()
        case "*":
            numberStack[numberStack.count - 2] *= numberStack.removeLast()
        case "/":
                 numberStack[numberStack.count - 2] = numberStack.removeLast()
        case "=":
            numberStack[numberStack.count - 1] = numberStack.removeLast()
        default:
            break
        }
        
        displayText = "\(numberStack.last ?? 0)"
    }
    

    func reset() {
        numberStack.removeAll()
        operationStack.removeAll()
        displayText = "0"
    }
}
