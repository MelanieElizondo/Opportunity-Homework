trigger OpportunityTrigger on Account(After Insert){
    List<Opportunity> LstOpp =  new list<Opportunity>();
    For(Account Acc : Trigger.New){
    Opportunity Opp = New Opportunity();
    Opp.Name= Acc.name+' Opportunity';
    Opp.CloseDate = System.Today();
    Opp.StageName = 'Prospecting';
    Opp.AccountId = Acc.id;
    
        //conditions
        //red
        if(Acc.AnnualRevenue < 10000){
            Opp.Color__c = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Solid_red.svg/512px-Solid_red.svg.png?20150316143248';
        }
        // yellow
        if(Acc.AnnualRevenue > 10000 && Acc.AnnualRevenue < 30000){
            Opp.Color__c = 'https://cdn11.bigcommerce.com/s-3uewkq06zr/images/stencil/1280x1280/products/290/376/lemon_yellow__57845.1494606072.png?c=2';
        }
        // green
        if(Acc.AnnualRevenue > 30000){
            Opp.Color__c = 'https://www.formica.com/en-us/-/media/formica/global/products/swatch-images/07897/07897-swatch.jpg?rev=cd9de0f7c1e14560b042331f2689664e';
        }
        // orange
        if(Acc.Register_Date__c < Date.today()){
            Opp.Color__c = 'https://static.wikia.nocookie.net/aesthetics/images/0/0f/Orange_Texture.jpg/revision/latest?cb=20201105144209';
        }

    LstOpp .Add(Opp);
    }
    If(LstOpp.Size()>0){
        Insert LstOpp;
    }
}
