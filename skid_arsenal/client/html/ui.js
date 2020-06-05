function display(bool) {
    if (bool) {
        document.querySelector('.container').style.display = ''; //mostra 
    } else {
        document.querySelector('.container').style.display = 'none'; //esconde
    }
}

display(false)


function comprarObjeto(objeto) {
    fetch('http://skid_arsenal/gun', {  //função que passa o callback (gun no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            arma: objeto //atribui o valor do objeto a "arma" que é passado ao client
        })
    })
}

addEventListener('message', function(event) //recebe a msg do client
{
    var item = event.data;  //data é a variável que está na function do client

    if (item.type === "ui") // type enviado pelo client
    {
        if (item.status == true){ //status enviado pelo client

                const caralho = document.querySelectorAll('.clickbutton') // constante caralho recebe todos os elementos com o ID
                for(var pinto of caralho) //variavel pinto tá recebendo todos os valores de caralho
                {
                        pinto.addEventListener('click', function() //adiciona um evento de "escuta", o click em todas os elementos que estavam na variavel caralho
                        {
                            comprarObjeto(this.id) //função comprar objeto recebe id do HTML       
                        }
                        
                    )
                }
                display(true) //seta display como true
        } else {
            display(false) //seta display como false
        }             
    } 
})


function closeNUI() {
    fetch('http://skid_arsenal/fechar', {
        method: 'POST',
        body: JSON.stringify({
       
        })
    })
    
    display(false)
    window.location.reload()
}


document.onkeyup = function (event){
    if (event.which == 27){
        closeNUI()
    }
}
