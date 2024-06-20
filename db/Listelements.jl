#--------------------------------------------------------------------------
#In this file, we define Listelement as a new datatype, wich contains the values listed in the table Listelements
#--------------------------------------------------------------------------
module Listelements
#import package SQLite, Dates
using Dates

export Listelement

mutable struct Listelement
  task::String 
  author::String 
  date::Date 
end

end     #of module listelements