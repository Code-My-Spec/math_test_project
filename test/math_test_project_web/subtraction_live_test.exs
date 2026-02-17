defmodule MathTestProjectWeb.SubtractionLiveTest do
  use MathTestProjectWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "mount/3" do
    test "renders the subtraction page with heading", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      assert has_element?(view, "h1", "Subtraction")
    end

    test "renders the subtraction form with correct id", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      assert has_element?(view, "form#subtraction-form")
    end

    test "renders number input fields with correct names", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      assert has_element?(view, "input[name='subtraction[number_1]']")
      assert has_element?(view, "input[name='subtraction[number_2]']")
    end

    test "renders submit button with correct text", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      assert has_element?(view, "button", "Subtract")
    end
  end

  describe "handle_event calculate" do
    test "calculates difference of two positive numbers", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      result_html =
        view
        |> form("#subtraction-form", subtraction: %{number_1: "10", number_2: "3"})
        |> render_submit()

      assert result_html =~ "7"
    end

    test "calculates difference resulting in negative number", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      result_html =
        view
        |> form("#subtraction-form", subtraction: %{number_1: "3", number_2: "8"})
        |> render_submit()

      assert result_html =~ "-5"
    end

    test "calculates difference of decimal numbers", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      result_html =
        view
        |> form("#subtraction-form", subtraction: %{number_1: "5.5", number_2: "2.5"})
        |> render_submit()

      assert result_html =~ "3"
    end

    test "calculates difference with zero", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/subtraction")

      result_html =
        view
        |> form("#subtraction-form", subtraction: %{number_1: "9", number_2: "0"})
        |> render_submit()

      assert result_html =~ "9"
    end
  end
end
