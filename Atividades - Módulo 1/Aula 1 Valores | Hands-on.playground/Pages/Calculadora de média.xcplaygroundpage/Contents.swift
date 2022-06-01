/*:
 #### Calculadora de média
 
 Imagine que você é um professor, e precisa de uma maneira fácil de calcular a média dos seus alunos no fim do ano. A escola divide a avaliação em 4 etapas, então para calcular a média, você vai precisar somar as 4 notas e depois dividir por 4.
  
  Para testar, você pode usar as notas do João:
 
 - 1ª etapa: 6.5
 - 2ª etapa: 8.3
 - 3ª etapa: 4.0
 - 4ª etapa: 7.0
 
 As notas são constantes, visto que elas não mudam durante a execução, agora a média é uma variável que pode mudar durante a execução do programa.
  
  Depois da média calculada, lembre-se de gerar o seguinte aviso para o João:
  "Oi João, sua nota desse ano foi \(mediaAluno)"
 
 Faça seu programa nas linhas abaixo.
 */
//: [Next](@next)
let etapa1 = 6.5
let etapa2 = 8.3
let etapa3 = 4.0
let etapa4 = 7.0

var media = (etapa1 + etapa2 + etapa3 + etapa4) / 4

print("Oi João, sua nota desse ano foi \(media)")
