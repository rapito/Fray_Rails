/**
 * Created with JetBrains RubyMine.
 * User: Robert Peralta
 * Date: 7/4/13
 * Time: 6:25 PM
 * To change this template use File | Settings | File Templates.
 */
$().ready(function()
{
    //Set Table class for Design
    $('table').attr('class','table table-striped table-hover table-condensed');
    //Set Table links classes
    $('td a').attr('class','btn btn-mini');
    $('td a[data-method = "delete"]').attr('class','btn btn-mini btn-danger');

    //Set Form Button Style
    $('input[name = "commit"]').attr('class','btn btn-primary');
//    $('#fray_header div>ul>a').attr('class','btn');

//    Set Styles to error explanation div on forms

    $('#error_explanation h2').attr('class','alert alert-error');
    $('#error_explanation ul li').attr('class','alert alert-error');

});

var assignLectureToAddStudentForm = function(val)
{
    $('#student_lecture_id').attr('value',val);
}