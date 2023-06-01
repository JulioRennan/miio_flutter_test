
![A4 - 1 (2)](https://github.com/JulioRennan/miio_flutter_test/assets/57741609/2b20eba0-48aa-4106-a8d1-bda60b469fed)

Desafio técnico proposto pela empresa Miio, em que o intuito da implementação é construir um aplicativo, que permita listarmos posts de usuários e filtra-los através de texto utilizando uma fake API. Sendo o foco da avaliação a arquitetura do projeto e conhecimentos nos processos de testes unitários.

## Tabela de Conteúdos
  - [Telas desenvolvidas](#telas-desenvolvidas)
  - [Arquitetura do projeto](#arquitetura-do-projeto)
  - [Pré-requisitos para executar o aplicativo](#pré-requisitos-para-executar-o-aplicativo)
  - [Configuração do ambiente](#configuração-do-ambiente)
  - [Executando o aplicativo](#executando-o-aplicativo)

## Telas desenvolvidas

![Frame 180804](https://github.com/JulioRennan/miio_flutter_test/assets/57741609/d534fe5d-5dd1-4c67-91b5-b715b5997b79)

## Arquitetura do projeto

Como a ideia do aplicativo era representar uma porção de um sistema que poderia ser multidiscplinar/escalável, foi optado por utilizar como base a proposta do clean arch do Reso Coder, que possuí uma alta aderência na comunidade do Flutter.

<p align="center">
  <img src="https://github.com/JulioRennan/miio_flutter_test/assets/57741609/7ea3f647-e75c-41a2-ba39-330d5adf8984" alt="Clean-Architecture-Flutter-Diagram 1">
</p>

Baseado nessa estrutura, foi possível derivar uma arquitetura com objetivo de sanar alguns gaps que se tornaram conhecidos com o tempo, como o uso de downcasting de modelos para entidade. Exposto isso, foi utilizado no projeto a seguinte arquitetura, seguindos os principios estabelicidos pelo Uncle Bob.

<p align="center">
  <img src="https://github.com/JulioRennan/miio_flutter_test/assets/57741609/ec0957da-88d6-4b18-8ab8-c4c9f5eb8404" alt="Clean-Architecture-Flutter-Diagram 1">
</p>

Para tornar possível essa arquitetura de maneira legível a estrutura de pastas, ficou definida do seguinte modo:

 ```
lib
├── app
│   ├─ modules
│   │  ├── name_module
|   │  │   ├── domain -> Responsável pelos usecases, entidades e interfaces de repositories
|   │  │   ├── presentation -> Responsável pela UI
|   |  |   └── data -> Responsável pelos datasources e class concretas dos repositories
|   |      ...
|   |
|   ├── app_widget
|   └── app_injection_container
|
├── data -> Camada de data compartilhada
├── domain -> Camada de dominio compartilhada.
├── core
|   ├── adapters -> Wrappers de packages que compõem regras de negócio.
|   ├── config -> Constants, Flavors e etc;
|   ├── managers -> Gerenciadores de strings, imagens, ícones e invocadores de componentes
|   ├── theme -> Design system da aplicação
|   └── widgets -> Componentes compartilhados
|
└── main.dart -> Run App
```


## Pré-requisitos para executar o aplicativo

- Flutter SDK: versão 3.10.0 ou superior.
- Ambiente de desenvolvimento (IDE) recomendado: Visual Studio Code ou Android Studio.

## Configuração do ambiente

Siga estas etapas para configurar o ambiente de desenvolvimento:

1. Faça o download e a instalação do Flutter SDK em [https://flutter.dev](https://flutter.dev).
2. Instale o Dart SDK a partir do site oficial do Dart em [https://dart.dev/get-dart](https://dart.dev/get-dart).
3. Certifique-se de que o Flutter e o Dart estejam configurados corretamente adicionando-os ao seu PATH de ambiente.
4. Verifique a instalação do Flutter e do Dart executando `flutter doctor` em seu terminal. Este comando fornecerá uma visão geral do estado do seu ambiente e ajudará a identificar possíveis problemas.
5. Instale as dependências do projeto executando `flutter pub get` na raiz do projeto.

## Executando o aplicativo

Siga estas etapas para executar o aplicativo:

1. Abra seu terminal ou IDE preferido na raiz do projeto.
2. Certifique-se de ter um dispositivo Android ou iOS conectado ou um emulador configurado.
3. Execute o comando `flutter run` para compilar e iniciar o aplicativo no dispositivo/emulador.
