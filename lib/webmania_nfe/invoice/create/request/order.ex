defmodule WebmaniaNfe.Invoice.Create.Request.Order do
  @moduledoc """
  Documentation for `WebmaniaNfe.Invoice.Create.Request.Order`.
  """

  @derive [Nestru.Encoder, Nestru.Decoder]
  defstruct [
    :informacoes_complementares,
    :pagamento,
    :presenca,
    :modalidade_frete,
    :frete,
    :desconto,
    :total
  ]
end
