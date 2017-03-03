defmodule Mason.Commands.StartPipeline do
  defstruct [
    :pipeline_uuid,
    :start_timestamp
  ]

  use Vex.Struct

  validates :pipeline_uuid, uuid: true
end

defmodule Mason.Commands.FinishPipeline do
  defstruct [
    :pipeline_uuid,
    :finish_timestamp,
    :result
  ]

  use Vex.Struct

  validates :pipeline_uuid, uuid: true

end

defmodule Mason.Commands.StartBuild do
  defstruct [
    :build_uuid,
    :pipeline_uuid,
    :start_timestamp
  ]

  use Vex.Struct

  validates :build_uuid, uuid: true
  validates :pipeline_uuid, uuid: true

end

defmodule Mason.Commands.FinishBuild do
  defstruct [
    :build_uuid,
    :pipeline_uuid,
    :finish_timestamp,
    :result
  ]

  use Vex.Struct

  validates :build_uuid, uuid: true
  validates :pipeline_uuid, uuid: true
end
