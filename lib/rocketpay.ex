defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: UserCreate
  alias Rocketpay.Accounts.Deposit, as: Deposit
  alias Rocketpay.Accounts.Withdraw, as: Withdraw
  alias Rocketpay.Accounts.Transaction, as: Transaction

  # Também funciona
  # alias Rocketpay.Accounts.{Deposit, Transaction, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
