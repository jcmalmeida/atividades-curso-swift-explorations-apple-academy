//: [Previous](@previous)
/*:
 #### Gerador de convite
 
 Imagine que você é um organizador de eventos e por isso precisa sempre gerar convites com informações personalizadas. Nós vamos criar um gerador de convites, mas antes você precisa de algumas orientações e requisitos:
 
 - Tem que existir uma variável que deixe claro o tipo de evento, se é uma reunião, um aniversário, um casamento.
 - Tem que existir uma variável em texto que diga a data. O formato da escrita (ex: 24/01 ou 24 de janeiro) você mesmo decide.
 - Tem que existir uma variável com o horário (o formato novamente você decide)
 - Tem que existir uma variável de endereço
 
 Depois de definir todas essas questões, você precisa gerar a seguinte mensagem constante no final:
 "Você foi convidado para \(evento), que acontecerá no dia \(dia) às \(horas) no seguinte endereço: \(endereço). Nos vemos lá."
 
 Faça seu programa nas linhas abaixo.
*/
//: [Next](@next)
let tipoEvento = "aniversario"
let dataEvento = "1o de julho"
let horarioEvento = "11:00"
let enderecoEvento = "Chacara do Antonio - Rua Dona Florinda, 71"

print("Você foi convidado para \(tipoEvento), que acontecerá no dia \(dataEvento) às \(horarioEvento) no seguinte endereço: \(enderecoEvento). Nos vemos lá.")
