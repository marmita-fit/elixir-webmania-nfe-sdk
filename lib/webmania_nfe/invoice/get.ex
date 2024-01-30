defmodule WebmaniaNfe.Invoice.Get do
  @moduledoc """
  `WebmaniaNfe.Invoice.Get` handles initialization for the get invoice.

  ## Examples
  ```elixir
      iex> client = WebmaniaNfe.Client.new("https://webmaniabr.com/api/", "CONSUMER_KEY", "CONSUMER_SECRET", "ACCESS_TOKEN", "ACCESS_TOKEN_SECRET")
      iex> get = %WebmaniaNfe.Invoice.Get{} |> WebmaniaNfe.Invoice.Get.add(%WebmaniaNfe.Invoice.Get.Request{ ID: 123 }) |> WebmaniaNfe.Invoice.Get.add(client)
      %WebmaniaNfe.Invoice.Get{
        url: "1/nfe/consulta/",
        method: "GET",
        client: %WebmaniaNfe.Client{
          config: %WebmaniaNfe.Client.Config{
            base_url: "https://webmaniabr.com/api/",
            consumer_key: "CONSUMER_KEY",
            consumer_secret: "CONSUMER_SECRET",
            access_token: "ACCESS_TOKEN",
            access_token_secret: "ACCESS_TOKEN_SECRET"
          },
          headers: [
            {"Content-Type", "application/json"},
            {"X-Consumer-Key", "CONSUMER_KEY"},
            {"X-Consumer-Secret", "CONSUMER_SECRET"},
            {"X-Access-Token", "ACCESS_TOKEN"},
            {"X-Access-Token-Secret", "ACCESS_TOKEN_SECRET"}
          ],
          request: nil,
          response: nil
        },
        request: %WebmaniaNfe.Invoice.Get.Request{ID: 123, chave: nil, uuid: nil},
        response: %WebmaniaNfe.Invoice.Create.Response{
          uuid: nil,
          status: nil,
          motivo: nil,
          nfe: nil,
          serie: nil,
          modelo: nil,
          recibo: nil,
          chave: nil,
          xml: nil,
          danfe: nil,
          danfe_simples: nil,
          danfe_etiqueta: nil,
          log: nil
        }
      }
      iex> get |> WebmaniaNfe.Invoice.Get.request()
  ```

  """

  alias WebmaniaNfe.Invoice.Get.{Request, Response}


  @derive [
    {Nestru.Encoder, hint: %{request: Request, response: Response}},
    {Nestru.Decoder, hint: %{request: Request, response: Response}}
  ]
  @path "1/nfe/consulta/"
  @method "GET"
  defstruct url: @path,
            method: @method,
            client: %WebmaniaNfe.Client{},
            request: %WebmaniaNfe.Invoice.Create.Request{},
            response: %WebmaniaNfe.Invoice.Create.Response{}

  def new() do
    %__MODULE__{
      url: @path,
      method: "GET",
      client: %WebmaniaNfe.Client{},
      request: %WebmaniaNfe.Invoice.Get.Request{},
      response: %WebmaniaNfe.Invoice.Get.Response{}
    }
  end

  def new(%__MODULE__{} = get) do
    %__MODULE__{
      get | url: @path,
      method: "POST",
      request: %WebmaniaNfe.Invoice.Get.Request{},
      response: %WebmaniaNfe.Invoice.Get.Response{}
    }
  end

  def add(%__MODULE__{} = get, %WebmaniaNfe.Invoice.Get.Request{} = request) do
    %__MODULE__{
      get | request: request,
    }
  end

  def add(%__MODULE__{} = get, %WebmaniaNfe.Invoice.Get.Response{} = response) do
    %__MODULE__{
      get | response: response,
    }
  end

  def add(%__MODULE__{} = get, %WebmaniaNfe.Client{} = client) do
    %__MODULE__{
      get | client: client,
    }
  end

  def request(%__MODULE__{} = get) do
    client = get.client |> WebmaniaNfe.Client.request(get)
    get
    |> add(client)
    |> add(process_response(client))
  end

  defp process_response(%WebmaniaNfe.Client{response: {:ok, %HTTPoison.Response{status_code: 200, body: body}}} = _client) do
    body |> Poison.decode!(%{as: %WebmaniaNfe.Invoice.Get.Response{}})
  end
  defp process_response(%WebmaniaNfe.Client{response: {:error, response}} = _client), do: process_response(response)
  defp process_response(response) do
    response
  end

end
