defimpl Poison.Encoder, for: Folders.Folder do
  @attributes [
    :id,
    :first_name,
    :last_name,
    :email,
    :organization
  ]

  def encode(folder, _options) do
    SimpleRepoSample.JsonMapper.to_json(folder, @attributes)
  end
end
