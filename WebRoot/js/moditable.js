/**
 * 
 */

function editRow(obj){
        var editRow=obj.parentNode.parentNode;
        var editCols=editRow.cells;
        var txt1=editCols[2].innerHTML;
        editCols[2].innerHTML="<input type='text' value='"+txt1+"'>";
        var txt2=editCols[3].innerHTML;
        editCols[3].innerHTML="<input type='text' value='"+txt2+"'>";
        var txt3=editCols[4].innerHTML;
        editCols[4].innerHTML="<input type='text' value='"+txt3+"'>";
        var txt4=editCols[5].innerHTML;
        editCols[5].innerHTML="<input type='text' value='"+txt4+"'>";
        obj.value="±£´æ";
        obj.setAttribute("onclick","saveRow('this')");
    }
    function saveRow(obj){
        var saveRow=document.getElementById(rowid);
        var saveCols=saveRow.cells;
        var txt1=saveCols[2].firstElementChild.value;
        saveCols[2].innerHTML=txt1;
        var txt2=saveCols[3].firstElementChild.value;
        saveCols[3].innerHTML=txt2;
        var txt3=saveCols[4].firstElementChild.value;
        saveCols[4].innerHTML=txt3;
        var txt3=saveCols[5].firstElementChild.value;
        saveCols[5].innerHTML=txt3;
        obj.value="ÐÞ¸Ä";
        obj.setAttribute("onclick","editRow('this')");
    }