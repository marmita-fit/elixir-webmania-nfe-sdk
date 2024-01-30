defmodule WebmaniaNfe.Invoice.Create.Request.Customer do
  @moduledoc """
  Documentation for `WebmaniaNfe.Invoice.Create.Request.Customer`.
  """

  @derive [Nestru.Encoder, Nestru.Decoder]
  defstruct [
    :cpf,
    :nome_completo,
    :endereco,
    :complemento,
    :numero,
    :bairro,
    :cidade,
    :uf,
    :cep,
    :telefone,
    :email
  ]
end
