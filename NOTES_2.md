

IDEAS




name: "Elia",
email: "eel@email.com"
















****************************************************************
FILE: views/ideas/edit.erb

<h1>EDIT IDEA: <%= current_user.name %>!</h1>

<h3>Mandatory fields: Title, Category, Inspiration, and Summary</h3>
<form class="" method="POST" action="/ideas/<%= @idea.id %>">
    <input type="hidden" name="_method" value="patch" />

    <p><label for="title">Title</label>
    <input type="text" name="title" value="<%= @idea.title %>" placeholder="" /></p>
    <p><label for="category">Category</label>
    <input type="text" name="category" value="<%= @idea.category %>" /></p>
    <p><label for="inspiration">Inspiration</label>
    <input type="text" name="inspiration" value="<%= @idea.inspiration %>" /></p>
    
    <p><label for="summary">Summary</label>
    <textarea name="summary" style="width:auto; height:auto;"><%= @idea.summary %></textarea></p>
    <p><label for="timeline_plan">Timeline Plan</label>
    <input type="text" name="timeline_plan" value="<%= @idea.timeline_plan %>" /></p>
    <p><label for="action_steps_accomplished">Action Steps Accomplished</label>
    <input type="text" name="action_steps_accomplished" value="<%= @idea.action_steps_accomplished %>" /></p>
    
    <p><label for="resources">Resources</label>
    <input type="text" name="resources" value="<%= @idea.resources %>" /></p>
    <p><label for="total_budgeted_dollars">Total Budgeted Dollars</label>
    <input type="integer" name="total_budgeted_dollars" value="<%= @idea.total_budgeted_dollars %>" /></p>
    <p><label for="total_spent_dollars">Total Spent Dollars</label>
    <input type="integer" name="total_spent_dollars" value="<%= @idea.total_spent_dollars %>" /></p>
        
    <input type="submit" name="" value="Create" />
</form>

****************************************************************


