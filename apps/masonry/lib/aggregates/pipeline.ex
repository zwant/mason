defmodule Mason.Masonry.Pipeline do
  @moduledoc """
  """

  defstruct [
    challenge_uuid: nil,
    name: nil,
    description: nil,
    start_date: nil,
    start_date_local: nil,
    challenge_state: nil,
    # ...
  ]

  alias SegmentChallenge.Commands.{
    CreateChallenge,
    IncludeCompetitorsInChallenge,
    HostChallenge,
    StartChallenge,
    EndChallenge,
  }

  alias SegmentChallenge.Events.{
    ChallengeCreated,
    CompetitorsJoinedChallenge,
    ChallengeHosted,
    ChallengeStarted,
    ChallengeEnded,
  }

  alias SegmentChallenge.Challenges.Challenge

  @doc """
  Create a new challenge
  """
  def create_challenge(challenge, create_challenge)

  def create_challenge(%Challenge{challenge_state: nil}, %CreateChallenge{} = create_challenge) do
    %ChallengeCreated{
      challenge_uuid: create_challenge.challenge_uuid,
      name: create_challenge.name,
      description: create_challenge.description,
      # ...
    }
  end

  def create_challenge(%Challenge{}, %CreateChallenge{}), do: {:error, :challenge_already_created}

  @doc """
  Start the challenge, making it active
  """
  def start_challenge(challenge, start_challenge)

  def start_challenge(%Challenge{challenge_uuid: challenge_uuid, challenge_state: :approved} = challenge, %StartChallenge{}) do
    %ChallengeStarted{
      challenge_uuid: challenge_uuid,
      start_date: challenge.start_date,
      start_date_local: challenge.start_date_local,
    }
  end

  def start_challenge(%Challenge{}, %StartChallenge{}), do: {:error, :challenge_not_approved}

  def apply(%Challenge{} = challenge, %ChallengeCreated{challenge_uuid: challenge_uuid, name: name, description: description}) do
    %Challenge{challenge |
      challenge_uuid: challenge_uuid,
      name: name,
      description: description,
      challenge_state: :created,
      # ...
    }
  end

  def apply(%Challenge{} = challenge, %ChallengeStarted{}) do
    %Challenge{challenge |
      challenge_state: :active,
    }
  end
end
