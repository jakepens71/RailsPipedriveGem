# (1.1.27) October 29th, 2015 8:05 AM
        *Don't bump up the version -Began adding in activities & activiites-task- not included in main PipdrivePUT module using mainact as main construct for http response heads and body
         possibly redoing these if need be, also added in test dir for future test implications -Jsnow 10-29-2015"


# (1.1.27) October 12th, 2015 12:00 PM
	*Added ability to add an organization field (PipedrivePUT::OrganizationFields.addOrganizationField(< field name>, <field type>, <options>)

# (1.1.26) September 1st, 2015 2:22 PM
	*Updated Organization methods with some "rescue" clases. Certain methods were failing when no data was returned"

# (1.1.25) August 20th, 2015 7:42 AM
	*All "Put" messages that were outputted are now commented out

# (1.1.24) August 14th, 2015 10:52 AM
	*Ruby version difference was cause of URI issues
	*Reverted back to NET::HTTP
	*Fixed get all organizations.

# (1.1.22) August 6th, 2015 2:09 PM
	*HTTParty error caused URI issues (of course!) Sorry reverting back!
		PipedirvePUT::Search.search() no longer uses HTTParty

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
