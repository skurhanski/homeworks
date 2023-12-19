//Через if:

func discoverCellColor() -> [String: Bool] {
    let row = ["A", "B", "C", "D", "E", "F", "G", "H"]
    let column = ["1", "2", "3", "4", "5", "6", "7", "8"]
    var colorCell = [String: Bool]()
    for i in row {
        for j in column {
            if let unwrappedRow = row.firstIndex(of: i), let unwrappedColumn = column.firstIndex(of: j) {
                if (unwrappedRow + unwrappedColumn) % 2 == 0 {
                    colorCell[j+i] = true
                } else {
                    colorCell[j+i] = false
                }
            }
        }
    }
    return colorCell
}
let colorCell = discoverCellColor()
print(colorCell)


//Через guard let (не знаю, нужно ли через guard, т.к. мы не вернем nil, исходные данные внутри функции)

func discoverCellColor() -> [String: Bool] {
    let row = ["A", "B", "C", "D", "E", "F", "G", "H"]
    let column = ["1", "2", "3", "4", "5", "6", "7", "8"]
    var colorCell = [String: Bool]()
    for i in row {
        for j in column {
            guard let unwrappedRow = row.firstIndex(of: i), let unwrappedColumn = column.firstIndex(of: j) else {return colorCell}
            if (unwrappedRow + unwrappedColumn)%2 == 0 {
                colorCell[j+i] = true
            } else {
                colorCell[j+i] = false
            }
        }
    }
    return colorCell
}
let colorCell = discoverCellColor()
print(colorCell)
