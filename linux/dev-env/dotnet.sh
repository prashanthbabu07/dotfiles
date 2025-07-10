# Install dotnet tools 
# coverlet            dotnet-counters     dotnet-dump         dotnet-ef           dotnet-outdated     dotnet-trace        reportgenerator
# csharp-ls           dotnet-coverage     dotnet-easydotnet   dotnet-gcdump       dotnet-sonarscanner netcoredbg

# Install dotnet tools
dotnet tool install -g coverlet.console
dotnet tool install -g dotnet-counters
dotnet tool install -g dotnet-dump
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-outdated
dotnet tool install -g dotnet-trace
dotnet tool install -g reportgenerator
dotnet tool install -g dotnet-coverage
dotnet tool install -g dotnet-easydotnet
dotnet tool install -g dotnet-gcdump
dotnet tool install -g dotnet-sonarscanner

# syntax for updating tools
dotnet tool update -g coverlet.console


