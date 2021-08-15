tableextension 50500 CreditLimitExtension extends Customer
{
    fields
    {
        // lisan mingid väljad siia
    }
    procedure UpdateCreditLimit(NewCreditLimit: Decimal)
    begin
        NewCreditLimit := Round(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;

    procedure CalculateCreditLimit() value: Decimal
    var
        Cust: Record "Customer";
    begin
        Cust := Rec;
        Cust.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Cust.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Cust."Sales (LCY)" * 0.5));

    end;


    var

}