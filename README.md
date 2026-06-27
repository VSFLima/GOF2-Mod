# GOF2 Mod — Repositório de Modificações

## Sobre o Jogo
- **Jogo**: Galaxy on Fire 2 HD v2.0.16
- **Pacote**: `net.fishlabs.gof2hdallandroid2012`
- **Engine**: AbyssEngine (C++ nativo — toda lógica do jogo está no .so)
- **Arquitetura**: ARM 32-bit (armeabi-v7a), modo Thumb
- **Biblioteca nativa**: `lib/armeabi-v7a/libgof2hdaa.so` (2.18 MB, 2.500+ funções)
- **Plataforma**: Samsung Galaxy Note 10 Plus, Android 12
- **Tipo**: Jogo OFFLINE — sem anti-ban, sem servidor, sem validação online

## Estrutura do Repositório
```
GOF2-Mod/
├── builds/                        ← APKs compilados e prontos para instalar
├── backups/                       ← APKs originais sem modificação
├── decompiled/                    ← Arquivos fonte para edição
│   ├── libgof2hdaa_original.so    ← Biblioteca nativa original (backup)
│   ├── ships.bin                  ← Dados das naves (stats modificados para 9999)
│   ├── items.bin                  ← Dados dos itens/mercadorias
│   ├── GooglePlayIAP.smali        ← Código de DLCs e compras
│   └── Security.smali             ← Verificação de compras
├── scripts/
│   ├── build.sh                   ← Compila o APK e assina com chave de debug
│   ├── install.sh                 ← Instala no celular preservando OBB e saves
│   └── patch.sh                   ← Aplica todas as modificações no código fonte
└── README.md                      ← Este arquivo
```

---

## Builds Disponíveis

| Nº | Arquivo | Descrição | Mods Ativos | Data |
|----|---------|-----------|-------------|------|
| 001 | build_001_smali_mods.apk | Primeira versão com mods smali | DLC desbloqueado, compras verificadas, stats 9999 | 2026-06-26 |

---

## Mods Implementados

### ✅ Mods Funcionando

| Mod | O que faz | Arquivo alterado | Como funciona |
|-----|-----------|------------------|---------------|
| DLC 1-5 Desbloqueado | Libera todos os DLCs (Supernova, Valkyrie, Kaamo Club) | GooglePlayIAP.smali | Muda as flags DLC_X_BOUGHT de false para true |
| Compras Sempre Verificadas | Qualquer compra é aceita sem verificar com o Google | Security.smali | A função verifyPurchase() sempre retorna true (1) |
| Stats das Naves 9999 | Todas as naves têm HP, escudo, dano, carga etc em 9999 | ships.bin | Substitui os valores originais (100, 150, 200, 250) por 9999 |

### ⏳ Mods em Desenvolvimento

| Mod | O que faz | Função alvo no .so | Status |
|-----|-----------|-------------------|--------|
| God Mode | Jogador não recebe dano | Player::update (0x0a4110) | Testando code cave |
| Hit Kill | Inimigos morrem com 1 tiro | Player::damage (0x0a3694) | Pendente |
| Carga Infinita | Nave não fica pesada | Ship::getCargoCapacity (0x174c38) | Pendente |
| Todas as Naves | Todas disponíveis na Kaamo Club | Station::hasShip (0x0a6e7c) | Pendente |
| Invisível | Inimigos não veem o jogador | KIPlayer targeting | Pendente |
| Atravessar Asteroides | Sem colisão com asteroides | Level::collide (0x0c455a) | Pendente |
| Créditos Infinitos | Dinheiro infinito | TBD | Pendente |
| Nível Máximo | Level máximo | TBD | Pendente |

---

## Mapa Completo de Funções do .so

### PlayerEgo — O Personagem do Jogador

PlayerEgo é a classe que controla a nave do jogador. Ela herda de Player.
Todas as funções de movimento, tiro, dano e renderização ficam aqui.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x0998cc    2008B     CONSTRUTOR — Cria o jogador, inicializa stats, posiciona no mapa
0x09a0a4    338B      DESTRUTOR — Limpa memória ao sair do jogo/morrer
0x09a274    600B      CONFIGURAÇÃO — Define posição, rotação, estado inicial
0x09aea4    92B       BOOST — Ativa o boost de velocidade da nave
0x09b03a    14B       MORRER — Processa a morte do jogador
0x09b198    260B      ATIRAR — Comando de disparo do jogador
0x09b340    1080B     FÍSICA — Calcula velocidade, aceleração, gravidade
0x09bbf8    500B      ROLAGEM — Rotação da nave (barrel roll)
0x09bdf0    896B      INPUT — Processa toque/acelerômetro/virtual joystick
0x09c1f8    1244B     UPDATE PARCIAL — Parte do loop de atualização
0x09c6d4    932B      MOVIMENTO — Lógica de movimentação no espaço
0x09ce38    8852B     ★ UPDATE PRINCIPAL — Loop principal do jogador (a cada frame)
                      → Este é o melhor ponto para GOD MODE (escrever vida máxima a cada frame)
