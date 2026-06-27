# GOF2 Mod — Documentação Completa do Jogo

## Estrutura dos Arquivos de Dados

### ships.bin (2304 bytes, big-endian)
- 48 naves, cada registro com ~48 bytes
- Contém: HP base, escudo, slots, handling, preço, etc.
- Os valores são inteiros big-endian de 32 bits
- Offset 0: índice da nave
- Offset 4: valor relacionado a tipo/raça
- Offset 8: valor de slots
- Offset 12: preço (ex: 16038, 125400, 38709, 235600)
- Offset 32: HP base (ex: 120, 155, 210)
- Offset 40: escudo base (ex: 192, 160, 180)
- Offset 44: handling/agilidade (ex: 65, 52, 45)

### items.bin (27628 bytes, big-endian)
- 30 categorias de itens (não 30 itens individuais)
- Cada categoria pode ter múltiplos itens
- Contém: preço, dano, tipo, requisitos tech, etc.
- Não contém strings (nomes vêm de LocalizationService)
- Valores observados de dano: 90, 400, 440, 500, 600, 2000, 6230, 6481, 8000, 8800, 9510, 10461

### Funções do .so Relacionadas a Itens

#### Item (classe base)
| Offset | Tamanho | Função | Descrição |
|--------|---------|--------|-----------|
| 0x0e0090 | 22B | Item() | Construtor |
| 0x0e00a6 | 82B | Item::init() | Inicializa item a partir de dados |
| 0x0e0111 | 4B | getIndex() | ID do item |
| 0x0e0115 | 4B | getType() | Tipo (arma, equip, commodity) |
| 0x0e0119 | 4B | getTechLevel() | Nível tecnológico |
| 0x0e011d | 4B | getSort() | Ordenação |
| 0x0e0121 | 4B | getSinglePrice() | Preço unitário |
| 0x0e0125 | 8B | getTotalPrice() | Preço total |
| 0x0e012d | 4B | getMaxAmount() | Quantidade máxima |
| 0x0e0131 | 4B | getMinAmount() | Quantidade mínima |
| 0x0e0135 | 4B | getMaxXXX() | Outro máximo |
| 0x0e0139 | 4B | getMinXXX() | Outro mínimo |
| 0x0e013d | 4B | setPrice(int) | Define preço |
| 0x0e0149 | 36B | getPrice(int) | Retorna preço |
| 0x0e016c | 4B | setAmount(int) | Define quantidade |
| 0x0e0170 | 4B | getOcc() | Occupancy (espaço que ocupa no cargo) |
| 0x0e0175 | 4B | getAmount() | Quantidade atual |
| 0x0e0178 | 8B | changeAmount() | Altera quantidade |
| 0x0e0180 | 4B | getMissionID() | ID da missão |
| 0x0e0188 | 4B | getStamina() | Resistência |
| 0x0e0190 | 8B | changeStamina() | Altera resistência |
| 0x0e0198 | 4B | getBlueprint() | Blueprint |
| 0x0e01a0 | 8B | changeBlueprint() | Altera blueprint |
| 0x0e01a9 | 4B | getIngredient() | Ingrediente |
| 0x0e01ad | 4B | getQuality() | Qualidade |
| 0x0e01b1 | 4B | getAttribute() | Atributo genérico |
| 0x0e01b5 | 52B | getAttribute(int) | Atributo por índice |
| 0x0e0338 | 18B | makeItem(int) | Cria item por ID |
| 0x0e034a | 338B | combine() | Combina itens |
| 0x0e049c | 104B | extract() | Extrai componente |
| 0x0e0504 | 130B | combineAdvanced() | Combinação avançada |
| 0x0e05ca | 476B | mixItem() | Mistura itens |
| 0x0e07ba | 12B | isWeapon() | É arma? |

#### Ship (naves)
| Offset | Tamanho | Função | Descrição |
|--------|---------|--------|-----------|
| 0x17457c | 140B | Ship() | Construtor |
| 0x174608 | 924B | refresh() | Recalcula stats |
| 0x174ab4 | 4B | getBaseHP() | HP base |
| 0x174afa | 58B | getMaxHP() | HP máximo |
| 0x174b39 | 4B | getMaxShieldHP() | Escudo máximo |
| 0x174b3d | 4B | getShieldHP() | Escudo atual |
| 0x174b40 | 4B | getValue() | Valor da nave |
| 0x174b48 | 4B | getBoostSpeed() | Velocidade boost |
| 0x174b49 | 4B | getBoostEnergy() | Energia boost |
| 0x174b4d | 4B | getBoostRecharge() | Recarga boost |
| 0x174b54 | 4B | getAgility() | Agilidade |
| 0x174b58 | 4B | getFireRate() | Taxa de tiro |
| 0x174b5c | 4B | getDamage() | Dano base |
| 0x174c38 | 4B | getCargoCapacity() | Capacidade de cargo |
| 0x174c40 | 8B | getMaxCargoCapacity() | Capacidade máxima |
| 0x174c8d | 4B | getCargo() | Cargo atual |

