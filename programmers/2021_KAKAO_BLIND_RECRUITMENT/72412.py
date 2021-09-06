from bisect import bisect_left
from collections import defaultdict
from itertools import combinations

def solution(info, query):
    applicants = defaultdict(list)
    for description in info:
        *description, score = description.split()
        score = int(score)
        for n_choose in range(5):
            for sections in combinations(description, n_choose):
                applicants[''.join(sections)].append(score)
    
    for key in applicants:
        applicants[key].sort()
    
    ans = []
    for requirement in query:
        *requirement, score = requirement.replace(' and', '').replace('- ', '').split()
        fulfilled = applicants[''.join(requirement)]
        ans.append(len(fulfilled) - bisect_left(fulfilled, int(score)))
    
    return ans
