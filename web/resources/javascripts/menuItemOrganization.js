

$(function () {
    var currentRequestsAfterShow=${requestsCount}-(${pageNumber}+1)*15;
    function hasNext() {
        if(currentRequestsAfterShow>0)
        {
            currentRequestsAfterShow-=15;
            return true;
        }
        else return false;
    }


})