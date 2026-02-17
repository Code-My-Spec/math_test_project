defmodule MathTestProjectSpex.SharedGivens do
  @moduledoc """
  Shared given steps for BDD specifications.

  Import these givens in your spec files:

      defmodule MathTestProjectSpex.FeatureNameSpex do
        use SexySpex
        import_givens MathTestProjectSpex.SharedGivens.SharedGivens
        # ...
      end

  Add new shared givens here when you find yourself duplicating setup code
  across multiple specs. Remember: spex files can only access the Web layer,
  so shared givens should set up state through UI interactions, not fixtures.
  """

  use SexySpex.Givens

  # Example shared given that sets up state through UI:
  #
  # given_ :user_registered do
  #   conn = Phoenix.ConnTest.build_conn()
  #   {:ok, view, _html} = Phoenix.LiveViewTest.live(conn, "/users/register")
  #
  #   view
  #   |> Phoenix.LiveViewTest.form("#registration-form", user: %{
  #     email: "test#{System.unique_integer()}@example.com",
  #     password: "ValidPassword123!"
  #   })
  #   |> Phoenix.LiveViewTest.render_submit()
  #
  #   {:ok, %{}}
  # end
end
