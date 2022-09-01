"""
IS UNIQUE:

Implement an algorithm to determine if a string has all unique characters.
What if you cannot use additional data structures?

Notes (possible questions to ask to interviewer):
* Is a blank-space considered a valid character?
* Can the string have only one character?
"""


# Case 1. BruteForce
# String: "yosemite"

# walkthourgh string, compare each character with the remaining chars in the string
# Time: O(n ^ 2) considering: n + (n -1) + (n - 2) + n( - 3) + ... | Space: O(1)
def uniqueStringOne(input):
  for i in range(len(input)):
    temp = input[i]  
    for k in range(i + 1, len(input)):
      if (temp == input[k]): 
        print(False)
        return

  print(True)

# Case 2. Improved solution using extra space
# Time: O(n) | Space: O(n)
def uniqueStringTwo(input):
  letras = set()
  for c in input:
    if (c in letras):
      print(False)
      return
    else:
      letras.add(c)

  print(True)
  return

# Follow up question: What if you cannot use additional data structures?

# Time: O(n log(n)) | Space: O(1)
def uniqueStringThree(input):
  sorteado = sorted(input)
  temp = sorteado[0]
  for c in range(1, len(sorteado)):
    if (sorteado[c] == temp):
      print(False)
      return
      
    temp = sorteado[c]
    
  print(True)
  return

input = 'Supercalifragilisticexpialidocious'
# String: "quiero una paleta" (with blank spaces)
# uniqueStringOne(input)
# uniqueStringTwo(input)
uniqueStringThree(input)

