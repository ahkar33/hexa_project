/*
* data is real date , format is format of inputted date e.g (yy-mm-dd) or (dd-mm-dd) or (mm-yy-dd)
* now is only available for (2022-07-01) or (01-07-2022) or (07-20222-01) date , format
*/
const getPeriod = ( date = "" , format ) => {
    const obj = new Date();
    const inputArray = date.split("-");
    
    const curYear = obj.getFullYear();
    const curMonth = obj.getMonth() + 1;
    const curDay = obj.getDate();


    const getKeyFromFormat  = ( format ) => {
        let Key;

        switch( format ){
            case  "yy-mm-dd" : Key = {
                year : 0,
                month : 1,
                day : 2,
            };
            break;
            
            case  "mm-yy-dd" : Key = {
                year : 1,
                month : 0,
                day : 2
            };
            break;

            case "dd-mm-yy" : Key = {
                year : 2,
                month : 1,
                day : 0,
            };
            break;

            default : Key = "INVALID";
                            
        }

        return Key;
    }

    const getDifference = ( current , past  ) => {
        return Math.abs( current - past );
    }

    const getDaysFromYear = ( year = 0 ) => {
        return parseInt(year) * 365 ; 
    }

    const getDaysFromMonth = ( month = 0 ) => {
        return parseInt( month ) * 30;
    }

    const getResultFromDayDiff = ( days ) => {
        let result = "";

        switch( true ){
            case days == 0 : result = "Today" ; break;
            case days == 1 : result = `1 day ago`;break;
            case days == 30 || days < 60 : result = '1 month ago';break;
            case days > 60 && days < 365 :  result = `${Math.floor(days/30)} months ago`;break;
            case days == 365 : result = `1 year ago`;break;
            case days > 365 : result = `${Math.floor(days/365)} years ago`;break;
            default : result = `${days} days ago`;
        }

        return result;
    }

    const key = getKeyFromFormat(format);
    
    let year  = key == "INVALID" ? curYear : inputArray[key.year];
    let month = key == "INVALID" ? curMonth : inputArray[key.month];
    let day   = key == "INVALID" ? curDay : inputArray[key.day];

    let yearDiff = getDifference( parseInt(curYear) , parseInt(year) );
    let monthDiff =  getDifference( parseInt(curMonth) , parseInt(month) ) ;
    let dayDiff   = getDifference( parseInt(curDay) , parseInt(day) );

    let totalDayDiff = dayDiff + getDaysFromYear(yearDiff) + getDaysFromMonth(monthDiff);

    return getResultFromDayDiff(totalDayDiff);
  
}
