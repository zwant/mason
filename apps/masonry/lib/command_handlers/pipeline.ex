defmodule Mason.Masonry.PipelineCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias Mason.Masonry.Pipeline

  def handle(%Pipeline{} = aggregate, %StartPipeline{} = command) do
    aggregate
    |> Pipeline.start_pipeline(command)
  end

  def handle(%Pipeline{} = aggregate, %FinishPipeline{} = command) do
    aggregate
    |> Pipeline.finish_pipeline(command)
  end
end
