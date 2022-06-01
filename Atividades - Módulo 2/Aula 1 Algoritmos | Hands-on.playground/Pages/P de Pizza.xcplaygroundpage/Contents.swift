//: [Previous](@previous)
/*:
 # P de Pizza
 
 Imagine que você é um pizzaiolo, e tem que gerenciar o fluxo de pedidos e produção de pizzas da sua pizzaria. Mas além disso, decidiu contar quantas pizzas você faz por noite.
 
 Fizemos grande parte do trabalho, mas nesse código está faltando a parte interna de uma das funções. Aqui estão os requisitos dela:
 
 - Você vai criar uma variável que vai gerar um número aleatório entre 0 e 2
 - Depois vai criar uma variável para guardar o nome do recheio, e vai dizer que ela vale "" (sim, vazio mesmo)
 
 - Em seguida, você vai precisar conferir o valor da variável do número aleatório e atribuir os valores ao recheio. Ex: se random for 1, o recheio é tomate.
 - No final da função, você irá usar o comando print para detalhar o pedido do cliente e retornar o valor de recheio.
 - Ao terminar, descomente a função e teste.
 */

//: [Next](@next)
var score = 0
var pizza: String
var recheio = ""

// Função para o qual o código foi gerado e que gera um recheio a partir de um número aleatório
func gerarPedido() -> String {
    let random = Int.random(in: 0..<3)
    var recheio = ""
    
    if random == 0 {
        recheio = "presunto"
    } else if random == 1 {
        recheio = "tomate"
    } else {
        recheio = "cogumelo"
    }
    
    print("O cliente receberá uma pizza com recheio de \(recheio)")
    
    return recheio
}

func montarPizza(de pedido: String) -> String {
    let massa = ("    queijoqueijo\nmolhomolhomolhomolho\nmassamassamassamassa\n")
    var recheio = ""
    
    if pedido == "tomate" {
        recheio = "\n       tomate\n"
    } else if pedido == "presunto" {
        recheio = "\n      presunto\n"
    } else if pedido == "cogumelo" {
        recheio = "\n      cogumelo\n"
    }
    
    let pizza = recheio + massa
    return pizza
}

func darPontos(pizza: String, recheio: String) {
    score += 1
    print(score)
}

recheio = gerarPedido()
pizza = montarPizza(de: recheio)
darPontos(pizza: pizza, recheio: recheio)

recheio = gerarPedido()
pizza = montarPizza(de: recheio)
darPontos(pizza: pizza, recheio: recheio)

recheio = gerarPedido()
pizza = montarPizza(de: recheio)
darPontos(pizza: pizza, recheio: recheio)
