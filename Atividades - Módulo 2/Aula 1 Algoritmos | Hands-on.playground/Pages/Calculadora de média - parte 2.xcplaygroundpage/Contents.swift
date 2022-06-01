/*:
 # Calculadora de média - parte 2
 
 Você lembra daquele programa que fizemos para calcular a média do João na semana passada né? Mas acontece que o professor pediu para que você expandisse aquele programa, pra que ele possa usar com qualquer aluno.
 
 A ideia dele é a seguinte:
 
 - O professor deve inserir o nome do aluno e as notas dos 4 bimestres do aluno ao iniciar o programa
 - O programa deve fazer o cálculo da média das notas
 - Se a média do aluno for maior que 7.5, o aluno está aprovado. Do contrário, o aluno está reprovado.
 - Tendo essas informações, o sistema deve retornar uma mensagem dizendo: "O \(aluno) foi \(aprovacao) com nota \(media)".
 
 Faça seu programa nas linhas abaixo.
 */

let aluno = "José Pedro"
var nota1 = 9.0
var nota2 = 7.5
var nota3 = 5.0
var nota4 = 8.9
var aprovacao = "reprovado"

// Determina o status do aluno em termos de aprovação/reprovação
func determinaStatusDoAluno(media: Double) -> String {
    if (media > 7.5) {
        return "aprovado"
    } else {
        return "reprovado"
    }
}

// Imprime o status final do aluno
func imprimeStatusDoAluno(aluno: String, media: Double, aprovacao: String) {
    print("O \(aluno) foi \(aprovacao) com nota \(media)")
}

// Calcula a média do aluno
var media = (nota1 + nota2 + nota3 + nota4) / 4

aprovacao = determinaStatusDoAluno(media: media)
imprimeStatusDoAluno(aluno: aluno, media: media, aprovacao: aprovacao)
