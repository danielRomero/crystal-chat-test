class AddUsersMigration1
  include Clear::Migration

  def change(direction)
    direction.up do
      create_table(:users) do |t|
        t.column :first_name, :string, index: true
        t.column :last_name, :string

        t.column :email, :string, unique: true, index: true
        t.column :encrypted_password, :string, null: false

        # Will create a "user_info_id" field of type longint with a foreign key constraint
        # This reference can be null, and if the user_info is deleted then the user is deleted too.
        # t.references to: "user_infos", name: "user_info_id", on_delete: "cascade", null: true

        # Example of creating index on full name
        t.index "lower(first_name || ' ' || last_name)", using: :btree

        t.timestamps
      end
    end

    direction.down do
      execute("DROP TABLE users")
    end
  end
end