0x09f0cc    968B      VERIFICAÇÕES — Checa limites, colisões, estados
0x09f4a0    208B      PROCESSAR MORTE — Animação e lógica de morte
0x09f570    1156B     APLICAR EFEITOS — Aplica boost, escudo, reparo etc
0x09f9f4    708B      PROCESSAR DANO — Calcula quanto dano tomar
0x09fcb8    2532B     ★ APLICAR DANO — Aplica dano ao jogador (vida, escudo, armadura)
                      → Este é o ponto onde a vida é SUBTRAÍDA
0x0a0704    584B      MOVER DIREITA — Input de movimento para direita
0x0a094c    580B      MOVER ESQUERDA — Input de movimento para esquerda
0x0a0b90    620B      MOVER BAIXO — Input de movimento para baixo
0x0a0dfc    624B      MOVER CIMA — Input de movimento para cima
0x0a1c98    620B      DESENHAR — Renderiza a nave na tela
0x0a2134    172B      TREMOR — Efeito de câmera quando leva dano
```

### Player — Classe Base (compartilhada entre jogador E inimigos)

Player é a classe PAI. Tanto o jogador (PlayerEgo) quanto os inimigos (KIPlayer) herdam dela.
**CUIDADO**: Modificar funções aqui afeta TODOS os personagens!

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x0a2570    448B      CONSTRUTOR — Cria um player genérico com stats iniciais
0x0a2864    128B      DESTRUTOR — Libera memória
0x0a2a70    92B       RESET — Reseta vida, escudo, estado para valores iniciais
0x0a2ec6    62B       DANO A — Tipo de processamento de dano (primeiro estágio)
0x0a2f04    12B       DANO B — Tipo de processamento de dano (wrapper)
0x0a2f10    82B       DANO C — Tipo de processamento de dano (com parâmetros)
0x0a2f62    52B       DANO D — Tipo de processamento de dano (final)
0x0a2f96    14B       RESET DANO — Reseta flags de dano
0x0a2fa4    540B      DANO E — Processamento de dano estendido
0x0a31c0    1236B     ★ DANO PRINCIPAL — Função principal que processa TODO dano recebido
                      → Recebe: dano(int), tipo(bool), fonte(int)
                      → Calcula: vida_atual - dano, verifica se morreu
                      → Escreve vida nova no offset +120 do struct
                      → PROBLEMA: Se desativar esta função, jogador E inimigos ficam invencíveis
0x0a3694    10B       DANO SIMPLES — Wrapper que chama DANO PRINCIPAL
                      → Recebe apenas o valor do dano
                      → Chama: damage(dano, false, -1)
0x0a36ce    12B       ESTÁ MORTO? — Retorna se a vida chegou a zero
0x0a36e6    6B        ESTÁ ATIVO? — Retorna se o player está no jogo
0x0a3b20    412B      TIRO A — Processamento de disparo tipo 1
0x0a3d5c    468B      TIRO B — Processamento de disparo tipo 2
0x0a3f30    110B      ATIRAR — Função principal de disparo
0x0a3f9e    116B      ATIRAR (avançado) — Disparo com mais parâmetros
0x0a4110    460B      ★ UPDATE PRINCIPAL — Loop de atualização do player
                      → Chamado a cada frame para cada player ativo
                      → KIPlayer::update é VAZIO (2 bytes), então esta função
                        só roda de verdade para o JOGADOR (PlayerEgo)
                      → MELHOR PONTO para God Mode: escrever vida máxima aqui
0x0a42dc    94B       CURAR — Restaura vida do jogador
                      → Recebe: quantidade(float)
                      → Soma à vida atual, respeitando o máximo
```

