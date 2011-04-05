# Padrino nested forms example
In request to basex's email http://groups.google.com/group/padrino/msg/37c1af9679774af9 on how to use nested forms, here's an example using Padrino's admin.

It's a one-minute draft and requires more work. Perhaps someone from the Padrino team may help here since I don't really know which is the best way -and if it's supported- to add a space for an empty address by default or how to allow adding new addresses to an existing Person.

I've sorted that out by attaching a new Address instance before both, new and edit are run, e.g.:

  get :new do
    @person = Person.new
    @person.addresses << Address.new
    render 'people/new'
  end

Hope this is useful! :)
