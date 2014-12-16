<%@page import="com.vionto.vithesaurus.*" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main" />
  <g:set var="preventSearchFocus" value="true" scope="request" />
  <title><g:message code="powersearch.title" /></title>
  <g:render template="/taggingIncludes" model="${[readOnly: false, tagLimit: 1, placeholderText: message(code: 'powersearch.tag.placeholder')]}"/>
  <script type="text/javascript">
    $(document).ready(function() {
      var form = $('#powerSearchForm');
      form.submit(function() {
          new jQuery.ajax($(this).attr('action'),
              {
                data: $(this).serialize()
              }).
            done(function(msg){ $('#powerSearchResult').html(msg); }).
            fail(function(jqXHR, textStatus, errorThrown){ $('#powerSearchResult').html(jqXHR.responseText); });
          return false;
      });
      if (form.find('input[name="contains"]').val() || form.find('input[name="startsWith"]').val() ||
          form.find('input[name="endsWith"]').val() || form.find('select[name="level"]').val() !== 'null' ||
          form.find('select[name="category"]').val() !== 'null' || form.find('input[name="tags"]').val()) {
        // useful to keep the back button working (except the current page status):
        form.submit();
      }
    });
  </script>
</head>
<body>

<hr/>

<noscript class="warning">
    <g:message code="powersearch.noscript"/>
</noscript>

  <h2><g:message code="powersearch.headline" /></h2>

  <div style="float:left;margin-right: 35px">
    <g:render template="searchform"/>
  </div>

  <div style="float:left; max-width: 355px">
    <div id="powerSearchResult"></div>
  </div>

  <div style="clear: both"></div>

</body>
</html>
