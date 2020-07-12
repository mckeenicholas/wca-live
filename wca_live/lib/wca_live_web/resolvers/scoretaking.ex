defmodule WcaLiveWeb.Resolvers.Scoretaking do
  alias WcaLive.Scoretaking
  alias WcaLive.Wca.Format

  # Rounds

  def round_format(%{format_id: format_id}, _args, _resolution) do
    {:ok, Format.get_by_id!(format_id)}
  end

  def round_name(round, _args, _resolution) do
    {:ok, Scoretaking.Round.name(round)}
  end

  def round_label(round, _args, _resolution) do
    {:ok, Scoretaking.Round.label(round)}
  end

  def round_open(round, _args, _resolution) do
    {:ok, Scoretaking.Round.open?(round)}
  end

  def round_finished(round, _args, _resolution) do
    {:ok, Scoretaking.Round.finished?(round)}
  end

  def round_active(round, _args, _resolution) do
    {:ok, Scoretaking.Round.active?(round)}
  end

  def get_round(_parent, %{id: id}, _resolution) do
    {:ok, Scoretaking.get_round(id)}
  end

  def open_round(_parent, %{id: id}, _resolution) do
    round = Scoretaking.get_round!(id)
    Scoretaking.open_round(round)
  end

  def clear_round(_parent, %{id: id}, _resolution) do
    round = Scoretaking.get_round!(id)
    Scoretaking.clear_round(round)
  end

  # Results

  def update_result(_parent, %{id: id, input: input}, _resolution) do
    result = Scoretaking.get_result!(id)
    Scoretaking.update_result(result, input)
  end

  # Records

  def list_recent_records(_parent, _args, _resolution) do
    {:ok, Scoretaking.list_recent_records()}
  end
end