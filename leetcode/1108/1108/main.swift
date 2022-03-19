import Foundation
func defangIPaddr(_ address: String) -> String {
    return address.replacingOccurrences(of: ".", with: "[.]")
}

print(defangIPaddr("1.1.1.1"))
