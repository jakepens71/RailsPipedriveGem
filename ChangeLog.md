# (1.1.15) July 13th, 2015 11:37 AM
	* Added the ability to retrieve all fields that can be used in an Organization by using the OrganizationFields class

# (1.1.14) July 9th, 2015 07:47 AM
	* Added ability to insert a person to Pipedrive (PipedrivePUT::Persons.addPerson(<name>, < additional info >)

	* Added HTTParty back to dependencies. Used in Persons.addPerson (overall easier to add this with nested hashes)

# (1.1.13) July 1st, 2015 9:31 AM
	* Recent method needs Time format

	* added support to convert Time to utc. This is needed for Pipedrive

# (1.1.12) July 1st, 2015 8:24 AM
	* Added Recents class, added ability to search recent changes in Pipedrive by the getRecent method. 
	* Needs defined time in string as 'YYYY-MM-DD HH:MM:SS' format. This searches for every item in Pipedrive.
