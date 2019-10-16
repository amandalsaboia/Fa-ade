# A classe Facade fornece uma interface simples para a lógica complexa de um ou
# muitos subsistemas. O Facade delega os pedidos do cliente aos
# objetos aprpriados dentro do subsitema. O Facade é também responsável por 
# gerenciar o ciclo de vida. Tudo isso protege o cliente das indesejadas
# complexidades do subsistema.
class Facade
  # Dependendo das necessidades da sua aplicação, você pode fornecer o Facade com
  # objetos existentes do subsistema ou forçar o facade a criá-los por conta própria.
  def initialize(subsystem1, subsystem2)
    @subsystem1 = subsystem1 || Subsystem1.new
    @subsystem2 = subsystem2 || Subsystem2.new
  end

  # Os métodos do Facade são atalhos convenientes para as sofisticadas
  # funcionalidades dos subsitemas. No entanto, os clientes recebem apenas uma fração do
  # dos recursos de um subsistema.
  def operation
    results = []
    results.append('Facade initializes subsystems:')
    results.append(@subsystem1.operation1)
    results.append(@subsystem2.operation1)
    results.append('Facade orders subsystems to perform the action:')
    results.append(@subsystem1.operation_n)
    results.append(@subsystem2.operation_z)
    results.join("\n")
  end
end

# O subsistema pode aceitar solicitações diretamente do facade ou do cliente.
# De qualquer forma, para o subsistema o Facade é outro cliente, e não é
# uma parte do subsistema.
class Subsystem1
  # @return [String]
  def operation1
    'Subsystem1: Ready!'
  end

  # ...

  # @return [String]
  def operation_n
    'Subsystem1: Go!'
  end
end

# alguns facades podem trabalhar com muitos subsistemas ao mesmo tempo.
class Subsystem2
  # @return [String]
  def operation1
    'Subsystem2: Get ready!'
  end

  # ...

  # @return [String]
  def operation_z
    'Subsystem2: Fire!'
  end
end

# O código do cliente tabalha com subsistemas complexos através de uma interface simples
# providenciada pelo Facade. Quando um facade gerencia o ciclo de vida do subsistema,
# o cliente pode nem saber sobre a existência do subsistema. Isso
# essa abordagem permite manter a complexidade sob controle.
def client_code(facade)
  print facade.operation
end

# O código do cliente pode ter algum dos objetos do subsistema já criados. Neste caso,
# pode valer a pena inicializar o Facade com esses objetos
# ao invés de deixar o Facade criar novas instâncias.
subsystem1 = Subsystem1.new
subsystem2 = Subsystem2.new
facade = Facade.new(subsystem1, subsystem2)
client_code(facade)