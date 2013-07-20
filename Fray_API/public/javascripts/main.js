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

    $('.wslider').slider('setValue',0)
        .on('slide', function(ev){
            slidee(this);
        });
    setInterval(function(){
        var sliders = $('.wslider');

        for(var i =0;i<sliders.length;i++)
        {
            var sl = $(sliders[i]);
//            console.log ( sl.slider('isDragged') );
            if(sl.slider('isDragged') == true)
            {
                console.log(5);
            }
        }
    },1)

});

var slidee = function(x)
{
    var sliders = $('.wslider');

    for(var i =0;i<sliders.length;i++)
    {
        var sl = $(sliders[i]);
        if(sliders[i]!=x)
        {

            if(sl.slider('getValue')>this.value)
            {
                sl.slider('reduceValue');
            }
        }
    }
}

var assignLectureToAddStudentForm = function(val)
{
    $('#student_group_id').attr('value',val);
}

var assignWeightToGrade = function(val)
{
    $('#weight_grade_id').attr('value',val);
}

