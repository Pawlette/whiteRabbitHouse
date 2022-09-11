/*

You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
Merge nums1 and nums2 into a single array sorted in non-decreasing order.
The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

leetcode: https://leetcode.com/problems/merge-sorted-array/

Example:
Input: nums1 = [1,2,2,3,5,6], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

*/

class Solution {
    
    /**
     Merge two sorted arrays starting from the beginning of both, using an auxiliary array
     O( n + m ) time ⏰
     O( n + m ) space 🔭
     Where n represents nums1 and m represents nums2
    */
    func mergeStart(nums1: inout [Int], m: Int, nums2: [Int], n: Int) {
        var nums3 = Array<Int>(repeating: 0, count: n + m)
        var (i, j, k) = (0, 0, 0)
        while i < m && j < n {
            let currentNum1 = nums1[i]
            let currentNum2 = nums2[j]
            
            if currentNum1 <= currentNum2 {
                nums3[k] = currentNum1
                i += 1
            } else {
                nums3[k] = currentNum2
                j += 1
            }
            k += 1
        }
        
        while i < m {
            nums3[k] = nums1[i]
            i += 1
            k += 1
        }
        
        while j < n {
            nums3[k] = nums2[j]
            j += 1
            k += 1
        }
        
        nums1 = nums3
    }
    
    /**
     Merge two sorted arrays starting by the end, using 3 pointers
     O( n + m ) time ⏰
     O( 1 ) space 🔭
     Where n represents nums1 and m represents nums2
    */
    static func merge(nums1: inout [Int], m: Int, nums2: [Int], n: Int) {
        var nums1Idx = m - 1
        var nums2Idx = n - 1
        var sortingIndex = nums1.count - 1
        
        while nums1Idx >= 0 && nums2Idx >= 0 {
            let currentNum1 = nums1[nums1Idx]
            let currentNum2 = nums2[nums2Idx]
            
            if currentNum2 > currentNum1 {
                nums1[sortingIndex] = currentNum2
                nums2Idx -= 1
            } else {
                nums1[sortingIndex] = currentNum1
                nums1Idx -= 1
            }
            
            sortingIndex -= 1
        }
        
        while nums2Idx >= 0 {
            nums1[sortingIndex] = nums2[nums2Idx]
            nums2Idx -= 1
            sortingIndex -= 1
        }
    }
    
    static func main() {
        var nums1 = [2, 3, 5, 0, 0, 0]
        let nums2 = [3, 4, 7]
        
        merge(nums1: &nums1, m: 3, nums2: nums2, n: 3)
        print("Merged nums: \(nums1)")
    }
}

Solution.main()
