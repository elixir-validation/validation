defmodule Validation.Rules.UUIDTest do
  use ExUnit.Case
  alias Validation.Rules.UUID, as: V
  doctest Validation

  @uuid_version_1 "e4eaaaf2-d142-11e1-b3e4-080027620cdd"
  @uuid_version_3 "11a38b9a-b3da-360f-9353-a5a725514269"
  @uuid_version_4 "25769c6c-d34d-4bfe-ba98-e0ee856f3e7a"
  @uuid_version_5 "c4a760a8-dbcf-5254-a0d9-6a4474bd1b62"

  test "valid yes" do
    assert V.validate(@uuid_version_1)
    assert V.validate(@uuid_version_3)
    assert V.validate(@uuid_version_4)
    assert V.validate(@uuid_version_5)

    assert V.validate(@uuid_version_1, 1)
    assert V.validate(@uuid_version_3, 3)
    assert V.validate(@uuid_version_4, 4)
    assert V.validate(@uuid_version_5, 5)
  end

  test "invalid yes" do
    refute V.validate("")
    refute V.validate("00000000-0000-0000-0000-000000000000")
    refute V.validate("Not an UUID")
    refute V.validate("g71a18f4-3a13-11e7-a919-92ebcb67fe33")
    refute V.validate("a71a18f43a1311e7a91992ebcb67fe33")

    refute V.validate(@uuid_version_1, 5)
    refute V.validate(@uuid_version_3, 4)
    refute V.validate(@uuid_version_4, 3)
    refute V.validate(@uuid_version_5, 1)
  end

  test "exception - Only versions 1, 3, 4, and 5 are supported." do
    assert_raise RuntimeError, "Only versions 1, 3, 4, and 5 are supported.", fn ->
      assert V.validate(@uuid_version_1, -888)
      assert V.validate(@uuid_version_1, 9999)
    end
  end
end
