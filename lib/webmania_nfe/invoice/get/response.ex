defmodule WebmaniaNfe.Invoice.Get.Response do
  @moduledoc """
  `WebmaniaNfe.CreateInvoice.Response` handles initialization for the invoice Response payload.

   ##Examples
      iex> WebmaniaNfe.Invoice.Get.Response.new!(%{ ID: "123", url_notificacao: "https://webmaniabr.com",  operacao: "1", natureza_operacao: "Venda de produção do estabelecimento",  modelo: "1", finalidade: "1",  ambiente: "1", cliente: %{    cpf: "000.000.000-00", nome_completo: "Nome do Cliente",    endereco: "Av. Brg. Faria Lima", complemento: "Escritório",    numero: 1000, bairro: "Itaim Bibi",    cidade: "São Paulo", uf: "SP",    cep: "00000-000", telefone: "(00) 0000-0000",    email: "nome@email.com" }, produtos: [%{    nome: "Nome do produto", codigo: "nome-do-produto",    ncm: "6109.10.00", cest: "28.038.00",    quantidade: 1, unidade: "UN",    peso: "0.800", origem: 0,    subtotal: "29.90", total: "29.90",    classe_imposto: "REF1000" }],  pedido: %{ pagamento: 0,    presenca: 2, modalidade_frete: 0,    frete: "12.56", desconto: "10.00",    total: "174.60" }})
      %WebmaniaNfe.Invoice.Get.Response{
        ID: "123",
        url_notificacao: "https://webmaniabr.com",
        operacao: "1",
        natureza_operacao: "Venda de produção do estabelecimento",
        modelo: "1",
        finalidade: "1",
        ambiente: "1",
        cliente: %WebmaniaNfe.Invoice.Get.Response.Customer{
          cpf: "000.000.000-00",
          nome_completo: "Nome do Cliente",
          endereco: "Av. Brg. Faria Lima",
          complemento: "Escritório",
          numero: 1000,
          bairro: "Itaim Bibi",
          cidade: "São Paulo",
          uf: "SP",
          cep: "00000-000",
          telefone: "(00) 0000-0000",
          email: "nome@email.com"
        },
        produtos: [%WebmaniaNfe.Invoice.Get.Response.Product{
          nome: "Nome do produto",
          codigo: "nome-do-produto",
          ncm: "6109.10.00",
          cest: "28.038.00",
          quantidade: 1,
          unidade: "UN",
          peso: "0.800",
          origem: 0,
          subtotal: "29.90",
          total: "29.90",
          classe_imposto: "REF1000"
        }],
        pedido: %WebmaniaNfe.Invoice.Get.Response.Order{
          pagamento: 0,
          presenca: 2,
          modalidade_frete: 0,
          frete: "12.56",
          desconto: "10.00",
          total: "174.60"
        }
      }
  """
  @derive [Nestru.Encoder, Nestru.Decoder]
  defstruct [
    :uuid,
    :status,
    :motivo,
    :nfe,
    :serie,
    :modelo,
    :recibo,
    :chave,
    :xml,
    :danfe,
    :danfe_simples,
    :danfe_etiqueta,
    :log,
    :error
  ]

  def new(response) when is_map(response), do: Nestru.decode_from_map(response, __MODULE__)

  def new({:ok, %WebmaniaNfe.Invoice.Get.Response{}} = response), do: response

  def new!(response) when is_map(response), do: Nestru.decode_from_map!(response, __MODULE__)

  def new!(%WebmaniaNfe.Invoice.Get.Response{} = response), do: Nestru.decode_from_map!(response, __MODULE__)
end
