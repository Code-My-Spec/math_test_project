defmodule MathTestProjectWeb.SubtractionLive do
  @moduledoc """
  Standalone page where users enter two numbers and get the difference.

  This LiveView provides a form for subtracting two numbers and displays the result.
  """

  use MathTestProjectWeb, :live_view

  alias MathTestProject.Calculator

  @doc """
  Mounts the LiveView with initial state.

  Initializes the socket with empty number fields and no result.
  """
  @spec mount(map(), map(), Phoenix.LiveView.Socket.t()) :: {:ok, Phoenix.LiveView.Socket.t()}
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:number_1, "")
      |> assign(:number_2, "")
      |> assign(:result, nil)

    {:ok, socket}
  end

  @doc """
  Handles the calculate event from form submission.

  Parses the two numbers from the form, calls the Calculator.subtract/2 function,
  and assigns the result to the socket.
  """
  @spec handle_event(String.t(), map(), Phoenix.LiveView.Socket.t()) ::
          {:noreply, Phoenix.LiveView.Socket.t()}
  def handle_event("calculate", %{"subtraction" => params}, socket) do
    number_1 = parse_number(params["number_1"])
    number_2 = parse_number(params["number_2"])

    result = Calculator.subtract(number_1, number_2)

    socket =
      socket
      |> assign(:number_1, params["number_1"])
      |> assign(:number_2, params["number_2"])
      |> assign(:result, result)

    {:noreply, socket}
  end

  @doc """
  Renders the subtraction page with form and result display.
  """
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <h1 class="text-2xl font-bold mb-4">Subtraction</h1>

      <form id="subtraction-form" phx-submit="calculate" class="space-y-4">
        <div>
          <label for="number_1" class="block text-sm font-medium">
            Number 1
          </label>
          <input
            type="text"
            name="subtraction[number_1]"
            id="number_1"
            value={@number_1}
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm"
          />
        </div>

        <div>
          <label for="number_2" class="block text-sm font-medium">
            Number 2
          </label>
          <input
            type="text"
            name="subtraction[number_2]"
            id="number_2"
            value={@number_2}
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm"
          />
        </div>

        <button type="submit" class="w-full rounded-md bg-blue-600 px-4 py-2 text-white hover:bg-blue-700">
          Subtract
        </button>
      </form>

      <%= if @result do %>
        <div class="mt-6 p-4 bg-gray-100 rounded-md">
          <p class="text-lg">
            Result: <span class="font-bold"><%= @result %></span>
          </p>
        </div>
      <% end %>
    </div>
    """
  end

  # Private helper to parse string numbers to floats
  defp parse_number(string) when is_binary(string) do
    {num, _} = Float.parse(string)
    num
  end
end
