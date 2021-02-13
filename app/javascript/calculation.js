function calculation (){
  const articleText = document.getElementById("item-price");
  if (!articleText){ return false;}
  articleText.addEventListener("keyup", () => { 
    const itemPrice = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${Math.floor(itemPrice.value * 0.1).toLocaleString() }`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${Math.ceil(itemPrice.value * 0.9).toLocaleString() }`;
  });
}

window.addEventListener("load",calculation);