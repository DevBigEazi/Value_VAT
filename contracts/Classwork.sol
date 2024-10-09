// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract BaseStore {
  // uint32 plateOfrice ;
  // uint32 tableBottle;
  // uint32 burger;
  // uint32 shawarma;  

  function locationPrices() public view virtual returns (uint32, uint32, uint32, uint32) {
    uint32 plateOfrice = 4000;
    uint32 tableBottle = 200;
    uint32 burger = 1500;
    uint32 shawarma = 2300;

    return (plateOfrice, tableBottle, burger, shawarma);
  }
}

contract IkoroduStore is BaseStore {
    function locationPrices() public view virtual override  returns (uint32, uint32, uint32, uint32) {
      uint32 plateOfrice = 4000 * 10;
      uint32  tableBottle = 200 * 10;
      uint32 burger = 1500 * 10;
      uint32 shawarma = 2300 *10;

      BaseStore.locationPrices();
      
      return (plateOfrice, tableBottle, burger , shawarma) ;
    }
}

contract MainlandStore is IkoroduStore {
  function locationPrices() public view virtual override returns (uint32, uint32, uint32, uint32){
    uint32 plateOfrice = 4000 * 15;
    uint32 tableBottle = 200 * 15;
    uint32 burger = 1500 * 15;
    uint32 shawarma = 2300 * 15;

    IkoroduStore.locationPrices();

    return (plateOfrice, tableBottle, burger, shawarma);
  }
}

contract VIStore is BaseStore, IkoroduStore, MainlandStore {
  function locationPrices() public view virtual override(BaseStore, IkoroduStore, MainlandStore) returns (uint32, uint32, uint32, uint32) {
      
    (uint32 plateOfrice, uint32 tableBottle, uint32 burger, uint32 shawarma) = super.locationPrices();

    plateOfrice *= 25;
    tableBottle *= 25;
    burger *= 25;
    shawarma *= 25;

    MainlandStore.locationPrices();

    return (plateOfrice, tableBottle, burger, shawarma);
  }
}

