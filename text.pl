:- module(text, [mesajIncarcare/1,
                eroareIncarcare/1,
                mesajViata/1,
                eroareAjutor/1,
                eroareComanda/1]).

mesajIncarcare("Joc încărcat!\n").
eroareIncarcare("Această versiune nu a putut fi încărcată!\n").
mesajViata('Situația sănătății curente: ').
eroareAjutor('Pentru nivelul imposibil nu există ajutor!\n').
eroareComanda('Comandă inexistentă!\n').