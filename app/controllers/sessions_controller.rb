<div>
<% if flash [:alert] %>
<p id ="notice"><%= flash [:alert] %></p>
<% end %>
<%= form_tag do %>
    <fieldset>
    <legend> please  Log in </legend>
    </div>
    <%= label_tag:name, "name" %>
    <%= text_field_tag :name, params[:name] %>
    <%= password_field_tag:password, params[:password] %>
     <%= text_field_tag :password, params[:passwords] %>
    </div>
    <div>
    <%= submit_tag "login" %>
    </div>
    </fieldset>
    <% end %>
    </div>