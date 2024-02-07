sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'stockinformation/stockdata/test/integration/FirstJourney',
		'stockinformation/stockdata/test/integration/pages/StoreList',
		'stockinformation/stockdata/test/integration/pages/StoreObjectPage'
    ],
    function(JourneyRunner, opaJourney, StoreList, StoreObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('stockinformation/stockdata') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStoreList: StoreList,
					onTheStoreObjectPage: StoreObjectPage
                }
            },
            opaJourney.run
        );
    }
);