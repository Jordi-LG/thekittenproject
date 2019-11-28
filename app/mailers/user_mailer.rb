class UserMailer < ApplicationMailer
  default from: 'no-reply@thekittenproject.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'no-reply@thekittenproject.com'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def after_order(email, order)

        @current_order = order
       
  	mail(to: email, subject: 'Merci pour votre commande')
  	
  end

  def admin_alert(current_user, order)

    @user = current_user
  	@order = order
  	mail(to: "terence@yopmail.com", subject: 'Une nouvelle commande a été validé')
  end
end
