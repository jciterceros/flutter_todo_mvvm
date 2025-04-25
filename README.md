## Flutter Todo MVVM

Este projeto é um aplicativo de lista de tarefas (Todo) desenvolvido em Flutter, utilizando o padrão de arquitetura **MVVM** (Model-View-ViewModel) e seguindo os princípios **SOLID** para garantir modularidade, escalabilidade e facilidade de manutenção.

---

### **Diagrama de Classes**

Abaixo está o diagrama de classes do projeto, representado em PlantUML:

<p align="center">
    <a href="https://github.com/jciterceros/flutter_todo_mvvm/blob/f4ce5efb97eef3686ec7793bf609111d0d1fc9dd/docs/diagram_MVVM.png" target="blank">
        <img src="https://github.com/jciterceros/flutter_todo_mvvm/blob/f4ce5efb97eef3686ec7793bf609111d0d1fc9dd/docs/diagram_MVVM.png" width="500" alt="Class Diagram MVVM" />
    </a>
</p>

---

### **Estrutura do Projeto**

A estrutura do projeto segue as melhores práticas para o padrão **MVVM** e princípios **SOLID**:

```
flutter_todo_mvvm/
├── lib/
│   ├── models/          # Modelos de dados
│   │   └── todo.dart
│   ├── viewmodels/      # Lógica de negócios e estado
│   │   └── todo_viewmodel.dart
│   ├── views/           # Interfaces de usuário
│   │   ├── home_view.dart
│   │   └── widgets/
│   │       ├── todo_input.dart
│   │       └── todo_item.dart
│   ├── services/        # Serviços (ex.: API, banco de dados)
│   │   ├── todo_repository.dart
│   │   ├── local_todo_repository.dart
│   │   └── remote_todo_repository.dart (futuro)
│   ├── utils/           # Utilitários e helpers
│   └── main.dart        # Ponto de entrada do aplicativo
├── test/                # Testes unitários e de widget
└── README.md            # Documentação do projeto
```

---

### **Funcionalidades**

- Adicionar, editar e excluir tarefas.
- Marcar tarefas como concluídas.
- Persistência de dados local.
- Interface amigável e responsiva.
- Arquitetura modular e escalável com **MVVM** e **SOLID**.

---

### **Princípios SOLID Aplicados**

1. **Responsabilidade Única (SRP)**:
   - Cada classe tem uma única responsabilidade. Por exemplo, o `TodoViewModel` gerencia o estado e a lógica de negócios, enquanto o `TodoRepository` lida com o acesso aos dados.

2. **Aberto/Fechado (OCP)**:
   - O `TodoRepository` é uma abstração que pode ser estendida com diferentes implementações, como `MockTodoRepository` ou `LocalTodoRepository`.

3. **Substituição de Liskov (LSP)**:
   - As implementações de `TodoRepository` podem substituir a interface sem alterar o comportamento esperado.

4. **Segregação de Interfaces (ISP)**:
   - Interfaces são específicas para o que os clientes precisam. Por exemplo, o `TodoRepository` define métodos claros para manipulação de tarefas.

5. **Inversão de Dependência (DIP)**:
   - O `TodoViewModel` depende da abstração `TodoRepository`, e não de implementações concretas.

---

### **Como Usar a Aplicação**

1. Abra o aplicativo em um emulador ou dispositivo físico.
2. Na tela inicial, você verá uma lista de tarefas.
3. Preencha os detalhes da tarefa.
4. Toque no botão "+" para adicionar uma nova tarefa.
5. Marque as tarefas como concluídas tocando na caixa de seleção ao lado da tarefa.
6. Toque no botão a diretita para exluir a tarefa finalizada.

---

### **Dependências**

O projeto utiliza as seguintes dependências principais:
- `provider`: Para gerenciamento de estado.
- `foundation`: Para funcionalidades básicas do Flutter.
- `cupertino_icons`: Para ícones do iOS.

---

### **Testes Unitarios e Integração**

O projeto inclui testes unitários e de widget para garantir a qualidade do código e o funcionamento correto das funcionalidades. A estrutura de testes está organizada na pasta `test/`:

```
test/
├── integration/
│   └── views/
│       └── home_view_test.dart                 # Teste da tela inicial
└── unit/
    ├── models/
    │   └── todo_test.dart                      # Teste do modelo Todo
    ├── services/
    │   ├── todo_repository_test.dart           # Teste do repositório de tarefas
    │   ├── local_todo_repository_test.dart     # Teste do repositório local
    ├── viewmodels/
    │   └── todo_viewmodel_test.dart            # Teste do ViewModel de tarefas
    └── utils/
        └── logger_test.dart                    # Teste do utilitário de logger

```

#### **Como Executar os Testes**

1. Certifique-se de que todas as dependências estão instaladas:
    ```bash
    flutter pub get
    ```

2. Execute os testes com o seguinte comando:
    ```bash
    flutter test
    ```

3. Para executar testes específicos, forneça o caminho do arquivo de teste:
    ```bash
    flutter test test/caminho/do/arquivo_test.dart
    ```

Os testes cobrem cenários como:
- Validação de dados nos modelos.
- Verificação da lógica de negócios no `TodoViewModel`.
- Renderização correta dos widgets.
- Funcionamento dos repositórios de dados.

---

### **Requisitos**

- Flutter SDK 3.x ou superior.
- Dart 2.18 ou superior.

---

### **Como Executar**

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
---

### **Contribuição**

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

---

### **Licença**

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.