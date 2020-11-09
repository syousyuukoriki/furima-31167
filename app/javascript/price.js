function price(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceBeforeTax = itemPrice.value;
    const tax = 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const priceAfterTax = priceBeforeTax * tax;
    addTaxPrice.innerHTML = Math.floor(priceAfterTax);
    profit.innerHTML = priceBeforeTax - Math.floor(priceAfterTax);
    
  });
}

window.addEventListener('load',price)