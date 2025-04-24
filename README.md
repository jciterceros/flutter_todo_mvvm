## Flutter Todo MVVM

Este projeto é um aplicativo de lista de tarefas (Todo) desenvolvido em Flutter, utilizando o padrão de arquitetura MVVM (Model-View-ViewModel). Ele foi projetado para ser modular, escalável e fácil de manter.

### Diagrama de Classes

Abaixo está o diagrama de classes do projeto, representado em PlantUML:

<p align="center">
    <a href="https://github.com/jciterceros/flutter_todo_mvvm/blob/015a85d5182bf3285f9344d7425775e9e22486ba/docs/diagram.png" target="blank">
        <img src="https://github.com/jciterceros/flutter_todo_mvvm/blob/015a85d5182bf3285f9344d7425775e9e22486ba/docs/diagram.png" width="400" alt="Class Diagram" />
    </a>
</p>

### Estrutura do Projeto

A estrutura do projeto segue as melhores práticas para o padrão MVVM:

```
flutter_todo_mvvm/
├── lib/
│   ├── models/          # Modelos de dados
│   ├── viewmodels/      # Lógica de negócios e estado
│   ├── views/           # Interfaces de usuário
│   ├── services/        # Serviços (ex.: API, banco de dados)
│   ├── utils/           # Utilitários e helpers
│   └── main.dart        # Ponto de entrada do aplicativo
├── test/                # Testes unitários e de widget
├── pubspec.yaml         # Configurações e dependências do Flutter
└── README.md            # Documentação do projeto
```

### Funcionalidades

- Adicionar, editar e excluir tarefas.
- Marcar tarefas como concluídas.
- Persistência de dados local.
- Interface amigável e responsiva.

### Como Usar a Aplicação
1. Abra o aplicativo em um emulador ou dispositivo físico.
2. Na tela inicial, você verá uma lista de tarefas.
3. Preencha os detalhes da tarefa.
4. Toque no botão "+" para adicionar uma nova tarefa.
5. Marque as tarefas como concluídas tocando na caixa de seleção ao lado da tarefa.
6. Toque no botão a diretita para exluir a tarefa finalizada.

### Dependências
O projeto utiliza as seguintes dependências principais:
- `provider`: Para gerenciamento de estado.
- `foundation`: Para funcionalidades básicas do Flutter.
- `cupertino_icons`: Para ícones do iOS.

### Requisitos

- Flutter SDK 3.x ou superior.
- Dart 2.18 ou superior.

### Como Executar

1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/flutter_todo_mvvm.git
    cd flutter_todo_mvvm
    ```

2. Instale as dependências:
    ```bash
    flutter pub get
    ```

3. Execute o aplicativo:
    ```bash
    flutter run
    ```

### Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

### Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.