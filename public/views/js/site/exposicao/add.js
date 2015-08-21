/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    
    var host = window.location.hostname; 
    var urluploadfoto = 'http://localhost/gallery/public/exposicao/upload-capa-temp';
    
    $("#exposicao_nome").keyup(function() {           
        $("#exposicao-nome-pre").html($(this).val());
    });
    
    $("#exposicao_descricao").keyup(function() {           
        $("#exposicao-descricao-pre").html($(this).val());
    });
    
    jQuery("#form-exposicao-add").submit(function () {
        jQuery.blockUI({
            message: 'Processando...',
            css: {
                color: '#fff',
                backgroundColor: '#861002',
                border: '1px solid #fff'
            }
        });
        return true;
    });
    
    'use strict'; 
    
    jQuery('#exposicao_capa').fileupload({ 
        url: urluploadfoto, 
        dataType: 'json', 
        done: function (e, data) {
            alert(data.result.arquivo);
            setUploadedImageOnEditor(data.result.arquivo, true, false);            
            console.log(data.result);
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            jQuery('#progress .progress-bar').css('width', progress + '%');
        }
    });

    /*
    jQuery('#fileupload-update').fileupload({ 
        url: urluploadfoto,
        dataType: 'json', 
        done: function (e, data) { 
            setUploadedImageOnEditor(data.result.arquivo, true, false);            
            jQuery('#progress-update-container').html("");
            console.log(data.result);
        },
        progressall: function (e, data) { 
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress-update-container').html(progress + '%');
        } 
    }); 
    */
   
    //jQuery("#editor-nome").fitText(1.5);
    
    
});

function setUploadedImageOnEditor(arquivo, fit, config) { 

    var width = 1004; // 8.5 cm
    var height = 638; // 5.4 cm

    id = 'sample_picture_' + new Date().getTime(); 
    jQuery("#exposicao_capa_view .frame").html("<img id='" + id + "' src='" + "views/img/exposicao/capa/temp/" + arquivo + "?" + new Date().getTime() + "'>"); 

    jQuery("#exposicao_capa_view .frame img").eq(0).one("load", function() { 

        //jQuery("#figurinha-editor").css("display", "block"); 
        //jQuery("#figurinha-upload").css("display", "none"); 

    }).each(function() {
        if(this.complete) {
            $(this).load();
        }
    });

    // salva o nome do arquivo no campo hidden
    jQuery("#exposicao_capa").val(arquivo);

    console.log(config);

    jQuery("#" + id).load(function () { 
        picture = jQuery(this); 
        // Initialize plugin (with custom event) 
        if( config ) { 
            picture.guillotine({init: config, width: width, height: height, eventOnChange: 'guillotinechange'}); 
        } else { 
            picture.guillotine({width: width, height: height, eventOnChange: 'guillotinechange'}); 
        } 
        if( fit ) { 
            picture.guillotine('fit'); 
        } 

        // Display inital data 
        var data = picture.guillotine('getData');
        for (var key in data) {
            jQuery('#' + key).val(data[key]);
        }

        console.log(data);

        // Bind button actions
        jQuery('#rotate_left').click(function () {
            picture.guillotine('rotateLeft');
        });
        jQuery('#rotate_right').click(function () {
            picture.guillotine('rotateRight');
        });
        jQuery('#fit').click(function () {
            picture.guillotine('getData');
            picture.guillotine('fit');
        });
        jQuery('#zoom_in').click(function () {
            picture.guillotine('zoomIn');
        });
        jQuery('#zoom_out').click(function () {
            picture.guillotine('zoomOut');
        });

        // Update data on change
        picture.on('guillotinechange', function (ev, data, action) { 
            data.scale = parseFloat(data.scale.toFixed(4)); 
            for (var k in data) { 
                jQuery('#' + k).val(data[k]);
            } 
        }); 
    });

}
