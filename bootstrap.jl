(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using DatabaseInterface
const UserApp = DatabaseInterface
DatabaseInterface.main()
