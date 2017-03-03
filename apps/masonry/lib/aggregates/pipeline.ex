defmodule Mason.Masonry.Pipeline do
  @moduledoc """
  """

  defstruct [
    pipeline_uuid: nil,
    start_timestamp: nil,
    finish_timestamp: nil,
    pipeline_state: nil,
    pipeline_result: nil
  ]

  alias Mason.Commands.{
    StartPipeline,
    FinishPipeline,
    StartBuild,
    FinishBuild
  }

  alias Mason.Events.{
    PipelineStarted,
    PipelineFinished,
    BuildStarted,
    BuildFinished
  }

  alias Mason.Masonry.Pipeline

  @doc """
  Start the pipeline, marking it as currently running
  """
  def start_pipeline(pipeline, start_pipeline)

  def start_pipeline(%Pipeline{pipeline_state: nil}, %StartPipeline{} = start_pipeline) do
     %PipelineStarted{
       pipeline_uuid: start_pipeline.pipeline_uuid,
       start_timestamp: start_pipeline.start_timestamp
     }
  end

  def start_pipeline(%Pipeline{pipeline_state: :running} = pipeline, %StartPipeline{}), do {:error, :pipeline_already_running}

  @doc """
  Complete the pipeline, marking it as finished
  """
  def finish_pipeline(pipeline, finish_pipeline)

  def finish_pipeline(%Pipeline{pipeline_state: :running}, %FinishPipeline{} = finish_pipeline) do
     %PipelineFinished{
       pipeline_uuid: finish_pipeline.pipeline_uuid,
       finish_timestamp: finish_pipeline.finish_timestamp,
       result: finish_pipeline.result
     }
  end

  def finish_pipeline(%Pipeline{}, %FinishPipeline{}), do {:error, :pipeline_not_started}

  def apply(%Pipeline{} = pipeline, %PipelineStarted{pipeline_uuid: pipeline_uuid, start_timestamp: start_timestamp}) do
    %Pipeline{pipeline |
      pipeline_uuid: pipeline_uuid,
      start_timestamp: start_timestamp,
      pipeline_state: :running
    }
  end

  def apply(%Pipeline{} = pipeline, %PipelineFinished{pipeline_uuid: pipeline_uuid, finish_timestamp: finish_timestamp, result: result}) do
    %Pipeline{pipeline |
      finish_timestamp: finish_timestamp,
      pipeline_state: :finished,
      pipeline_result: result
    }
  end
end
