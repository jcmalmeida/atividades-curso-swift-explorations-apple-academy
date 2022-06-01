/*:
 ## Sistema.
 
 Agora que você passou por todas as etapas do treinamento, é hora de juntar todas as peças do quebra-cabeça! 🧩
 
 Você já sabe sobre:
 
 - Array (Vetores)
 - Enum
 - Switch
 - Struct/Class
 
 Com esses conhecimentos, você tem o suficiente para montar um sistema para uma escola.
 
 Antes de começarmos, é importante você saber algumas exigências das escolas.
 
 Elas devem ser capazes de:
 
 1. Cadastrar novos colaboradores.
 2. Remover colabores através de sua matrícula.
 -
 3. Listar gastos mensais com todos os colaboradores.
 4. Listar gastos mensais por cargo (quanto é gasto com monitor, quanto é gasto com professor, etc.)
 5. Listar quantas pessoas existem por cargo (quantos monitores, quantos professores, etc.)
 6. Listar os nomes de todos os colaboradores em ordem alfabética.
 
 **[DESAFIO]** Como você faria esse sistema?
 
 Abaixo, segue um exemplo de como seria um sistema similar ao do colégio 🐶.
 */

enum Raca {
    case poodle
    case husky
    case golden
    case labrador
    case caramelo
    
    // Sim! Em Swift, Enum pode conter funções! ❤️
    func nomeFormal() -> String {
        switch self {
        case .poodle:
            return "Poodle"
        case .husky:
            return "Husky Siberiano"
        case .golden:
            return "Golden Retriever"
        case .labrador:
            return "Labrador"
        case .caramelo:
            return "Caramelo"
        }
    }
    
    func possuiMuitoPelo() -> Bool {
        switch self {
        case .poodle, .husky, .golden:
            return true
        case .labrador, .caramelo:
            return false
        }
    }
}

struct Cachorro {
    let identificador: Int
    let nome: String
    let raca: Raca
    let gastoMensal: Double
    
    func descricao() -> String {
        return "Identificador: \(identificador): \(nome) é um cachorro da raça \(raca.nomeFormal()) que possui um gasto mensal de R$\(gastoMensal)."
    }
}

// A class Abrigo é o nosso sistema!
class Abrigo {
    var cachorros: [Cachorro]
    
    init(cachorros: [Cachorro]) {
        self.cachorros = cachorros
    }
    
    // Funcionalidade 1 do sistema da escola
    // Cadastrar novos colaboradores
    func adicionaCachorro(_ cachorro: Cachorro) {
        cachorros.append(cachorro)
    }
    
