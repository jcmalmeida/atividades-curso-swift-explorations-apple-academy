import Foundation

enum Cargo {
    case monitor, professor, coordenador, diretor, assistente
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Float
    let cargo: Cargo
}

var salarioDoDiretor: Float = 0
var escolaTemDiretor = false
var numeroDeCoordenadores = 0
var numeroDeProfessores = 0

let marie = Colaborador(nome: "Marie", matricula: 4321, salario: 20000, cargo: .diretor)
let joao = Colaborador(nome: "João", matricula: 1234, salario: 10000, cargo: .professor)
let thais = Colaborador(nome: "Thais", matricula: 5678, salario: 15000, cargo: .coordenador)
let jose = Colaborador(nome: "José", matricula: 9876, salario: 11000, cargo: .professor)
let ana = Colaborador(nome: "Ana", matricula: 1359, salario: 14000, cargo: .coordenador)
let maria = Colaborador(nome: "Maria", matricula: 2468, salario: 10500, cargo: .coordenador)
let anastacia = Colaborador(nome: "Anastácia", matricula: 2468, salario: 30000, cargo: .diretor)
let antonio = Colaborador(nome: "Antônio", matricula: 0000, salario: 9000, cargo: .professor)

var colaboradores: [Colaborador] = []

func cadastrarColaborador(novoColaborador: Colaborador) {
    if escolaTemDiretor && novoColaborador.cargo == .diretor {
        print("\(novoColaborador.nome), a escola já tem diretor!\n")
        return
    } else if !escolaTemDiretor && novoColaborador.cargo == .diretor {
        escolaTemDiretor = true
        salarioDoDiretor = novoColaborador.salario
        colaboradores.append(novoColaborador)
        return
    } else if novoColaborador.cargo == .coordenador && numeroDeProfessores == numeroDeCoordenadores {
        print("\(novoColaborador.nome), a  escola está no limite entre o número de professores e coordenadores!\n")
        return
    } else if novoColaborador.cargo == .coordenador && novoColaborador.salario < salarioDoDiretor {
        numeroDeCoordenadores += 1
    } else if novoColaborador.cargo == .professor && novoColaborador.salario < salarioDoDiretor {
        numeroDeProfessores += 1
    }
    if novoColaborador.salario < salarioDoDiretor {
        colaboradores.append(novoColaborador)
    }
}

func descadastrarColaborador(matricula: Int) {
    var indiceParaDeletar = 0
    for index in 0..<colaboradores.count {
        if colaboradores[index].matricula == matricula {
            indiceParaDeletar = index
        }
    }
    if escolaTemDiretor && colaboradores[indiceParaDeletar].cargo == .diretor {
        escolaTemDiretor = false
        print("Precisamos urgentemente de um novo diretor!\n")
    } else if colaboradores[indiceParaDeletar].cargo == .coordenador {
        numeroDeCoordenadores -= 1
    } else if colaboradores[indiceParaDeletar].cargo == .professor {
        numeroDeProfessores -= 1
    }
    colaboradores.remove(at: indiceParaDeletar)
}

cadastrarColaborador(novoColaborador: marie)
cadastrarColaborador(novoColaborador: joao)
cadastrarColaborador(novoColaborador: thais)
cadastrarColaborador(novoColaborador: jose)
cadastrarColaborador(novoColaborador: ana)
cadastrarColaborador(novoColaborador: maria)
cadastrarColaborador(novoColaborador: anastacia)
cadastrarColaborador(novoColaborador: antonio)

//print(colaboradores)
//print("\n")

//descadastrarColaborador(matricula: 2468)

//print(colaboradores)
//print("\n")

func gastosMensaisTotais() {
    var gastoTotal: Float = 0
    for colaborador in colaboradores {
        gastoTotal = colaborador.salario + gastoTotal
    }
    print("O gasto total com colaboradores é de R$ \(gastoTotal).\n")
}

func gastosMensaisPorCargo(de cargo: Cargo) {
    var gastoPorCargo: Float = 0
    for colaborador in colaboradores {
        if colaborador.cargo == cargo {
            gastoPorCargo = colaborador.salario + gastoPorCargo
        }
    }
    print("O gasto total com colaboradores no cargo de \(cargo) é de R$ \(gastoPorCargo).")
}

func quantidadeDePessoasNoCargo(de cargo: Cargo) {
    var quantidadeDePessoas: Int = 0
    for colaborador in colaboradores {
        if colaborador.cargo == cargo {
            quantidadeDePessoas += 1
        }
    }
    print("A quantidade de colaboradores no cargo de \(cargo) é de \(quantidadeDePessoas).\n")
}

func estatisticasDoCargo(de cargo: Cargo) {
    gastosMensaisPorCargo(de: cargo)
    quantidadeDePessoasNoCargo(de: cargo)
}

gastosMensaisTotais()
estatisticasDoCargo(de: .professor)
estatisticasDoCargo(de: .coordenador)
estatisticasDoCargo(de: .diretor)
estatisticasDoCargo(de: .assistente)
estatisticasDoCargo(de: .monitor)

func listaDeColaboradores() {
    var listaDeColaboradores: [String] = []
    for colaborador in colaboradores {
        listaDeColaboradores.append(colaborador.nome)
    }
    listaDeColaboradores.sort { $0.compare($1, locale: NSLocale.current) == .orderedAscending }
    print(listaDeColaboradores)
}

listaDeColaboradores()

print(colaboradores)
