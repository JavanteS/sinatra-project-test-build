get /placeholders/new # new
post /placeholders #create route

get /placeholders # index
get /placeholders/id   # show route 

get /placeholders/:id/edit #edit
patch /placeholders/:id #update 

delete /placeholders/:id #delete

users model will have
    username
    securepassword 
    email 
has secure password
has many restaurant

restaurant belong to user
has title 
has address
has category(cusine)






