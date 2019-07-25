If you want to clone this project, create, migrate and seed a local database. 

Then you can log in with 'admin', 'mechanic' or 'customer'@test.com with a password of 'password' to explore the features of my project.

I modeled this as a aircraft maintenance work order system. Each work order can have as many lists as the user wants, but would typically have a 'to do', 'in progress' and 'completed' list. Tasks can be added to the list and given a priority level and moved to different lists as they are in progress or completed.

Be sure to check out that only the admin user is allowed access to modify anything within this web application. The mechanic and customer each have slighly different access rights. I played around with this a few different ways, from having a flash message telling them they didn't have the rights to do that from the controller, to just not having the links appear to edit or delete things.
