///
/// https://leetcode.com/problems/add-two-numbers/
///

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    
    func print() {
        var vals: [Int] = []
        var node: ListNode? = self
        while node != nil {
            vals.append(node?.val ?? 0)
            node = node?.next
        }
        Swift.print(vals)
    }
    
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    /*
     * https://leetcode.com/submissions/detail/248141219/
     * 耗时：48 ms
     * 击败：75.57%
     * 内存：20.8 MB
     *
    var l1 = l1
    var l2 = l2
    var ll: ListNode?
    var l3: ListNode?
    var num: Int?
    while l1 != nil || l2 != nil || num != nil {
        var val = (l1?.val ?? 0) + (l2?.val ?? 0) + (num ?? 0)
        if val >= 10 {
            num = val / 10
            val = val % 10
        } else {
            num = nil
        }
        if l3 == nil {
            l3 = ListNode(val)
            ll = l3
        } else {
            l3?.next = ListNode(val)
            l3 = l3?.next
        }
        l1 = l1?.next
        l2 = l2?.next
    }
    return ll
     */
    
    /*
     * https://leetcode.com/submissions/detail/248144172/
     * 耗时：40 ms
     * 击败：99.34%
     * 内存：20.8 MB
     */
    var l1 = l1
    var l2 = l2
    var ll: ListNode?
    var l3: ListNode?
    var num: Int?
    while l1 != nil || l2 != nil || num != nil {
        var val = (l1?.val ?? 0) + (l2?.val ?? 0) + (num ?? 0)
        if val >= 10 {
            num = val / 10
            val = val % 10
        } else {
            num = nil
        }
        if let l = l3 {
            l.next = ListNode(val)
            l3 = l.next
        } else {
            l3 = ListNode(val)
            ll = l3
        }
        if let l = l1?.next {
            l1 = l
        } else {
            l1 = nil
        }
        if let l = l2?.next {
            l2 = l
        } else {
            l2 = nil
        }
    }
    return ll
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)
let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)
var l3 = addTwoNumbers(l1, l2)
l3?.print()

let n1 = ListNode(5)
let n2 = ListNode(5)
var n3 = addTwoNumbers(n1, n2)
n3?.print()