#### Campos do Struct Player (offsets a partir do ponteiro `this` em R0)
```
Offset   Tipo    O que é                    Como alterar
──────────────────────────────────────────────────────────
+64      int     Nível/Rank do jogador      STR R0, [Rthis, #64]
+116     float   Energia atual              VSTR S0, [Rthis, #116]
+120     float   ★ VIDA ATUAL               VSTR S0, [Rthis, #120] ← ALVO PRINCIPAL
+124     float   Energia secundária         VSTR S0, [Rthis, #124]
```

### KIPlayer — Inimigos Controlados por IA

KIPlayer é a classe dos inimigos. Herda de Player.
**IMPORTANTE**: KIPlayer::update() tem apenas 2 bytes (BX LR = retorno vazio).
Isso significa que KIPlayer NÃO executa o loop de update de Player.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x0a57c8    556B      CONSTRUTOR — Cria inimigo com stats baseados no nível
0x0a59f4    188B      DESTRUTOR — Remove inimigo da memória
0x0a5de6    68B       RESET — Reseta inimigo para estado inicial
0x0a5e60    684B      CÁLCULO IA — Decide movimento, alvo, comportamento
0x0a610c    14B       ESTÁ MORTO? — Verifica se inimigo morreu
0x0a6214    16B       ACORDAR — Ativa inimigo quando jogador se aproxima
0x0a622C    216B      CRIAR — Spawna inimigo no mapa
0x0a6332    30B       RASTREAR — Segue o jogador
0x0a6350    14B       PULAR — Salto entre sistemas
0x0a635e    2B        REVIVER — Função vazia (não faz nada)
0x0a63c0    2B        ★ UPDATE — Função VAZIA! Só tem BX LR (retorno)
                      → Isso prova que KIPlayer não usa Player::update
                      → Modificar Player::update é SEGURO para God Mode
```

### Ship — Definição das Naves

Ship define os atributos de cada nave: HP, escudo, velocidade, carga, slots etc.
Os valores vêm do arquivo `ships.bin`.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x17457c    140B      CONSTRUTOR — Cria nave com 9 parâmetros (tipo, stats...)
0x174608    924B      ATUALIZAR STATS — Recalcula stats baseados em equipamentos
0x174ab4    4B        HP BASE — Retorna HP base da nave (do ships.bin)
0x174afa    58B       HP MÁXIMO — Retorna HP máximo (base + modificações)
0x174b40    4B        VALOR — Preço da nave
0x174b48    4B        VELOCIDADE BOOST — Quão rápido vai no boost
0x174b54    4B        AGILIDADE — Quão rápido vira
0x174b58    4B        TAXA DE TIRO — Disparos por segundo
0x174b5c    4B        DANO BASE — Dano sem armas equipadas
0x174c38    4B        ★ CAPACIDADE DE CARGA — Quantos itens a nave carrega
                      → Para carga infinita: fazer retornar 99999
0x174c8c    4B        CARGA ATUAL — Quanto está carregando agora
0x174faa    62B       ADICIONAR CARGA — Coloca item na nave
0x1755b8    4B        DEFINIR PREÇO — Muda preço da nave
```

### Gun/Weapon — Sistema de Armas

Gun controla como as armas funcionam: mira, dano, cadência, projéteis.
Existem vários tipos: BombGun, MineGun, RocketGun, BeamGun, ObjectGun, SentryGun.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x151f20    532B      CONSTRUTOR — Cria arma com tipo, dano, cadência etc
0x152428    1788B     ★ ATIRAR EM — Função principal de disparo
                      → Calcula trajetória do projétil
                      → Verifica colisão com alvo
                      → Chama Player::damage() no alvo atingido
                      → MELHOR PONTO para Hit Kill (aumentar dano aqui)
0x152b24    88B       DISPARO — Inicia sequência de tiro
0x152b7c    1044B     IGNICIONAR — Ativa efeito de tiro
0x152f90    1984B     CALCULAR CARGA — Calcula power-up do tiro
0x153754    520B      UPDATE — Atualiza estado da arma por frame
0x15395c    244B      DESENHAR — Renderiza arma/projétil

