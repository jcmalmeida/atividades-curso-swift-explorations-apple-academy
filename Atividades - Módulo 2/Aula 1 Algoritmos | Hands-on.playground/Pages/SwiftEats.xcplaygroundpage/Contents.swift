//: [Previous](@previous)
/*:
 # SwiftEats
 
 Todo mundo já usou, ou já ouviu falar dos aplicativos de pedir comida. E todo mundo sabe (ou já ouviu falar) que esses aplicativos tiveram um [crescimento enorme na pandemia](https://www.cnnbrasil.com.br/business/gastos-com-aplicativos-de-comida-crescem-38-na-pandemia/).
 
 Apesar desses apps terem muitas outras funcionalidades, a base dele (olhar cardápio, escolher comida e ver o valor a ser pago) é muito simples. E é isso que você vai fazer agora. Atenção para os direcionamentos:
 
 - Você precisará de uma função que recebe o nome do restaurante. E a partir dele retorna para o usuário uma lista de produtos. Essa lista precisa estar impressa no console, abaixo do código (usando o comando print).
 - Depois da lista, você deverá ter uma outra função que recebe os produtos que o usuário selecionou e retorna o valor a ser pago, que também deve estar impressa no console.
 - Para esse desafio, você terá que pensar no nome dos restaurantes e seus produtos. Pense em dois restaurantes com 5 produtos pagos. Lembrando que os preços devem ser quebrados, nada de arredondar!
 - Ao final da execução, o cliente deve receber a seguinte mensagem: "Obrigado por comprar no \(restaurante). Sua compra ficou em um total de R$\(valor)."
 */
func apresentaMenu(do restauranteEscolhido: String) {
    if restauranteEscolhido == "Lanchonete do Tio Zé" {
        print("Menu de opções da Lanchonete do Tio Zé:\n1 - Hamburguer - R$ 12.90\n2 - X-Salada - R$ 13.90\n3 - X-bacon - R$ 15.90\n4 - X-ovo - R$ 15.90\n5 - Vegburguer - R$ 14.90\n")
    } else if restauranteEscolhido == "Pizzaria da Vó Nina" {
        print("Menu de opções da Pizzaria da Vó Nina:\n1 - Pizza de Queijo - R$ 31.90\n2 - Pizza de Frango e Catupiry - R$ 45.90\n3 - Pizza de Calabresa - R$ 43.90\n4 - Pizza Portuguesa - R$ 47.90\n5 - Pizza de Rúcula com Tomate Seco - R$ 44.90\n")
    } else {
        print("Por favor, escolha um dos 2 restaurantes disponíveis!")
    }
}

func pedirProdutos(restauranteEscolhido: String, codigoDoProdutoEscolhido1: Int, codigoDoProdutoEscolhido2: Int, codigoDoProdutoEscolhido3: Int) {
    
    var totalDaCompra = 0.00
    
    // Soma os valores dos produtos com base nas 3 escolhas feitas pelo consumidor
    // Assumimos que o consumidor irá escolher 3 produtos diferentes
    if restauranteEscolhido == "Lanchonete do Tio Zé" {
        if codigoDoProdutoEscolhido1 == 1 || codigoDoProdutoEscolhido2 == 1 || codigoDoProdutoEscolhido3 == 1 {
            totalDaCompra += 12.90
        }
        if codigoDoProdutoEscolhido1 == 2 || codigoDoProdutoEscolhido2 == 2 || codigoDoProdutoEscolhido3 == 2 {
            totalDaCompra += 13.90
        }
        if codigoDoProdutoEscolhido1 == 3 || codigoDoProdutoEscolhido2 == 3 || codigoDoProdutoEscolhido3 == 3 {
            totalDaCompra += 15.90
        }
        if codigoDoProdutoEscolhido1 == 4 || codigoDoProdutoEscolhido2 == 4 || codigoDoProdutoEscolhido3 == 4 {
            totalDaCompra += 15.90
        }
        if codigoDoProdutoEscolhido1 == 5 || codigoDoProdutoEscolhido2 == 5 || codigoDoProdutoEscolhido3 == 5 {
            totalDaCompra += 14.90
        }
    }
    if restauranteEscolhido == "Pizzaria da Vó Nina" {
        if codigoDoProdutoEscolhido1 == 1 || codigoDoProdutoEscolhido2 == 1 || codigoDoProdutoEscolhido3 == 1 {
            totalDaCompra += 31.90
        }
        if codigoDoProdutoEscolhido1 == 2 || codigoDoProdutoEscolhido2 == 2 || codigoDoProdutoEscolhido3 == 2 {
            totalDaCompra += 45.90
        }
        if codigoDoProdutoEscolhido1 == 3 || codigoDoProdutoEscolhido2 == 3 || codigoDoProdutoEscolhido3 == 3 {
            totalDaCompra += 43.90
        }
        if codigoDoProdutoEscolhido1 == 4 || codigoDoProdutoEscolhido2 == 4 || codigoDoProdutoEscolhido3 == 4 {
            totalDaCompra += 47.90
        }
        if codigoDoProdutoEscolhido1 == 5 || codigoDoProdutoEscolhido2 == 5 || codigoDoProdutoEscolhido3 == 5 {
            totalDaCompra += 44.90
        }
    }
    
    print("Obrigado por comprar na \(restauranteEscolhido). Sua compra ficou em um total de R$\(totalDaCompra).")
    
}

// Constante usada para indicar o restaurante escolhido
let restauranteEscolhido = "Lanchonete do Tio Zé"

apresentaMenu(do: restauranteEscolhido)

// Assumimos que o cliente escolherá até 3 opções diferentes dentro do menu do restaurante. Acima disso, o código ficaria extenso demais e talvez valesse a pena usar vetores
var codigoDoProdutoEscolhido1 = 1
var codigoDoProdutoEscolhido2 = 3
var codigoDoProdutoEscolhido3 = 5

// Calcula e apresenta o valor total da compra considerando os produtos escolhidos
pedirProdutos(restauranteEscolhido: restauranteEscolhido, codigoDoProdutoEscolhido1: codigoDoProdutoEscolhido1, codigoDoProdutoEscolhido2: codigoDoProdutoEscolhido2, codigoDoProdutoEscolhido3: codigoDoProdutoEscolhido3)

//: [Next](@next)