#### Gun (armas)
| Offset | Tamanho | Função | Descrição |
|--------|---------|--------|-----------|
| 0x151f20 | 532B | Gun() | Construtor |
| 0x152134 | 120B | ~Gun() | Destrutor |
| 0x1521ac | 272B | setIndex(int) | Define tipo de arma |
| 0x1522d0 | 6B | setMagnitude() | Define magnitude |
| 0x1523b0 | 6B | setImpact() | Define impacto |
| 0x1523b6 | 6B | setEnemy() | Define inimigo alvo |
| 0x152428 | 1788B | shootAt() | **FUNÇÃO PRINCIPAL DE DISPARO** |
| 0x152b24 | 88B | shoot() | Inicia disparo |
| 0x152b7c | 1044B | ignite() | Ignição |
| 0x152f90 | 1984B | calcCharge() | Calcula carga |
| 0x153754 | 520B | update(int) | Atualização por frame |

#### Player (jogador base)
| Offset | Tamanho | Função | Descrição |
|--------|---------|--------|-----------|
| 0x0a2570 | 448B | Player() | Construtor |
| 0x0a2a70 | 92B | reset() | Reset de estado |
| 0x0a31c0 | 1236B | damage(int,bool,int) | **PROCESSAMENTO DE DANO PRINCIPAL** |
| 0x0a3694 | 10B | damage(int) | Wrapper de dano |
| 0x0a36ce | 12B | isDead() | Verifica se morreu |
| 0x0a4110 | 460B | update(int,bool) | **UPDATE PRINCIPAL (só PlayerEgo)** |
| 0x0a42dc | 94B | heal(float) | Cura |

#### Campos do Struct Player (offsets do ponteiro `this`)
| Offset | Tipo | Descrição |
|--------|------|-----------|
| +12 | int | Dados do slot de equipamento |
| +40 | int | Capacidade de cargo |
| +64 | int | Rank/nível |
| +108 | int | **ESCUDO/ENERGIA** (confirmado via escritas em damage) |
| +112 | int | Cargo atual |
| +120 | int | **VIDA/HP** (confirmado via escritas em damage) |
| +124 | int | Energia secundária |
| +136 | int | Escrito em damage |
| +140 | int | Escrito em damage |

### Naves do GOF2 (lista completa do jogo base)

#### Naves Terran (Humanas)
1. **Heron** — Inicial (Keith começa com ela)
2. **Betula** — Carga leve
3. **Groza** — Caça leve
4. **Kyrllion** — Caça médio
5. **Inflict** — Caça pesado
6. **Nemesis** — Caça avançado
7. **Bloodstar** — Caça premium
8. **Teneta** — Superior

#### Naves Vossk
9. **K'Suukk** — Caça Vossk leve
10. **S'Kanarr** — Caça Vossk médio
11. **N'Surr** — Caça Vossk pesado

#### Naves Midorian
12. **Grey Owl** — Caça leve
13. **Night Owl** — Caça médio (3 slots secundários visuais)
14. **VoidX** — Caça avançado

#### Naves Nivelian
15. **Daemon** — Caça leve
16. **Ghezek** — Caça médio
17. **Valkyrie** — Caça pesado

#### Naves Especiais (Kaamo Club)
18. **Scimitar** — Caça especial
19. **Specter** — Caça furtivo
20. **Dark Angel** — Caça elite
21. **Valkyrie** (DLC) — Caça DLC

### DLCs

#### Valkyrie (DLC 1)
- Nova campanha com a facção Valkyrie
- Novas naves e armas
- Sistemas: Midorian, Void

#### Supernova (DLC 2)
- Campanha com a facção Mido
- Novas naves, armas e sistemas
- Sistemas: Mido, Augmenta

#### Kaamo Club (DLC 3)
- Estação pessoal do jogador
- Armazenamento ilimitado de naves, armas, equipamentos
- 6 especialistas: mods de nave, armas exclusivas, naves exclusivas

### Modificações da Kaamo Club

Os NPCs da Kaamo Club vendem mods que alteram a nave:
- **Blindagem** — Aumenta HP máximo
- **Handling** — Melhora manobrabilidade
- **Cargo Hold** — Aumenta capacidade de carga
- **Equipment Slot** — Adiciona slot de equipamento extra
- **Armas exclusivas** — Armas vendidas apenas na Kaamo Club
- **Naves exclusivas** — Naves vendidas apenas na Kaamo Club

### Valores de Dano Observados (items.bin)
Armas primárias (lasers/canhões):
- Fraco: 90, 400, 440
- Médio: 500, 600, 2000
- Forte: 6230, 6481, 8000, 8800, 9510, 10461

Armas secundárias (mísseis/bombas):
- Valores variam por tipo e nível

### Técnicas de Modding Descobertas

#### O que FUNCIONA (sem crash):
1. **Modificação direta do APK** via Python zipfile (preserva classes.dex)
2. **Code cave em 0x19cbc8** dentro de .text (executável, 64 bytes livres)
3. **Smali mods** — mas PRECISA decompilar classes.dex primeiro (apktool d -s)
4. **Ships.bin** — modificar stats das naves
5. **Items.bin** — modificar preços e atributos

#### O que CAUSA CRASH:
1. Code cave em 0x150 (fora de .text, não-executável)
2. NOP em Player::damage (inimigos ficam invencíveis)
3. getMaxCargoCapacity→65535 (crash na Supernova DLC)
4. Ship::getMaxSlots→50 (crash no hangar)
5. apktool rebuild (corrompe classes.dex)

#### O que NÃO FUNCIONA como esperado:
1. getMaxHP→999999 (só altera o MAX, não a vida atual)
2. heal→999999 (só funciona quando algo chama heal)
3. getCargoCapacity→255 (afeta campo errado, cargo parece cheio)
