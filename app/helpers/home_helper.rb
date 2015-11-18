module HomeHelper
  def nag_button(single_ticket=false)
    poke = 'Poke'
    poke = poke.pluralize unless single_ticket
    button_tag({id: 'send_nags', class: 'waves-effect waves-light btn'}) do
      content_tag('i', 'email', class: 'material-icons right') + "Send #{poke}"
    end
  end
end
