
User.destroy_all
Idea.destroy_all



# Create Users
abe = User.create(name: "Abraham", email: "abe@email.com", password: "abe")
bea = User.create(name: "Beatrice", email: "bea@email.com", password: "bea")
cc = User.create(name: "Cecelia", email: "cc@email.com", password: "cc")
dee = User.create(name: "DeAnna", email: "dee@email.com", password: "dee")


# Create Ideas
i_lazyman = Idea.create(title: "Lazy Man", inspiration: "Tom Sawyer", summary: "Trick other people into doing my work aka Outsourcing.", user_id: abe.id, category: "Get Rich Quick")
i_vd = Idea.create(title: "Venue Dee-contaminate", inspiration: "After being sequestered for months to deter the spread of Covid, people are reluctant to enter public establishments that could be contaminated with Covid.", summary: "A cleaning and sanitizing service that specializes in the rapid cleaning and dissenfecting of public places and private homes. We service businesses every night so they start each business day germ free.", user_id: dee.id, category: "Covid")
i_tbglove = Idea.create(title: "The Body Glove", inspiration: "Rubber barriers, like medical gloves, have protected humans from the spread of disease for decades. So extend that protection to full body coverage.", summary: "People sheltering in place for months during the pandemic, miss the touch of loved ones. So medical grade full body suits that enclose the entire body from head to toe, liberate people from their self-imposed imprisonment. People, once again, will have the freedom to go out in public spaces and hug loved ones without fear.", user_id: dee.id, category: "Covid")


i_tcdiet = bea.ideas.create(title: "The Cookie Diet", inspiration: "I only crave cookies.", summary: "Develop cookie dishes that serve up each meal in cookie form. So there will be savory as well as sweet cookies. To ensure your young picky eaters get their proper nutrition, try our delicious vegetable cookies.", category: "Food")

i_ihchef = cc.ideas.build(title: "In House Chef", inspiration: "In the midst of a pandemic, people are reluctant to go out to dine in restaurants. So we send a professional crew (medically tested covid-free chef & server] to serve you professional meals made fresh in your own home.", summary: "Medically tested professional chefs & servers will be paired with Venu Dee-contaminate certified homes to give families a fine dining experience in their own home.", category: "Covid, Food")
i_ihchef.save


# Transport







