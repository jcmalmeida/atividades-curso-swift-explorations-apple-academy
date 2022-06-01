//: [Previous](@previous)
/*:
 #### Gerador de senha
 
 Utilizamos senhas para quase tudo nos dias atuais. E é muito importante que você, como futuro programador, pense com cautela em como proteger seus dados e projetos. Mas criar senhas fortes demanda tempo e criatividade. Separamos algumas dicas pra vocês criarem senhas difíceis de serem adivinhadas.
 
 - A senha deve ser longa: com algo entre 10 ou 12 caracteres
 - Tem que ser difícil de adivinhar: evite sequências como 12345 ou qwerty, e palavras comuns, como a própria palavra "senha"
 - Tem que ter tipos variados de caracteres: Letras maiúsculas e minúsculas, símbolos e números
 - Evitar uso de substituições óbvias de caracteres: como trocar o "O" pelo "0"
 - Use combinações de palavras incomuns ou inesperadas
 - Fácil memorização: não adianta nada ter uma senha segura e esquecer dela, né?
 - Evite o uso de senhas que você já utilizou, tente ao máximo usar senhas originais

 Pensando nisso, você, como um bom programador, vai criar um gerador de senhas. Os requisitos são:
 - Uma constante vai ser o ano em que uma pessoa que você admira muito nasceu.
 - Uma variável é o nome da ferramenta que essa senha vai ser usada, com a primeira e a última letra minúscula (exemplo: fACEBOOk, tWITTEr)
 - Uma variável é um símbolo (exemplo: "!@#$%ˆ&*())
 - Uma constante é a sua comida favorita, com a primeira e a última letra maíuscula (exemplo: LasanhA, PanquecA, MilhO)
 - Depois você vai somar essas variáveis e organiza-las como achar melhor e seu gerador de senha estará pronto
 
 Caso você queira, você pode testar sua senha nesse [site aqui](https://password.kaspersky.com) para garantir que sua senha é resistente.
 
 Faça seu programa nas linhas abaixo.
*/
//: [Next](@next)
let anoNascimento = 1990
var ferramenta = "tWITTEr"
var simbolo = "@"
let comida = "LasanhA"

var senha = "\(comida)\(anoNascimento)\(simbolo)\(ferramenta)"
print(senha)
