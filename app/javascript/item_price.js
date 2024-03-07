const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit");
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax;
    const profit = Math.floor(inputValue - tax);
    salesProfit.innerHTML = profit;
  })
};

addEventListener("turbo:load", price);
addEventListener("turbo:render", price);