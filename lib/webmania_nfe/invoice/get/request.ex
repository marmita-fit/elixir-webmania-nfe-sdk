defmodule WebmaniaNfe.Invoice.Get.Request do
  @moduledoc false

  @derive [Nestru.Encoder,Nestru.Decoder]
  defstruct ID: nil,
            chave: nil,
            uuid: nil

  def new(id, :id) do
    %__MODULE__{
      ID: id,
    }
  end

  def new(chave, :chave) do
    %__MODULE__{
      chave: chave,
    }
  end

  def new(uuid, :uuid) do
    %__MODULE__{
      uuid: uuid,
    }
  end
end
