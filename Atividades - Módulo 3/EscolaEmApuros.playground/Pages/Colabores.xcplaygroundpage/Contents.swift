/*:
 ## Colaboradores.
 
 Ah, a parte mais divertida do sistema!
 
 Chegou o momento de criarmos os nossos colaboradores.
 
 Todos os colaboradores da escola possuem 4 propriedades:
 
 - Nome
 - Matrícula
 - Salario
 - Cargo
 
 **[DESAFIO]** Como você organizaria essa estrutura?
 
 > Dica: Você pode tanto usar *struct* como *class* para isso.
 
 Não há certo ou errado quanto a escolha entre *struct* e *class*, mas eu recomendaria *struct* já que não estamos usando os recursos de uma *class* (herança, passagem por referência, etc.)
 
 Abaixo, segue um exemplo de como seria um *struct* para representar uma pessoa ✨.
 */

enum Profissao {
    case bombeiro, policial, medico, arquiteto, estudante, professor
}

struct Pessoa {
    let nome: String
    let CPF: String
    let profissao: Profissao
}

let renan = Pessoa(nome: "Renan", CPF: "123.456.789-10", profissao: .professor)

// Seu struct aqui!
enum Cargo {
    case monitor, professor, coordenador, diretor, assistente
}

struct Colaborador {
    let nome: String
    let matricula: Int
    let salario: Float
    let cargo: Cargo
}

let joao = Colaborador(nome: "João", matricula: 123, salario: 20000, cargo: .diretor)
/*:
 Excelente!
 
 Agora que temos um *struct* para representar um colaborador, que tal colocarmos algumas funcionalidades para ele?
 
 Uma das demandas da escola é que o colaborador seja capaz de se apresentar, seguindo o seguinte modelo de frase:
 
 -> "Meu nome é **NOME**, sou **CARGO** e minha matrícula é **MATRÍCULA**"
 
 **[DESAFIO]** Como você organizaria essa estrutura com essa funcionalidade?
 
 Abaixo, segue um exemplo de como seria um *struct* para representar um turista que sabe se apresentar ✨.
 */

enum Nacionalidade {
    case canadense, brasileiro, portugues, espanhol, italiano
}

struct Turista {
    let nome: String
    let nacionalidade: Nacionalidade
    
    func bandeira() -> String {
        switch nacionalidade {
        case .canadense:
            return "🇨🇦"
        case .brasileiro:
            return "🇧🇷"
        case .portugues:
            return "🇵🇹"
        case .espanhol:
            return "🇪🇸"
        case .italiano:
            return "🇮🇹"
        }
    }
    
    func seApresentar() -> String {
        return "Meu nome é \(nome), e a bandeira da minha nacionalidade é \(bandeira())"
    }
}

let gringo = Turista(nome: "Chris", nacionalidade: .canadense)
gringo.seApresentar()

// Seu struct aqui!
// Como a struct Colaborador anterior já estava criada, não seria possível usar o mesmo nome, então optei por adicionar o número 2
struct Colaborador2 {
    let nome: String
    let matricula: Int
    let salario: Float
    let cargo: Cargo
    
    func seApresentar() {
        print("Meu nome é \(nome), sou \(cargo) e minha matrícula é \(matricula).")
    }
}

let john = Colaborador2(nome: "John", matricula: 456, salario: 30000, cargo: .diretor)
john.seApresentar()
/*:
Feito seu *struct* que sabe se apresentar, vamos seguir para a próxima etapa!

[Anterior: Cargos](@previous) | Página 4 de 6  |  [Na sequência: Sistemas](@next)
*/
