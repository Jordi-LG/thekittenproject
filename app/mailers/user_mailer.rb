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

  def after_order(joinorderitem)


    @order = joinorderitem.order
    @user = joinorderitem.order.user
    @item_image = joinorderitem.item.image_url
    @item_title = joinorderitem.item.title
    @item_description = joinorderitem.item.description
    @user = User.find(@user.id)
  	mail(to: @user.email, subject: 'Merci pour votre commande')
  	
  end

  def admin_alert(joinorderitem)
  	@order = joinorderitem.order
  	@user = joinorderitem.order.user
  	mail(to: "terence@yopmail.com", subject: 'Une nouvelle commande a été validé')
  end
end
