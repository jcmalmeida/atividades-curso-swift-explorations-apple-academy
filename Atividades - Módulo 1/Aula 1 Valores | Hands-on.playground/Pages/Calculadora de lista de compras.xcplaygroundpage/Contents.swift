//: [Previous](@previous)
/*:
 #### Calculadora de lista de compras
 
 Sua mãe pediu que você fosse ao mercado, comprar alguns itens para fazer panquecas e te deu R$ 100,00. Ela mandou essa lista aqui e pediu que você conferisse os preços. Quando você chegou no mercado, descobriu que os itens tinham os seguintes valores:
 
- 1 pacote de farinha de trigo - R$ 3,00
- 1 litro de leite - R$ 3,49
- 12 ovos - R$ 5,79
- 1 litro de óleo - R$ 8,19
- 500 gramas de carne moída - R$ 20,90
- 1 cebola - R$ 1,00
- 1 tomate - R$ 1,50
- 1 lata de extrato de tomate - R$ 2,89
- 1 caixa de creme de leite - R$ 3,79
- 400 gramas de mussarela - R$ 16,59
- 1 pacote de queijo ralado - R$ 5,68
- 2 bananas - R$ 0,60
 
 Faça um programa que some os valores dos itens da lista e depois mostre quanto de troco você levará de volta para sua mãe. Alguns requisitos:
 
 - Faça uma constante para cada item da lista, e o valor contido na variável é o preço.
 - Some todos os itens numa variável e depois mostre a seguinte mensagem: "Sua compra teve um total de R$ \(valor)"
 - Subtraia o seu dinheiro da soma de todos os itens em uma variável para descobrir quanto de troco você levará pra casa.
 - Não esqueça de colocar a informação decimal no dinheiro que sua mãe deu. A variável precisa estar no tipo correto para funcionar.
 - Mostre a seguinte mensagem: "O seu troco é de R$ \(troco)"

 Faça seu programa nas linhas abaixo.
*/
//: [Next](@next)
let dinheiro = 100.00

let farinha = 3.00
let leite = 3.49
let ovos = 5.79
let oleo = 8.19
let carne = 20.90
let cebola = 1.00
let tomate = 1.50
let extratoTomate = 2.89
let cremeLeite = 3.79
let mussarela = 16.59
let queijoRalado = 5.68
let bananas = 0.60

var valorCompra = farinha + leite + ovos + oleo + carne + cebola + tomate + extratoTomate + cremeLeite + mussarela + queijoRalado + bananas
print("Sua compra teve um total de R$ \(valorCompra)")

var troco = dinheiro - valorCompra
print("O seu troco é de R$ \(troco)")


