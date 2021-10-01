window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item_price");
  priceInput.addEventListener("input", () => {
    const fee = item_price.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const TotalProfit = item_price.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${TotalProfit}`;
  })
})