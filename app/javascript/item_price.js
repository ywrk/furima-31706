window.addEventListener('load', () => {
   const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
   console.log(addTaxDom.innerHTML);
   const profit = document.getElementById("profit");
   profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
   console.log(profit.innerHTML);
   })
 });
