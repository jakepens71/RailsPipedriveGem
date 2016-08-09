# (1.2.0) August 9th, 2016 6:35 AM
        *Merged tomchinery's commits 

# (1.1.40) July 28th, 2016 10:20 AM
        *Merged Kevthedev's commits/fixes

# (1.1.39) July 27th, 2016 11:25 AM
        *Merged Kevthedev's commits including search for deal call and dependency issues

# (1.1.38) May 26th, 2016 2:10 PM
        *Added filters and files classes"

# (1.1.37) May 26th, 2016 9:22 AM 
        *Return errors on missing search term"

# (1.1.36) May 26th, 2016 9:00 AM
        *"

# (1.1.35) May 26th, 2016 8:21 AM
        *Added currency calculator to currencies class" 

# (1.1.34) May 24th, 2016 7:42 AM
        *Add activity method added- along with refactoring/tidying of classes, also added DealFields Class to get all deal fields. Added kevTheDev's 
refacotoring of search and adding orgs using HttParty for more consistency."

# (1.1.33) May 23rd, 2016 9:10 AM
        *Merged kevTheDev's commits to master"

# (1.1.30) February 9th, 2016 10:58 AM
        *Added Currency class with a method to retrieve currencies, also added get activities for a specific organization and config install"



# (1.1.27) January 28th, 2016 1:58 PM
        *Included getActivity_types method to retrieve all activity types"


# (1.1.27) January 28th, 2016 1:40 PM
        *Added Activity class to main module include getActivity method to retrieve activities per specific user"



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
