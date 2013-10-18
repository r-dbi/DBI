MockObject <- setClass("MockObject", contains = "DBIObject")
MockDriver <- setClass("MockDriver", contains = "DBIDriver")
MockConnection <- setClass("MockConnection", contains = "DBIConnection")
MockResult <- setClass("MockResult", contains = "DBIResult")