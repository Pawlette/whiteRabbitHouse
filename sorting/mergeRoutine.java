/*

You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
Merge nums1 and nums2 into a single array sorted in non-decreasing order.
The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

leetcode: https://leetcode.com/problems/merge-sorted-array/

Example:
Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

*/
class Solution {
    /**
     * Merge two sorted arrays starting from the beginning of both
     * @param nums1
     * @param m
     * @param nums2
     * @param n
     */
    public void mergeStart(int[] nums1, int m, int[] nums2, int n) {
        int[] nums3 = new int[m + n];
        int i = 0, j = 0, k = 0;
        while (i < m && j < n) {
            if (nums1[i] <= nums2[j]) {
            nums3[k] = nums1[i];
            i +=1;
        } else {
            nums3[k] = nums2[j];
            j += 1;
        }
        k += 1;
      }
  
      while (i < m) {
          nums3[k] = nums1[i];
          i += 1;
          k += 1;
      }
  
      while (j < n) {
          nums3[k] = nums2[j];
          j += 1;
          k += 1;
      }
  
      // actualizar nums1 con valores ordenados
      for (int h = 0; h < (m+n); h++) {
          nums1[h] = nums3[h];
      }
    }

    /***
     * Merge two sorted arrays starting by the end
     * @param nums1
     * @param m
     * @param nums2
     * @param n
     */
    public static void merge(int[] nums1, int m, int[] nums2, int n) {
        int k = (m + n) - 1;
        int i = m - 1;
        int j = n - 1;
        while (i >= 0 && j >= 0) {
            if (nums1[i] >= nums2[j]) {
                nums1[k] = nums1[i];
                i -= 1;
            } else {
                nums1[k] = nums2[j];
                j -= 1;
            }
            k -= 1;
        }

        while (i >= 0) {
            nums1[k] = nums1[i];
            i -= 1;
            k -= 1;
        }

        while (j >= 0) {
            nums1[k] = nums2[j];
            j -= 1;
            k -= 1;
        }

    }
    public static void main(String[] args) {
        int[] nums1 = { 2, 3, 5, 0, 0, 0 };
        int[] nums2 = { 3, 4, 7 };
        merge(nums1, 3, nums2, 3);
        System.out.print("Merged nums1: ");
        for (int n : nums1) {
            System.out.print(String.format("%d ", n));
        }
    }
}
