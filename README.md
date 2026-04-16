# 💰 FinControl - Controle Financeiro Inteligente

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-green?style=for-the-badge)

O **FinControl** é um aplicativo multiplataforma desenvolvido para ajudar usuários a gerenciar suas finanças pessoais de forma simples, intuitiva e eficiente. O objetivo é centralizar o controle de despesas, planejamento de orçamentos e organização financeira em uma única plataforma segura e acessível.

---

## 📱 Funcionalidades Principais

O projeto foi arquitetado focado na experiência do usuário e na gestão eficiente de estado. As principais funcionalidades incluem:

- **Autenticação de Usuários (RF001 - RF003):** Fluxo completo de Login, Cadastro de conta e Recuperação de senha com validação robusta de formulários.
- **Dashboard Financeiro (RF004):** Visualização centralizada do saldo atual, receitas, despesas e gráficos analíticos para melhor controle.
- **Registro de Transações (RF005):** Formulário intuitivo para adicionar receitas e despesas com categorização automática, datas e observações.
- **Categorização de Despesas (RF006):** Organização de gastos em categorias personalizáveis (Alimentação, Transporte, Lazer, etc.) para melhor análise.
- **Relatórios e Gráficos (RF007):** Visualização de dados financeiros através de gráficos interativos mostrando tendências de gastos por período.
- **Metas Financeiras (RF008):** Definição e acompanhamento de metas de poupança com progresso visual em tempo real.
- **Perfil do Usuário (RF009):** Gerenciamento de dados pessoais, preferências de idioma e configurações de segurança.

---

## 💻 Tecnologias e Arquitetura

O aplicativo foi construído utilizando as seguintes tecnologias e boas práticas:

* **Linguagem:** Dart
* **Framework:** Flutter (Mobile/Multiplataforma)
* **Gerenciamento de Estado:** `ChangeNotifier` com `Provider` (v6.1.2) - *Garante a atualização reativa das telas (ex: adição de nova transação atualizando instantaneamente o dashboard).*
* **Internacionalização:** Pacote `intl` (v0.20.2) para suporte a múltiplos idiomas e formatação de datas/moedas.
* **Responsividade:** Pacote `device_preview_plus` (v2.6.2) para garantir adaptação perfeita de interface em diversos tamanhos de tela (Smartphones, Tablets e Desktops).
* **Suporte Nativo:** Integração com C++ e Swift para otimização de performance em operações críticas.

### Arquitetura de Plataformas Suportadas

O FinControl foi desenvolvido para funcionar em múltiplas plataformas:
- 📱 **iOS** - Suporte nativo com Swift
- 🤖 **Android** - Suporte completo
- 🌐 **Web** - Acesso via navegador
- 🖥️ **Windows, macOS e Linux** - Versões Desktop

---

## 🎓 Contexto Acadêmico

Este projeto está sendo desenvolvido como parte prática de avaliação acadêmica em um curso de **Desenvolvimento de Aplicações Móveis**. O escopo foca na implementação de interfaces gráficas responsivas, fluxo de navegação intuitivo e gerenciamento eficiente de estado através do padrão Provider.

---

## 📊 Composição do Projeto

A estrutura do projeto conta com:
