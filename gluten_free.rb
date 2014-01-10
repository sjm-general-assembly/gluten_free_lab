#Title: Gluten Free
 
#Prerequisites:     [ DO NOT NEED TO SUBMIT THIS LAB ]
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes
 
#Objectives:
#- Work with exceptions, classes, class variables, conditions
 
"======================================================================"
require 'pry'

# Create our own error, based on RunTime error.
class AllergyError < RuntimeError; end
 
# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.
 
class Person

		# on initialization, create an empty stomach, set a meal counter (hash key), store allergies.
		def initialize(allergies)
			@stomach = {}				# probably don't need a hash here, but getting practice.
			@meal_number = 0
			@allergies = allergies
		end

		def eats(food)
			begin
				if food.include? @allergies
					# yikes! about to eat a food that I'm allergic to. let's barf.
					initialize(@allergies)  # empties stomach, sets meals to 0, retains allergies.
						# binding.pry
					raise AllergyError.new("Allergy found, raising an exception.")
				end
				# food must be safe. let's eat.
					# binding.pry
				@meal_number += 1
				@stomach[@meal_number] = food
				puts "#{self.to_s} just ate: #{@stomach[@meal_number]}" # wierdness. -accidentally removed the '@' before stomach, got strange results. line didn't print.
			rescue
					# binding.pry
				puts ("Whoa. Almost ate an allergen (#{@allergies}). So I purged. See my stomach is empty -> #{@stomach}")
			end
		end

end
 
# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
 
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new("gluten")
chris.eats(pizza)
chris.eats(pan_seared_scallops)
chris.eats(water)
	# binding.pry

beth = Person.new("scallops")
beth.eats(pizza)
beth.eats(pan_seared_scallops)
beth.eats(water)
	# binding.pry

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 
 
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception

