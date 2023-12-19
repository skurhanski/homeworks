//1
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let desireLetter: Character = "m"

let arrayOfAlphabet = Array(alphabet)

if let index = arrayOfAlphabet.firstIndex(of: Character(desireLetter.uppercased())) {
    print(index)
} else {
    print("Сharacter not found in alphabet")
}

//2
let daysOfMonths: [(month: String, days:Int)] = [
    ("January", 31), ("February", 28), ("March", 31),
    ("April", 30), ("May", 31), ("June", 30),
    ("July", 31), ("August", 31), ("Semtember", 30),
    ("October", 31), ("November", 30), ("December", 31)]
