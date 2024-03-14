var persons: [String] = []

// fill the array
for i in 1...20 {
    persons.append("Person\(i)")
}

// access person with index 3 (indexes start with 0 so this is the 4th person)
print(persons)
