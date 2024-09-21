# exemplo de código P4

O código P4 implementa um switch básico que usa o endereço IPv4 de destino para determinar como encaminhar ou descartar pacotes.
A lógica é configurada através de uma tabela de encaminhamento e ações personalizadas, com suporte para até 1024 entradas na tabela.
Este código é uma base simples para um switch programável que pode ser expandido para incluir comportamentos mais complexos, como manipulação de outros protocolos ou políticas de roteamento avançadas.

- Headers: Define os formatos dos cabeçalhos Ethernet e IPv4.
- Parser: Extrai os cabeçalhos dos pacotes para análise.
- Table: Define uma tabela de encaminhamento que usa o endereço IP de destino para decidir a ação.
- Actions: Ação a ser realizada, como encaminhar o pacote ou descartá-lo.
- Control: Aplica a tabela de encaminhamento para processar os pacotes.

Esse exemplo mostra como P4 pode ser usado para definir e implementar comportamentos de encaminhamento personalizados em dispositivos de rede, permitindo flexibilidade e adaptação à medida que as necessidades da rede evoluem.