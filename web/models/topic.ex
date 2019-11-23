defmodule Discuss.Topic do
  use Discuss.Web, :model

  # show phoenix how the topics table works
  schema "topics" do
    field :title, :string
    field :details, :string
    belongs_to :user, Discuss.User
  end

  # Validate a model before it gets put into the DB
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :details])
    |> validate_required([:title]) # must have a title
  end
end