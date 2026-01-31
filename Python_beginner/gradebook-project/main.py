last_semester_gradebook = [["politics", 80], ["latin", 96], ["dance", 97], ["architecture", 65]]

subjects = [
    "physics",
    "calculus",
    "poetry",
    "history"
]

grades = [
    98,
    97,
    85,
    88
]

gradebook = []

for subject, grade in zip(subjects, grades):
    gradebook.append([subject, grade])

print(gradebook)

gradebook.append(["computer science", 100])

gradebook.append(["visual arts", 93])

print(gradebook)

gradebook[-1][-1] = gradebook[-1][-1] + 5

gradebook.remove(["poetry", 85])

print(gradebook)

gradebook.append(["poeter", "Pass"])

full_gradebook = gradebook + last_semester_gradebook

print(full_gradebook)