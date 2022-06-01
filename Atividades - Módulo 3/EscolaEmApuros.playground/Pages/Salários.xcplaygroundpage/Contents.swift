/*:
## Salários.
 
 Uma parte muito importante do sistema que irá gerenciar as escolas municipais é a parte que controla os salários.
 
 Como diria os Mamonas Assassinas:
 
 > *Money*.
 >
 > Que é *good* **nóis** *no have*.
 
 Você precisa ser capaz de realizar um somatório de salários.
 
 **[DESAFIO]** Como você realizaria o somatório abaixo?
 */

let primeiroSalario = 1000
let segundoSalario  = 2000
let terceiroSalario = 3000
let quartoSalario   = 2500

var somatorio = 0

// A resposta esperada do somatório é 8500!
somatorio = primeiroSalario + segundoSalario + terceiroSalario + quartoSalario
/*:

 Ótimo! Você aprendeu a realizar a soma através das variáveis!
 
 Porém, somar variáveis é um caso pouco provável de acontecer em um sistema com vários salários.
 
 É mais provável que você tenha acesso a uma lista (Array) de salários.
 
 **[DESAFIO]** Sendo assim, como você realizaria os somatórios abaixo?
 
 > Dica: Você pode usar um *for* para isso.
 */
print("Somatório com for:\n")
// Somatório = 8500
let salarios1 = [1000, 2000, 3000, 2500]
// Seu somatório aqui!
var somatorio1 = 0
for posicao in 0..<salarios1.count {
    somatorio1 += salarios1[posicao]
}
print("Somatório 1 = \(somatorio1)")

// Somatório = 5010
let salarios2 = [3000, 1500, 500, 10]
// Seu somatório aqui!
var somatorio2 = 0
for posicao in 0..<salarios2.count {
    somatorio2 += salarios2[posicao]
}
print("Somatório 2 = \(somatorio2)")

// Somatório = 55500
let salarios3 = [8500, 10000, 13000, 24000]
// Seu somatório aqui!
var somatorio3 = 0
for posicao in 0..<salarios3.count {
    somatorio3 += salarios3[posicao]
}
print("Somatório 3 = \(somatorio3)")

// Somatório = 2500
let salarios4 = [2500]
// Seu somatório aqui!
var somatorio4 = 0
for posicao in 0..<salarios4.count {
    somatorio4 += salarios4[posicao]
}
print("Somatório 4 = \(somatorio4)")

// Somatório 71670
let salarios5 = [1000, 200, 6000, 70, 4000, 100, 40000, 8000, 10000, 2300]
// Seu somatório aqui!
var somatorio5 = 0
for posicao in 0..<salarios5.count {
    somatorio5 += salarios5[posicao]
}
print("Somatório 5 = \(somatorio5)")
/*:
Legal, mas... ninguém quer ficar repetindo todas essas linhas de código para realizar um somatório, não é mesmo?
 
 Que tal a gente transformar isso em uma *function*?
 
 **[DESAFIO]** Transformar o somatório em uma *function*!
 
 > Dica:
 >
 > Talvez você tenha algo como *func somatorioDeSalarios(salarios: [Double]) -> Double*.

*/

// Sua função aqui!
// Você pode usar as variáveis declaradas anteriormente!
func somatorioDeSalarios(salarios: [Int]) -> Int {
    var somatorio = 0
    for posicao in 0..<salarios.count {
        somatorio += salarios[posicao]
    }
    return somatorio
}

var novoSomatorio = 0
novoSomatorio = somatorioDeSalarios(salarios: salarios1)
print("\nSomatório com função:\n")
print("Somatório 1 = \(novoSomatorio)")
novoSomatorio = somatorioDeSalarios(salarios: salarios2)
print("Somatório 2 = \(novoSomatorio)")
novoSomatorio = somatorioDeSalarios(salarios: salarios3)
print("Somatório 3 = \(novoSomatorio)")
novoSomatorio = somatorioDeSalarios(salarios: salarios4)
print("Somatório 4 = \(novoSomatorio)")
novoSomatorio = somatorioDeSalarios(salarios: salarios5)
print("Somatório 5 = \(novoSomatorio)")
/*:
 Feito todos esses somatórios, é hora de avançarmos para a próxima lição!
 
 [Anterior: Introdução](@previous) | Página 2 de 6  |  [Na sequência: Cargos](@next)
 */
