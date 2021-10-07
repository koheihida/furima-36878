const pay = () => {
  Payjp.setPublicKey("pk_test_d0b01590b9334bf58b91a8dc");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    console.log(formResult)
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buys_address[number]"),
      cvc: formData.get("buys_address[cvc]"),
      exp_month: formData.get("buys_address[exp_month]"),
      exp_year: `20${formData.get("buys_address[exp_year]")}`,
    };


      console.log(card);


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("buy_number").removeAttribute("name");
      document.getElementById("buy_cvc").removeAttribute("name");
      document.getElementById("buy_exp_month").removeAttribute("name");
      document.getElementById("buy_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);