Tipos de arma:
0x1475cc    600B      BombGun — Bombas explosivas
0x156478    284B      MineGun — Minas espaciais
0x15e8f8    216B      RocketGun — Foguetes teleguiados
0x15f700    516B      ObjectGun — Objetos lançáveis
0x177754    224B      BeamGun — Lasers/feixes contínuos
0x15c380    60B       SentryGun — Torres automáticas
```

### Level — Gerenciamento de Níveis e Missões

Level controla o mundo do jogo: criação de inimigos, asteroides, colisões, missões.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x0adac8    264B      CONSTRUTOR — Cria nível com parâmetros de dificuldade
0x0adf94    1568B     INICIALIZAR — Popula o nível com inimigos, asteroides, NPCs
0x0c40b0    6B        OBTER JOGADOR — Retorna ponteiro para PlayerEgo
0x0c455a    20B       ★ COLISÃO — Detecta colisão com asteroides
                      → Para atravessar asteroides: fazer retornar 0 (sem colisão)
0x0c457c    24B       COLISÃO B — Outro tipo de detecção de colisão
0x0c4594    84B       COLISÃO C — Colisão com objetos grandes
0x0c5f58    760B      UPDATE — Loop principal do nível (spawna inimigos, atualiza mundo)
```

### Station — Estações Espaciais

Station gerencia as estações onde o jogador compra naves, itens e aceita missões.
A Kaamo Club é uma estação especial.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x0a6978    124B      CONSTRUTOR — Cria estação com inventário
0x0a6e7c    58B       ★ TEM NAVE? — Verifica se uma nave está disponível na estação
                      → Para todas as naves: fazer sempre retornar true (1)
0x0a6e42    58B       TEM ITEM? — Verifica se um item está disponível
0x0a6f36    110B      ADICIONAR NAVE — Coloca nave no inventário da estação
0x0a6eb6    128B      ADICIONAR ITEM — Coloca item no inventário da estação
```

### HUD — Interface do Usuário

HUD desenha a interface: menus, pause, radar, indicadores, botões.

```
Endereço    Tamanho   O que faz
──────────────────────────────────────────────────────────────
0x1603fc    230B      CONSTRUTOR — Inicializa interface
0x1604e4    3464B     INICIALIZAR — Cria todos os elementos da HUD
0x1637a4    60B       ★ DESENHAR PAUSE — Desenha o menu de pause
                      → AQUI podemos adicionar o botão "MOD MENU"
0x166278    660B      DESENHAR MENU — Desenha menus genéricos
0x16323e    14B       JOGADOR ATINGIDO — Mostra indicador de dano
0x1636d8    6B        CARGA CHEIA — Mostra aviso de carga lotada
```

### Globals — Variáveis Globais

Globals armazena ponteiros e variáveis usadas por todo o jogo.

```
Endereço    Tamanho   Variável
──────────────────────────────────────────────────────────────
0x217c48    4B        boost_x — Componente X do vetor de boost
0x217c4c    4B        boost_y — Componente Y do vetor de boost
0x217c50    4B        boost_z — Componente Z do vetor de boost
0x2181ac    4B        galaxy — Índice da galáxia atual
0x2181b0    4B        status — Estado geral do jogo
0x2182ac    4B        items — Ponteiro para array de itens globais
0x2182b0    4B        ships — Ponteiro para array de naves globais
```

---

## Como Funciona Cada Mod

### God Mode (Vida Infinita)
**Problema**: A função `Player::damage()` é compartilhada. Se desativá-la, jogador E inimigos ficam invencíveis.
**Solução**: Em vez de desativar o dano, forçar a vida a ficar no máximo a cada frame.
**Onde alterar**: `Player::update()` no endereço 0x0a4110
**Como**: No início da função, escrever 999999.0f no campo de vida (offset +120 do struct).
**Por que é seguro**: `KIPlayer::update()` é vazio (2 bytes), então `Player::update()` só roda para o jogador.

### Hit Kill (Matar com 1 Golpe)
**Problema**: Se multiplicar o dano em `Player::damage()`, o jogador também morre com 1 tiro.
**Solução**: Aumentar o dano das armas no arquivo `items.bin` OU modificar `Gun::shootAt()`.
**Onde alterar**: `Gun::shootAt()` no endereço 0x152428 OU `items.bin`
**Como**: Multiplicar o valor de dano antes de aplicar ao alvo.
**Com God Mode**: O jogador não morre porque a vida é restaurada a cada frame.

### Carga Infinita
**Onde alterar**: `Ship::getCargoCapacity()` no endereço 0x174c38
**Como**: Fazer a função retornar 99999 em vez do valor real.

### Todas as Naves na Kaamo Club
**Onde alterar**: `Station::hasShip(int)` no endereço 0x0a6e7c
**Como**: Fazer a função sempre retornar 1 (true), independente de qual nave.

### Invisível para Inimigos
**Onde alterar**: Funções de rastreamento em KIPlayer (0x0a6332)
**Como**: Fazer a função de rastreamento não encontrar o jogador.

### Atravessar Asteroides
**Onde alterar**: `Level::collide()` no endereço 0x0c455a
**Como**: Fazer a função de colisão retornar 0 (sem colisão).

---

## Técnicas de Modificação do .so

### Formato ARM Thumb-2
O .so usa instruções ARM no modo Thumb (16 e 32 bits).
- Endereços de funções são ÍMPARES (ex: 0x0a3695 = modo Thumb)
- Endereço real no arquivo = endereço - 1 (ex: 0x0a3694)
- Primeiro halfword (2 bytes) determina o tipo de instrução

### Instruções Básicas
```
Bytes       Instrução              O que faz
──────────────────────────────────────────────
70 47       BX LR                  Retorna da função (sai imediatamente)
00 20       MOVS R0, #0            Coloca 0 no registrador R0 (retorno falso)
01 20       MOVS R0, #1            Coloca 1 no registrador R0 (retorno verdadeiro)
C0 46       NOP                    Não faz nada (pula instrução)
F0 B5       PUSH {R4-R11,LR}       Salva registradores na pilha (início de função)
```

### Code Cave (Injeção de Código)
Quando precisamos adicionar mais código do que cabe no espaço original:

1. **Encontrar espaço vazio**: Procurar região de zeros no .text (ex: endereço 0x150)
2. **Escrever código personalizado**: Nossas instruções no espaço vazio
3. **Substituir início da função**: Trocar os primeiros bytes por um salto (B.W) para o code cave
4. **No code cave**: Executar nosso código + instruções originais + salto de volta

### Exemplo Prático: God Mode via Code Cave
```
ORIGINAL em Player::update (0x0a4110):
  F0 B5        PUSH {R4-R11,LR}     ← primeiros 4 bytes
  03 AF        ADD R3, SP, #12