    // Funcionalidade 2 do sistema da escola
    // Remover colabores através de sua matrícula
    func removeCachorro(comIdentificador identificador: Int) {
        // Solução 1
        // Dificuldade: 🔥
        // Podemos melhorar essa solução...
        for indice in 0..<cachorros.count {
            let cachorro = cachorros[indice]
            if cachorro.identificador == identificador {
                cachorros.remove(at: indice)
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // Já está bom o suficiente
        for (indice, cachorro) in cachorros.enumerated() {
            if cachorro.identificador == identificador {
                cachorros.remove(at: indice)
            }
        }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥
        // Solução um pouco mais "avançada"
        cachorros.removeAll { (cachorro) -> Bool in
            cachorro.identificador == identificador
        }
        
        // Solução 4
        // Dificuldade: 🔥🔥🔥🔥
        // Agora você decolou!!! 🚀
        cachorros.removeAll{ $0.identificador == identificador }
    }
    
    // Funcionalidade 3 do sistema da escola
    // Listar gastos mensais com todos os colaboradores
    func listaGastoMensais() -> Double {
        var gastoTotal: Double = 0
        
        for cachorro in cachorros {
            // Solução 1
            // Dificuldade: 🔥
            let gastoMensal = cachorro.gastoMensal
            gastoTotal = gastoTotal + gastoMensal
            
            // Solução 2
            // Dificuldade: 🔥🔥
            // let gastoMensal = cachorro.gastoMensal
            // gastoTotal += gastoMensal
            
            // Solução 3
            // Dificuldade: 🔥🔥🔥
            // gastoTotal += cachorro.gastoMensal
        }
        
        return gastoTotal
    }
    
    // Funcionalidade 4 do sistema da escola
    // Listar gastos mensais por cargo
    func listaGasto(daRaca raca: Raca) -> String {
        var gastoTotal: Double = 0
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            if cachorro.raca == raca {
                gastoTotal += cachorro.gastoMensal
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // for cachorro in cachorros where cachorro.raca == raca {
        //     gastoTotal += cachorro.gastoMensal
        // }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥🔥🔥🔥🔥🔥🔥
        // gastoTotal = cachorros.map{ $0.gastoMensal }.reduce(0, +)
        
        return "Os gastos com a raça \(raca.nomeFormal()) são de R$\(gastoTotal)."
    }
    
    // Funcionalidade 5 do sistema da escola
    // Listar quantas pessoas existem por cargo
    func listaQuantidadeDeCachorro(daRaca raca: Raca) -> String {
        var quantidadeDeCachorro = 0
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            if cachorro.raca == raca {
                quantidadeDeCachorro += 1
            }
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // for cachorro in cachorros where cachorro.raca == raca {
        //     quantidadeDeCachorro += 1
        // }
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥🔥🔥🔥
        // quantidadeDeCachorro = cachorros.filter{ $0.raca == raca }.count
        
        return "Existe(m) \(quantidadeDeCachorro) cachorro(s) da raça \(raca.nomeFormal())."
    }
    
    // Funcionalidade 6 do sistema da escola
    // Listar os nomes de todos os colaboradores em ordem alfabética
    func listaCachorrosEmOrdemAlfabetica() -> [String] {
        // Primeiro, precisamos pegar todos os nomes de todos os cachorros
        var nomes: [String] = []
        
        // Solução 1
        // Dificuldade: 🔥
        for cachorro in cachorros {
            let cachorroNome = cachorro.nome
            nomes.append(cachorroNome)
        }
        
        // Solução 2
        // Dificuldade: 🔥🔥
        // nomes = cachorros.map{ $0.nome }
        
        // Agora é só ordenar a nossa lista de nomes!
        // Obrigado Swift por já ter uma função para isso 🙏
        nomes.sort()
        
        // Solução 3
        // Dificuldade: 🔥🔥🔥
        // Essa solução já faz tudo
        // .map -> cria um Array de String
        // .sorted() -> ordena o Array
        // nomes = cachorros.map{ $0.nome }.sorted()
        
        return nomes
    }
}

let muitosCachorros: [Cachorro] =
    [
        Cachorro(identificador: 0, nome: "Rex", raca: .caramelo, gastoMensal: 100),
        Cachorro(identificador: 1, nome: "Bob", raca: .labrador, gastoMensal: 50),
        Cachorro(identificador: 2, nome: "Fred", raca: .golden, gastoMensal: 200),
        Cachorro(identificador: 3, nome: "Zeus", raca: .caramelo, gastoMensal: 500),
        Cachorro(identificador: 4, nome: "Babi", raca: .poodle, gastoMensal: 3000),
        Cachorro(identificador: 5, nome: "Xerox", raca: .labrador, gastoMensal: 1500),
        Cachorro(identificador: 6, nome: "Slinky", raca: .poodle, gastoMensal: 2500),
        Cachorro(identificador: 7, nome: "Fancy", raca: .labrador, gastoMensal: 1000),
        Cachorro(identificador: 8, nome: "Britney", raca: .caramelo, gastoMensal: 30),
        Cachorro(identificador: 9, nome: "Panqueca", raca: .golden, gastoMensal: 450),
        Cachorro(identificador: 10, nome: "Tiziu", raca: .golden, gastoMensal: 900),
        Cachorro(identificador: 11, nome: "Simba", raca: .husky, gastoMensal: 700),
        Cachorro(identificador: 12, nome: "Thor", raca: .labrador, gastoMensal: 1300),
        Cachorro(identificador: 13, nome: "Kawaii", raca: .caramelo, gastoMensal: 1200)
    ]

let abrigo = Abrigo(cachorros: muitosCachorros)

// Funcionalidade 1
print(abrigo.listaCachorrosEmOrdemAlfabetica())

let avin = Cachorro(identificador: 14, nome: "Avin", raca: .caramelo, gastoMensal: 300)
abrigo.adicionaCachorro(avin)

print(abrigo.listaCachorrosEmOrdemAlfabetica())
// Você consegue ver que "Avin" agora aparece dentro do print?
// Isso acontece pois o cachorro foi adicionado com sucesso ao abrigo!

// Funcionalidade 2

print(abrigo.listaCachorrosEmOrdemAlfabetica())

abrigo.removeCachorro(comIdentificador: 14)

print(abrigo.listaCachorrosEmOrdemAlfabetica())
// Você consegue ver que "Avin" não aparece mais no print?
// Isso acontece pois o cachorro Rex de identificador 0 foi removido com sucesso do abrigo!

// Funcionalidade 3
print(abrigo.listaGastoMensais())

// Funcionalidade 4
print(abrigo.listaGasto(daRaca: .caramelo))
print(abrigo.listaGasto(daRaca: .poodle))
print(abrigo.listaGasto(daRaca: .husky))
print(abrigo.listaGasto(daRaca: .labrador))
print(abrigo.listaGasto(daRaca: .golden))

// Funcionalidade 5
print(abrigo.listaQuantidadeDeCachorro(daRaca: .caramelo))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .poodle))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .husky))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .labrador))
print(abrigo.listaQuantidadeDeCachorro(daRaca: .golden))

