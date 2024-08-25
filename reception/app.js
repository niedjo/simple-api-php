
let donnees = document.querySelector('.donnees')

const recuperer = async () => {
    fetch("http://localhost/the%20bigest%20developper/php/API/on%20recree%20une%20API/index.php")
   .then(data => data.json() )
   .then((body) => {
    donnees.innerText = JSON.stringify(body["produits"]);
    // donnees.insertAdjacentHTML("beforeend", body["produits"]);
   })
}

recuperer();