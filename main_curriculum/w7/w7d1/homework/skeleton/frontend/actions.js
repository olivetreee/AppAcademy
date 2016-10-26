// export const SWITCH_CURRENCY = "SWITCH_CURRENCY";

export const selectCurrency = (baseCurrency, rates) => ({
  type: "SWITCH_CURRENCY",
  baseCurrency: baseCurrency,
  rates: rates
})
