//: [Previous](@previous)
/*:
 # O aumento
 
 Começo de ano, produtividade alta e um ano inteiro pela frente. Parece um ótimo momento para reconhecer e presentear os funcionários de uma empresa. Mas imagina que chato seria ter que fazer o cálculo um por um?
 
 Pois então, nós programadores temos a solução pra isso. Vamos criar um programa para calcular o aumento dos salários de uma empresa. Olha só os requisitos:
 
 - A função deve receber do usuário o nível do colaborador e o salário anterior. Os dois parâmetros são números inteiros.
 - Na primeira linha, devemos declarar a variável que vai guardar a porcentagem de aumento.
 
 - A empresa dividiu seus funcionários em 3 níveis, sendo que cada um dos níveis tem uma porcentagem diferente de aumento. Então o primeiro passo é conferir qual nível é o do funcionário e trocar o valor da nossa variável da porcentagem, conforme os números abaixo.
         Para o nível 1, o aumento é de 10%.
         Para o nível 2, o aumento é de 20%.
         Para o nível 3, o aumento é de 30%.
         Para todos os outros, o aumento é de 40%.
 
 - Em seguida, vamos calcular o aumento, criando uma nova variável cujo valor será o cálculo que dirá qual é o salário atual (pós aumento) do colaborador.
 - E depois vamos precisar descobrir qual foi a diferença entre o salário anterior e o atual.
 - Por último, você deve informar ao usuário qual era o salário anterior, quanto ele teve de aumento, qual o salário atual e qual foi o valor da diferença.
 
 */
func aumento (nivelDoColaborador: Int, salarioAnterior: Int) {
    var percentualDeAumento = 0.0
    var salarioAtual = 0.0
    var diferencaSalarial = 0.0
    
    // Determina o nível de aumento com base no nível do colaborador
    if nivelDoColaborador == 1 {
        percentualDeAumento = 10.0
    } else if nivelDoColaborador == 2 {
        percentualDeAumento = 20.0
    } else if nivelDoColaborador == 3 {
        percentualDeAumento = 30.0
    } else {
        percentualDeAumento = 40.0
    }
    
    // Calcula o novo salário e a diferença salarial
    // Foi preciso converter o valor Inteiro do salário anterior para Double para conseguir efetuar o cálculo
    salarioAtual = Double(salarioAnterior) + Double(salarioAnterior) * percentualDeAumento / 100
    diferencaSalarial = salarioAtual - Double(salarioAnterior)
    
    print("O salário anterior do funcionário era de R$ \(salarioAnterior), o aumento recebido foi de \(percentualDeAumento)%, resultando no salário atual de R$ \(salarioAtual), uma diferença de valor de R$ \(diferencaSalarial)")
}

// Aumento de salário do funcionário John, um verdadeiro destaque no time de desenvolvimento
aumento(nivelDoColaborador: 4, salarioAnterior: 4000)
//: [Next](@next)
