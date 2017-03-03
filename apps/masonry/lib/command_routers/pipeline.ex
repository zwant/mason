defmodule Mason.Masonry.Router do
  use Commanded.Commands.Router

  alias Mason.Masonry.{Pipeline, PipelineCommandHandler}

  middleware Commanded.Middleware.Auditing
  middleware Commanded.Middleware.Logger
  #middleware SegmentChallenge.Infrastructure.Validation.Middleware

  dispatch [
    Mason.Commands.StartPipeline,
    Mason.Commands.FinishPipeline
    ], to: PipelineCommandHandler, aggregate: Pipeline, identity: :pipeline_uuid
end
