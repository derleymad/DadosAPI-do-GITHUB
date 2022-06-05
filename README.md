# Mineração de Repositórios GitHub

## Demo:
<img src="https://github.com/derleymad/data-github/blob/master/Relat%C3%B3rio/icones/Screenshot%20from%202021-03-26%2012-59-35.png?raw=true">

## Da coleta:
### 1 – Objetivos:
O projeto principal tem de interesse **usar a API do GitHub**, e fazer a **coleta**, dentre um filtro indicado nos
repositórios, das 5 principais linguagens Java, C, Python, Ruby, Javascript, e os 200 autores
com as maiores contribuições por Pull Requests daquele repositório.

### 2 – Procedimentos Experimentais:
De início, para o desenvolvimento do script,
foi usado o shell do linux, em um ambiente simulado para emulação de computador em
mobile. Porém, a exclusão deste, faz-se possível repetir o mesmo resultado. De forma
arbitraria, foi escolhido um ponto de partida, e em seguida, obedecendo a filtragem dos
repositórios com *x > 1000* estrelas que contenha ao menos *200 Pull Requests* como Closed,
foram selecionados 4 repositórios de cada uma das seguintes linguagens:
```
1. Java;
2. C;
3. Python;
4. Ruby;
5. Javascript.
```

As requisições aos repositórios, e toda a documentação teórica e semi prática é possível ser
encontrada no site da [API REST](https://docs.github.com/pt/rest). Na aba de Pull Requests, tem-se uma relação
de links e parâmetros que serão usados com importância no projeto. São alguns deles State,
os quais podem ser open , *closed ou all*, será escolhido o closed para filtrar apenas os Pull
Requests em estado *“fechado”*. A ordem esta, por padrão, dos mais recentes (created). Mais
a frente será necessário ainda, para obter os 200 colaboradores exatos, mais dois parâmetros
o *per_page e page* . É necessário lembrar, que para futura analise de dados obtidos, será
usado a extensão *.csv*, que são basicamente dados separados por virgulas (e podem ser
facilmente analisados no Excel por exemplo) .

### 4 – Resultados e Discussão:
Pode-se notar, nos repositórios, que foi pensado a manipulação automática de um
arquivo os quais erão feitas as requisições pelo comando *curl* (binário para fazer requisições). Após criado o *repositorios.txt*, no qual estão ordenados e prontos como : os
donos, repositórios e respectivas linguagens:

```
Ex.: Linguagem dono nome_do_repositório
```
**1. Das amostras obtidas:**

```
JAVA iluwatar java-design-patterns
JAVA elastic elasticsearch
JAVA spring-projects spring-boot
JAVA ReactiveX RxJava
C torvalds linux
C netdata netdata
C redis redis
C git git
PYTHON donnemartin system-design-primer
PYTHON public-apis public-apis
PYTHON TheAlgorithms Python
PYTHON vinta awesome-python
RUBY rails rails
RUBY jekyll jekyll
RUBY discourse discourse
RUBY fastlane fastlane
JAVASCRIPT freeCodeCamp freeCodeCamp
JAVASCRIPT vuejs vue
JAVASCRIPT facebook react
JAVASCRIPT twbs bootstrap
```
Com todas as amostras necessárias no arquivo de texto, agora basta a criação de um script
autossuficiente que manipule cada linha , faça as requisições, filtragem e gere os *.csv* como
nomes próprios, toma-se o exemplo do primeiro item da lista:

*java_iluwatar_java-design-patterns.csv*

Ao final, serão coletados 20 arquivos iguais a este, 4 de cada linguagem (*5).