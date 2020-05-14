class Tax{
  String taxType;
  String industry;
  String industryName;
  String taxYear;
  String taxMonth;
  String character;

  Tax({
    this.taxType,
    this.industry,
    this.industryName,
    this.taxYear,
    this.taxMonth,
    this.character
  });


}
//taxmoney data

class TaxMoney{
  String totalSales;
  String netProfitBeforeTax;
  String chargeableProfit;
  String taxReturn;
  String dateIssued;

  TaxMoney({
    this.totalSales,
    this.netProfitBeforeTax,
    this.chargeableProfit,
    this.taxReturn,
    this.dateIssued,
  });
}