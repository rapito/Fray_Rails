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
            var sliders = $('.wslider');
            var inputs = $('.slider-weight');
            for(var i=0;i<sliders.length;i++)
            {
                inputs[i].value = getSliderValue(i);

            }
        });

    $('.slider-weight').change(function()
    {
        var sliders = $('.wslider');
        var inputs = $('.slider-weight');
        for(var i=0;i<sliders.length;i++)
        {
            var sl = $(sliders[i]);
            sl.slider('setValue',inputs[i].value);

        }
    });


//            var sliders = $('.wslider');
//
//            for(var i =0;i<sliders.length;i++)
//            {
//                var sl = $(sliders[i]);
//                console.log();
//                if(sliders[i]!=this)
//                {
//
//                    var val = getSliderValue(i);
//                    var amount = 0.005;
//                    if(val<this.value)
//                    {
//                        sl.slider('setValue',val-amount);
//                    }
//                    else if(getSliderValue(i)>this.value)
//                    {
//                        sl.slider('setValue',val+amount);
//                    }
//                }
//            }
//        });


});

var getSliderValue = function(i)
{
    return parseFloat(parseFloat($('.tooltip-inner')[i].innerHTML).toFixed(4));
}

var assignLectureToAddStudentForm = function(val)
{
    $('#student_group_id').attr('value',val);
}

var assignWeightToGrade = function(val)
{
    $('#weight_grade_id').attr('value',val);
}

var checkValues = function()
{
    var sliders = $('.slider-weight');
    var accum = 0;
    for(var i =0;i<sliders.length;i++)
    {
        accum += parseFloat($(sliders[i]).html());
    }

    if(accum<1) return false;
    else return true;
}
