module HomeHelper
  def nag_button(single_ticket=false)
    nag = 'Nag'
    nag = nag.pluralize unless single_ticket
    button_tag({id: 'send_nags', class: 'waves-effect waves-light btn'}) do
      content_tag('i', 'email', class: 'material-icons right') + "Send #{nag}"
    end
  end
end
