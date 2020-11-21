window.addEventListener('load', () => {
   const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   inputValue;
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
   addTaxDom.innerHTML;
   const profit = document.getElementById("profit");
   profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
   profit.innerHTML;
   })
 });