DEPOIS DO PATCH:
  B.W → 0x150                      ← salta para nosso código

NO CODE CAVE (0x150):
  MOVW R12, #0x2400                ← carrega metade de 999999.0f
  MOVT R12, #0x4974                ← carrega outra metade
  STR.W R12, [R0, #120]            ← vida = 999999.0f
  STR.W R12, [R0, #116]            ← energia = 999999.0f
  PUSH {R4-R11,LR}                 ← executa instruções originais
  ADD R3, SP, #12
  B.W → 0x0a4114                   ← volta para Player::update+4
```

### Valores IEEE 754 Úteis (Float)
```
Valor         Hex          Uso
────────────────────────────────────────
999999.0f     0x49742400   Vida/escudo máximos
1.0f          0x3F800000   Valor unitário
0.0f          0x00000000   Zero
-1.0f         0xBF800000   Valor negativo unitário
```

---

## Scripts de Automação

### Compilar APK
```bash
cd /home/lima/Projetos/GOF2-Mod
./scripts/build.sh [versão] [descrição]
```

### Instalar no Celular
```bash
./scripts/install.sh [caminho_do_apk]
```
Preserva automaticamente:
- OBB (1GB de texturas/modelos)
- Save do jogo (progresso)

### Aplicar Mods
```bash
./scripts/patch.sh
```
Aplica todas as modificações smali e copia arquivos de dados.

---

## Notas Importantes

1. **Player::damage afeta TODOS**: Jogador E inimigos usam a mesma função. NUNCA desativar diretamente.
2. **KIPlayer::update é vazio**: Prova que modificar Player::update é seguro — só afeta o jogador.
3. **Ships.bin vs items.bin**: ships.bin = stats das naves; items.bin = itens/mercadorias.
4. **OBB é separado**: Contém apenas assets visuais/sonoros. Toda lógica está no APK.
5. **Assinatura**: Usar apksigner (não jarsigner). Verificação: `adb shell settings put global verifier_verify_adb_installs 0`
6. **Preservar OBB**: Renomear pasta → desinstalar → instalar → renomear de volta.

---

## Próximos Passos

- [ ] Testar God Mode (code cave em Player::update)
- [ ] Implementar Hit Kill (modificar Gun::shootAt ou items.bin)
- [ ] Implementar Carga Infinita (Ship::getCargoCapacity)
- [ ] Implementar Todas as Naves (Station::hasShip)
- [ ] Criar Mod Menu no pause (Hud::drawPause)
- [ ] Implementar Invisível (KIPlayer tracking)
- [ ] Implementar Atravessar Asteroides (Level::collide)
- [ ] Implementar Créditos Infinitos
- [ ] Implementar Nível Máximo
