
User.destroy_all
Idea.destroy_all



# Create Users
abe = User.create(name: "Abraham", email: "abe@email.com", password: "abe")
bea = User.create(name: "Beatrice", email: "bea@email.com", password: "bea")
cc = User.create(name: "Cecelia", email: "cc@email.com", password: "cc")
dee = User.create(name: "DeAnna", email: "dee@email.com", password: "dee")
eel = User.create(name: "Elia", email: "eel@email.com", password: "eel")


# Create Ideas
Idea.create(title: "Face Glue", inspiration: "Want a facelift but afraid of surgery", summary: "This product should be worn on the face 24/7. Slather it on and it freezes your face in place, preventing facial expressions which would cause wrinkles over time.", user_id: abe.id, category: "Cosmetics", timeline_plan: "A month", action_steps_accomplished: "1. Mixed a batch of Face Glue 2. Searching for volunteers", resources: "My parents and their basement", total_budgeted_dollars: -250, total_spent_dollars: 1000)

Idea.create(title: "Tattoo Cookies", inspiration: "I love tattoos and I love animal cookies", summary: "Remember those animal cookies you used to love as a child? Well you can recapture those days and that feeling with Tattoo Cookies; cookies that resemble tattoos", category: "Food", user_id: cc.id)


Idea.create(title: "RSVP: Rain Shade Various Padding", inspiration: "Want to combine my multiple accessories into into a few multi-functional items", summary: "The RSVP is a top of the line head covering that can be worn on rainy, sunny, or cold days.", user_id: bea.id, category: "Accessories")

Idea.create(title: "Moti-Vator", inspiration: "Drill Sergeants", summary: "Too lazy to run after your dreams? The Moti-Vator will fix that. The Moti-Vator is a loud voiced individual who sneaks up behind you and yells insults at you until you get your butt into gear.", user_id: abe.id, category: "Career")

Idea.create(title: "poP adoS", inspiration: "Cross Word Puzzles",
summary: "Write story endings in cryptic text that readers have to decipher to find out how a story ends. It can be written any number of ways including in cross word puzzle style or backwards like poP adoS (Soda Pop)", timeline_plan: "5 days: introduce to USA, 6 days: introduce to the world, 10 days: decide what I'll do with my millions", action_steps_accomplished: "None", resources: "The sweat of my brow", category: "Entertainment", user_id: eel.id)

Idea.create(title: "Daily Tacos", inspiration: "Mad about being restricted to Taco Tuesdays", summary: "Provide tacos everyday for breakfast, lunch, and dinner. Plus snacks in between!", timeline_plan: "Right now!", action_steps_accomplished: "I've done absolutely nothing to accomplish this goal.", resources: "My kitchen", total_budgeted_dollars: 50, total_spent_dollars: 1, user_id: eel.id, category: "Food")



i_lazyman = Idea.create(title: "Lazy Man", inspiration: "Tom Sawyer", summary: "Trick other people into doing my work aka Outsourcing.", user_id: abe.id, category: "Get Rich Quick")
i_vd = Idea.create(title: "Venue Dee-contaminate", inspiration: "After being sequestered for months to deter the spread of Covid, people are reluctant to enter public establishments that could be contaminated with Covid.", summary: "A cleaning and sanitizing service that specializes in the rapid cleaning and dissenfecting of public places and private homes. We service businesses every night so they start each business day germ free.", user_id: dee.id, category: "Covid")
i_tbglove = Idea.create(title: "The Body Glove", inspiration: "Rubber barriers, like medical gloves, have protected humans from the spread of disease for decades. So extend that protection to full body coverage.", summary: "People sheltering in place for months during the pandemic, miss the touch of loved ones. So medical grade full body suits that enclose the entire body from head to toe, liberate people from their self-imposed imprisonment. People, once again, will have the freedom to go out in public spaces and hug loved ones without fear.", user_id: dee.id, category: "Covid")


i_tcdiet = bea.ideas.create(title: "The Cookie Diet", inspiration: "I only crave cookies.", summary: "Develop cookie dishes that serve up each meal in cookie form. So there will be savory as well as sweet cookies. To ensure your young picky eaters get their proper nutrition, try our delicious vegetable cookies.", category: "Food")

i_ihchef = cc.ideas.build(title: "In House Chef", inspiration: "In the midst of a pandemic, people are reluctant to go out to dine in restaurants. So we send a professional crew (medically tested covid-free chef & server] to serve you professional meals made fresh in your own home.", summary: "Medically tested professional chefs & servers will be paired with Venu Dee-contaminate certified homes to give families a fine dining experience in their own home.", category: "Covid, Food")
i_ihchef.save




# Transport







