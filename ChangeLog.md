# (1.1.21) August 6th, 2015 1:53 PM
	*Fixed PipedrivePUT::Search.search uri.

# (1.1.20) August 6th, 2015 11:48 AM
	*switched "PipedrivePUT::Search.search" from regular ruby request to use HTTparty.
		I was having trouble for some very odd reason getting this request to work on a server
		This should NOT cause any problems with the previous releases. It still returns the same data 
		just a diffrent request. If ANYONE has any trouble please let me know asap and I will then add
		the previous method back in.

# (1.1.18) July 31st, 2015 1:56 PM
	*added ability to update a person from pipedrive

# (1.1.17) July 31st, 2015 11:45 AM
	* Aded ability to remove a person from pipedrive

# (1.1.16) July 22nd, 2015 11:57 AM
	* Fixed type in organization Fields
	* added support to update an organization

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