// Funcionalidade 6
print(abrigo.listaCachorrosEmOrdemAlfabetica())
print("\n\n")

// Seu sistema aqui!
// Sistema da escola

// Por padrão, a função sort não ordena adequadamente nomes com acento. Para garantir o ordenamento correto, precisei passar alguns parâmetros para a função sort e, com isso importar a biblioteca Foundation
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

//print(colaboradores)
//print("\n")

//descadastrarColaborador(matricula: 2468)

//print(colaboradores)
//print("\n")

gastosMensaisTotais()
estatisticasDoCargo(de: .professor)
estatisticasDoCargo(de: .coordenador)
estatisticasDoCargo(de: .diretor)
estatisticasDoCargo(de: .assistente)
estatisticasDoCargo(de: .monitor)

listaDeColaboradores()

descadastrarColaborador(matricula: 0000)
descadastrarColaborador(matricula: 4321)
/*:
 [Já acabou, Jéssica?](https://www.otempo.com.br/polopoly_fs/1.1170250.1534206665!httpImage/image.png)
 
Ufa! Esse foi um desafio um tanto quanto longo, mas sobrevivemos.
 
 Porém, o sistema da escola não é tão "simples" assim.
 
 Ele possui algumas regras que precisam ser seguidas.
 
 São elas:
 
 - O SALÁRIO pode conter qualquer valor (crise pra quem?), mas o maior salário deve ser sempre o do DIRETOR.

 - A ESCOLA não pode ter mais do que um DIRETOR.

 - A ESCOLA não pode ter mais COORDENADORES do que PROFESSORES.

**[DESAFIO]** Como você faria acrescentaria essas regras ao seu sistema?
 
 Dessa vez, eu não darei dicas de solução 😉.
 
 *Give your jumps!* (Dá teus pulos)
*/

// Pode incrementar essas regras no seu sistema desenvolvido acima.
// O código acima já contém as regras solicitadas.
/*:
Terminado essa atividade, você está com animação para a próxima etapa?
 
 E vamos de Xcode!

[Anterior: Colaboradores](@previous) | Página 5 de 6  |  [Na sequência: Xcode](@next)
*/
