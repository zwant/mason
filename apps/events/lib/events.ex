defmodule Mason.Events.PipelineStarted do
  defstruct [
    :pipeline_uuid,
    :start_timestamp
  ]
end

defmodule Mason.Events.PipelineFinished do
  defstruct [
    :pipeline_uuid,
    :finish_timestamp,
    :result
  ]
end

defmodule Mason.Events.BuildStarted do
  defstruct [
    :build_uuid,
    :pipeline_uuid,
    :start_timestamp
  ]
end

defmodule Mason.Events.BuildFinished do
  defstruct [
    :build_uuid,
    :pipeline_uuid,
    :finish_timestamp,
    :result
  ]
end

# DeployStarted
# DeployFinished
# ArtifactPublished
# CodeCommitted
# PullRequestOpened
# PullRequestClosed
# CodeReviewAccepted
# RepositoryAdded
# RepositoryRemoved
