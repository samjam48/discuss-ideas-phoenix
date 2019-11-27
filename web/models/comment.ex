defmodule Discuss.Comment do
  use Discuss.Web, :model

  @derive {Poison.Encoder, only: [:content, :user, :inserted_at]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Disccuss.Topic

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end

end