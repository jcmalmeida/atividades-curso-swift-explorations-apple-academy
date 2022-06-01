/*:
## Xcode.
 
 A prefeitura de Townsville te dá os parabéns pela conclusão do treinamento.
 
 Agora que você já é uma pessoa Jedi completa, é hora de você fazer o real desafio no Xcode!
 
 No template que vocês vão baixar, a *User Interface* já estará feita.
 
 Será necessário que você transporte o seu sistema gerenciador de escolas (parcialmente ou totalmente feito aqui no *Playgrounds*) para lá!
 
 Abaixo, segue a descrição completa do sistema que a prefeitura necessita.
 
 > Toda **ESCOLA** possui **COLABORADORES**.
 >
 > Todos os **COLABORADORES** possuem **NOME**, **MATRÍCULA**, **SALÁRIO** e **CARGO**.
 >
 > -> Os **CARGOS** disponíveis são: **MONITOR**, **PROFESSOR**, **COORDENADOR**, **DIRETOR** e **ASSISTENTE**.
 >
 > -> A **MATRÍCULA** é uma propriedade única (ID), ou seja, não se repete (como um CPF).
 >
 > -> O **SALÁRIO** pode conter qualquer valor (crise pra quem?), mas o maior salário deve ser sempre o do **DIRETOR**.
 >
 > -> A **ESCOLA** não pode ter mais do que um **DIRETOR**.
 >
 > -> A **ESCOLA** não pode ter mais **COORDENADORES** do que **PROFESSORES**.
 >
 > Todas os **COLABORADORES** devem ser capazes de:
 >
 > - Se apresentar dizendo nome, matrícula e cargo (Ex: "Meu nome é **NOME**, sou **CARGO** e minha matrícula é **MATRÍCULA**").
 > - Se apresentar dizendo cargo abreviado e nome (Ex: Eu sou Dir. Renan)
 >    - Monitor = Mntr.
 >    - Professor = Prof.
 >    - Coordenador = Coord.
 >    - Diretor = Dir.
 >    - Assistente = Asst.
 >
 > A **ESCOLA** deve ser capaz de:
 >
 > - Cadastrar novos colaboradores;
 > - Remover colaboradores através da matrícula;
 >
 > - Listar gastos mensais com todas as pessoas colaboradoras;
 > - Listar gastos mensais por cargo (quanto é gasto com monitor, quanto é gasto com professor, etc.);
 > - Listar quantas pessoas existem por cargo (quantos monitores, quantos professores, etc.);
 > - Listar os nomes de todos os colaboradores em ordem alfabética.
 
 **[DESAFIO]** Implementar esse sistema em um projeto Xcode de verdade!
 
 PS: Tudo bem se quiser implementar e testar aqui antes 😉.
 
 [Anterior: Sistema](@previous) | Página 6 de 6
 */

import Foundation

enum Cargo {
    case monitor, professor, coordenador, diretor, assistente
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Float
    let cargo: Cargo
    
    func apresentacao() {
        print("Meu nome é \(nome), sou \(cargo) e minha matrícula é \(matricula).")
    }
    
    func apresentacaoResumida() -> String {
        var abreviacao = ""
        switch cargo {
        case .monitor:
            abreviacao = "Mntr."
        case .professor:
            abreviacao = "Prof."
        case .coordenador:
            abreviacao = "Coord."
        case .diretor:
            abreviacao = "Dir."
        case .assistente:
            abreviacao = "Asst."
        }
        return "Olá, eu sou o \(abreviacao) \(nome)."
    }
}

var colaboradores: [Colaborador] = []
var salarioDoDiretor: Float = 0
var escolaTemDiretor = false
var numeroDeCoordenadores = 0
var numeroDeProfessores = 0

