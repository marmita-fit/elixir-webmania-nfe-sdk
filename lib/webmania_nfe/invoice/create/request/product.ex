defmodule WebmaniaNfe.Invoice.Create.Request.Product do
  @moduledoc """
  Documentation for `WebmaniaNfe.Invoice.Create.Request.Product`.
  """

  @derive [Nestru.Encoder, Nestru.Decoder]
  defstruct [
    :nome,
    :codigo,
    :ncm,
    :cest,
    :quantidade,
    :unidade,
    :peso,
    :origem,
    :subtotal,
    :total,
    :classe_imposto
  ]
end
