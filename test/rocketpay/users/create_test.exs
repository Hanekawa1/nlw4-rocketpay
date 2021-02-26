defmodule Rocketpay.Users.CreateTest do
  # Permite execução de testes em sandbox, com async: true, permite execução simultânea em paralelo
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Wender",
        password: "123456",
        nickname: "wnd",
        email: "wender@email.com",
        age: 23
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Wender", age: 23, id: ^user_id} = user
    end

    test "when there are invalid parameters, returns an error" do
      params = %{
        name: "Wender",
        nickname: "wnd",
        email: "wender@email.com",
        age: 10
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}
      assert errors_on(changeset) == expected_response
    end
  end
end
