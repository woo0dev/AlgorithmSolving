func getDecimalValue(_ head: ListNode?) -> Int {
    var result = 0
    var node = ListNode(0, head)
    var arr: [Int] = []
    var squared = 1
    
    while node.next != nil {
        node = node.next!
        arr.append(node.val)
    }
    arr.reverse()
    print(arr)
    for i in 0..<arr.count {
        if arr[i] == 0 {
            squared *= 2
        } else {
            result += arr[i] * squared
            squared *= 2
        }
    }
    
    return result
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var list = ListNode(1, ListNode(0, ListNode(0, ListNode(1, ListNode(0, ListNode(0, ListNode(1, ListNode(1, ListNode(1,ListNode(0, ListNode(0, ListNode(0, ListNode(0, ListNode(0, ListNode(0)))))))))))))))

print(getDecimalValue(list))
