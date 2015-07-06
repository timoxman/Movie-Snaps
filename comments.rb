# jquery

  # $('.comment-form').hide();

  # $('.comment-link').click(function() {
  #   $('.comment-form').hide(1000);
  #   $(this).next('.comment-form').slideToggle(1000);
  # })

  # view

  # <button class='comment-link'>Comment</button>
  #     <div class='comment-form'><%= form_for [p, @comment] do |f| %>
  #       <%= f.text_area :remark %>
  #       <%= f.submit 'Submit' %>
  #     <% end %></div>
  #   <% end %>
  #   <% p.comments.each do |c| %>
  #     <li><%= c.remark %><i> <%= c.user.name %> </i></li>
  #     <br>
  #   <% end %>