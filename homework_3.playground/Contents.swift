enum ChessPiece {
    case whiteKing(position: (String, String), code: String = "\u{2654}")
    case whiteQueen(position: (String, String), code: String = "\u{2655}")
    case whitePawn(position: (String, String), code: String = "\u{2659}")
    case blackKing(position: (String, String), code: String = "\u{265A}")
}

let whitePawn = ChessPiece.whitePawn(position: ("A", "2"))
let whiteKing = ChessPiece.whiteKing(position: ("E", "1"))
let whiteQueen = ChessPiece.whiteQueen(position: ("D", "1"))
let blackKing = ChessPiece.blackKing(position: ("E", "8"))

let arrayOfChessPieces = [whitePawn,whiteKing,whiteQueen,blackKing]

let column = ["A", "B", "C", "D", "E", "F", "G", "H"]
let row = ["8", "7", "6", "5", "4", "3", "2", "1"]

var chessboard: [[String]] = [
    [ "░", "▓","░", "▓","░", "▓","░", "▓"],
    [ "▓","░", "▓","░", "▓","░", "▓", "░"],
    [ "░", "▓","░", "▓","░", "▓","░", "▓"],
    [ "▓","░", "▓","░", "▓","░", "▓", "░"],
    [ "░", "▓","░", "▓","░", "▓","░", "▓"],
    [ "▓","░", "▓","░", "▓","░", "▓", "░"],
    [ "░", "▓","░", "▓","░", "▓","░", "▓"],
    [ "▓","░", "▓","░", "▓","░", "▓", "░"]
  ]

func printChessboard() {
    print("  " + column.joined(separator: " "))
    for i in row {
        if let unwrappedrow = row.firstIndex(of: i) {
            print("\(i) " + (chessboard[unwrappedrow].joined(separator: " ")))
        }
    }
}

func rewriteChessboardCell(pos: (String, String), code: String) {
    for i in column {
        for j in row {
            if i == pos.0 && j == pos.1 {
                guard let unwrappedRow = row.firstIndex(of: j), let unwrappedColumn = column.firstIndex(of: i) else {return}
                chessboard[unwrappedRow][unwrappedColumn] = String(code)
            }
        }
    }
}

func getChessPiecePosition(chessPiece: ChessPiece) {
    switch chessPiece {
    case .whiteKing(position: let position, code: let code):
        rewriteChessboardCell(pos: position, code: code)
    case .blackKing(position: let position, code: let code):
        rewriteChessboardCell(pos: position, code: code)
    case .whiteQueen(position: let position, code: let code):
        rewriteChessboardCell(pos: position, code: code)
    case .whitePawn(position: let position, code: let code):
        rewriteChessboardCell(pos: position, code: code)
    }
}

func putChessOnChessboard(chess: [ChessPiece]) {
    for chessPiece in chess {
        getChessPiecePosition(chessPiece: chessPiece)
    }
}

putChessOnChessboard(chess: arrayOfChessPieces)
printChessboard()
