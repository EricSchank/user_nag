module HomeHelper
  def nag_button
    button_tag({id: 'send_nags', class: 'waves-effect waves-light btn'}) do
      content_tag('i', 'email', class: 'material-icons right') + 'Send Nags'
    end
  end
end