func cadastrarColaborador(novoColaborador: Colaborador) {
    if escolaTemDiretor && novoColaborador.cargo == .diretor {
        print("\(novoColaborador.nome), desculpe mas a escola já tem diretor.\n")
    } else if !escolaTemDiretor && novoColaborador.cargo == .diretor {
        escolaTemDiretor = true
        salarioDoDiretor = novoColaborador.salario
        colaboradores.append(novoColaborador)
    } else if novoColaborador.cargo == .coordenador && numeroDeProfessores <= numeroDeCoordenadores {
        print("\(novoColaborador.nome), desculpe mas a escola está no limite entre o número de professores e coordenadores.\n")
    } else if novoColaborador.cargo == .coordenador && novoColaborador.salario < salarioDoDiretor {
        numeroDeCoordenadores += 1
        colaboradores.append(novoColaborador)
    } else if novoColaborador.cargo == .professor && novoColaborador.salario < salarioDoDiretor {
        numeroDeProfessores += 1
        colaboradores.append(novoColaborador)
    } else if novoColaborador.salario < salarioDoDiretor {
        colaboradores.append(novoColaborador)
    } else {
        print("\(novoColaborador.nome), o salário pedido é incompatível com a função de \(novoColaborador.cargo).\n")
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
        if numeroDeCoordenadores >= numeroDeProfessores {
            print("No momento, temos \(numeroDeProfessores) professores e \(numeroDeCoordenadores) coordenadores na escola. Esta relação está em desequilíbrio, precisamos de mais professores!\n")
        }
    }
    colaboradores.remove(at: indiceParaDeletar)
}

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

// As funções gastosMensaisPorCargo e quantidadeDePessoasNoCargo podem ser chamadas individualmente, optei apenas por implementar uma função que invoca ambas sequencialmente
func estatisticasDoCargo(de cargo: Cargo) {
    gastosMensaisPorCargo(de: cargo)
    quantidadeDePessoasNoCargo(de: cargo)
}

func listaDeColaboradores() {
    var listaDeColaboradores: [String] = []
    for colaborador in colaboradores {
        listaDeColaboradores.append(colaborador.nome)
    }
    listaDeColaboradores.sort { $0.compare($1, locale: NSLocale.current) == .orderedAscending }
    print(listaDeColaboradores)
}

let john = Colaborador(nome: "John", matricula: 1234, salario: 10000, cargo: .professor)
let marie = Colaborador(nome: "Marie", matricula: 4321, salario: 20000, cargo: .diretor)
let joao = Colaborador(nome: "João", matricula: 1234, salario: 10000, cargo: .professor)
let thais = Colaborador(nome: "Thais", matricula: 5678, salario: 15000, cargo: .coordenador)
let jose = Colaborador(nome: "José", matricula: 9876, salario: 11000, cargo: .professor)
let ana = Colaborador(nome: "Ana", matricula: 1359, salario: 14000, cargo: .coordenador)
let maria = Colaborador(nome: "Maria", matricula: 2468, salario: 10500, cargo: .coordenador)
let anastacia = Colaborador(nome: "Anastácia", matricula: 2468, salario: 30000, cargo: .diretor)
let antonio = Colaborador(nome: "Antônio", matricula: 0000, salario: 9000, cargo: .professor)
let otavio = Colaborador(nome: "Otávio", matricula: 0001, salario: 10000, cargo: .assistente)

cadastrarColaborador(novoColaborador: john)
cadastrarColaborador(novoColaborador: marie)
cadastrarColaborador(novoColaborador: joao)
cadastrarColaborador(novoColaborador: thais)
cadastrarColaborador(novoColaborador: jose)
cadastrarColaborador(novoColaborador: ana)
cadastrarColaborador(novoColaborador: maria)
cadastrarColaborador(novoColaborador: anastacia)
cadastrarColaborador(novoColaborador: antonio)
cadastrarColaborador(novoColaborador: otavio)

listaDeColaboradores()

gastosMensaisTotais()
estatisticasDoCargo(de: .professor)
estatisticasDoCargo(de: .coordenador)
estatisticasDoCargo(de: .diretor)
estatisticasDoCargo(de: .assistente)
estatisticasDoCargo(de: .monitor)

descadastrarColaborador(matricula: 0000)
descadastrarColaborador(matricula: 4321)

listaDeColaboradores()
