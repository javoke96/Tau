# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hello.Repo.insert!(%Hello.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Hello.Repo
alias Hello.Directory.City

Repo.insert! %City{name: "Istanbul", prev: "", status: true}
Repo.insert! %City{name: "Baku", prev: "Istanbul", status: false}
Repo.insert! %City{name: "Kyoto", prev: "Baku", status: true}
Repo.insert! %City{name: "Melbourne", prev: "Kyoto", status: false}
