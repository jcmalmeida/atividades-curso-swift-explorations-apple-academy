//: [Previous](@previous)
/*:
 # Into the mistery dungeon
 
 Estamos falando muito sobre aplicativos nesse curso, mas como programador você também precisa conhecer o mercado de jogos. Em 2019, a Pesquisa Game Brasil 2020 concluiu que mais de 70% dos brasileiros são adeptos a jogos eletrônicos, sendo que cerca de 86% desses jogadores preferem jogos para celular [(fonte)](https://olist.com/blog/pt/como-vender-mais/inteligencia-competitiva/mercado-de-games-no-brasil/). Com esse mercado em alta, nada mais justo do que aprendermos a fazer um jogo, não?
 
 Vamos então fazer um RPG de texto. Olha os requisitos:
 - Você precisa declarar duas variáveis do tipo bool. Uma para o monstro e outra para a armadilha. No início, as duas sempre serão falsas.
 
 ## Função walk
 - Você precisará de uma função para andar, que receberá uma direção em formato String
 - Dentro da função de andar, se a variável monstro for falsa E a variável armadilha também for falsa:
    - Você precisa conferir a direção que veio junto com a função.
    - O personagem pode andar em quatro direções: esquerda, direita, frente e trás. Atente-se para a escrita, lembre-se que letras maiúsculas, minúsculas e acentos são considerados. Se qualquer um deles for digitado corretamente pelo usuário, você vai dar um comando print com a seguinte mensagem: "Você andou para \(direcao)"
    - Se o usuário digitar qualquer outra coisa que não sejam as direções, você precisa dizer a ele que é uma direção inválida.
 - Agora, se a variável da armadilha for verdadeira:
    - Tem que avisar o usuário que ele precisa desarmar a armadilha usando o comando print.
 - E se nenhuma das opções anteriores acontecerem, significa que existe um monstro na sua frente.
    - Tem que avisar o usuário que ele precisa atacar o monstro, usando também o comando print.
 
 ## Função randomEvent
 - A função randomEvent vai ser utilizada para sortear o evento que acontece assim que o nosso personagem anda. São 3 opções: ele pode dar de cara com um monstro, ver uma armadilha ou pode não acontecer nada.
 - Essa função deve retornar uma String, que será nossa mensagem para o jogador de que algo aconteceu.
 - A primeira coisa que essa função vai fazer é sortear um número inteiro entre 0 e 2
    - Se o número for 0, a variável monstro passa a ser verdadeira e a função retorna um texto avisando que há um monstro a frente.
    - Se o número for 1, a variável da armadilha passa a ser verdadeira e a função retorna um texto avisando que há uma armadilha.
    - Se nenhum dos eventos anteriores for verdadeiro, a função retorna um texto dizendo que o caminho está livre e que podemos continuar.
 
 Deixamos preparadas abaixo mais duas funções que deixam o jogo mais divertido: a de ataque, que mata o monstro e a de desarmar a armadilha, a hora que você terminar é só apagar as barras de comentários :)
 */
import CoreFoundation

var monster = false
var trap = false

func walk(direction: String) {
    // Sorteia evento que acontece assim que o personagem anda
    let event = randomEvent()
    
    // Checa que tipo de evento aconteceu, atualiza as variáveis booleanas e exibe a mensagem ao jogador quando aplicável
    if event == "Há um monstro à frente!" {
        monster = true
        print(event + "Você precisa atacá-lo!")
    } else if event == "Há um armadilha à frente!" {
        trap = true
        print(event + "Você precisa desarmá-la!")
    } else {
        monster = false
        trap = false
    }
    
    // Caso não haja monstro ou armadilha, é preciso validar o movimento do personagem
    if !monster && !trap {
        let lowerDirection = direction.lowercased()
        
        // Checa se a direção do movimento é válida
        if lowerDirection != "esquerda" && lowerDirection != "direita" && lowerDirection != "frente" && lowerDirection != "trás" {
            print("Direção inválida!")
            return
        }
        print("Você andou para \(lowerDirection).")
    }
    
}

// Sorteia evento que acontece assim que o personagem anda
func randomEvent() -> String {
    let eventoAleatorio = Int.random(in: 0..<3)
    
    if eventoAleatorio == 0 {
        return "Há um monstro à frente!"
    } else if eventoAleatorio == 1 {
        return "Há uma armadilha à frente!"
    } else {
        return "O caminho está livre e você pode continuar."
    }
}
//: [Next](@next)
func attack() {
    print("IÁAAAAAA")
    //monster = false
    print("Você matou o monstro!")
}

func disableTrap() {
    print("Essa eu consigo desarmar!")
    //trap = false
    print("Você desarmou a armadilha!")
}

// Gera a defesa adequada em caso de monstro ou armadilha à frente
func defense(monster: BooleanLiteralType, trap: BooleanLiteralType) {
    if monster {
        attack()
    }
    if trap {
        disableTrap()
    }
}

walk(direction: "direita")
defense(monster: monster, trap: trap)
walk(direction: "esquerda")
defense(monster: monster, trap: trap)
walk(direction: "frente")
defense(monster: monster, trap: trap)
walk(direction: "trás")
defense(monster: monster, trap: trap)
