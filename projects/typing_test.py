""" Typing Test implementation """

from utils import *
from ucb import main

# BEGIN Q1-5
"*** YOUR CODE HERE ***"
def lines_from_file(path):
    with open(path) as file:
        return [line.strip() for line in readlines(file)]


def new_sample(path, i):
    return lines_from_file(path)[i]


def analyze(sample, typed, start, end):
    time = (end - start) / 60
    speed = round(len(typed) / (5 * time), 3)
    
    sample, typed = sample.split(), typed.split()
    acc_word, acc = 0, 0.0
    length = min(len(sample), len(typed))

    if length == 0:
        return [speed, acc]

    for i in range(length):
        if typed[i] == sample[i]:
            acc_word += 1

    acc = acc_word / length * 100
    return [speed, acc]


def pig_latin(word):
    if word[0].lower() in ["a", "e", "i", "o", "u"]:
        return word + "way"
    else:
        for i in range(len(word)):
            word = word[1: ] + word[0]
            if word[0] in ["a", "e", "i", "o", "u"]:
                break
        return word + "ay"
# END Q1-3
# Because I can't access the google form anymore to get the secret word, I can't coutinue this project.


# END Q1-5

# Question 6

def score_function(word1, word2):
    """A score_function that computes the edit distance between word1 and word2."""

    if ______________: # Fill in the condition
        # BEGIN Q6
        "*** YOUR CODE HERE ***"
        # END Q6

    elif ___________: # Feel free to remove or add additional cases
        # BEGIN Q6
        "*** YOUR CODE HERE ***"
        # END Q6
    
    else:
        add_char = ______________  # Fill in these lines
        remove_char = ______________
        substitute_char = ______________
        # BEGIN Q6
        "*** YOUR CODE HERE ***"
        # END Q6

KEY_DISTANCES = get_key_distances()

# BEGIN Q7-8
"*** YOUR CODE HERE ***"
# END Q7-8
