{$method->exe("staff","search_show")}
{if ($method->result == FALSE)}
    {$block->display("core:method_error")}
{else}
    {if $results == 1}
        {translate results=$results}search_result_count{/translate}
    {else}
        {translate results=$results}search_results_count{/translate}
    {/if}
  <BR>


  {literal}
    <script language="JavaScript">
    <!-- START
    	var module 		= 'staff';		
    	{/literal}
    	{if $VAR._print == TRUE}
    	var p 			= '&_escape=y&_print=y';
    	{else}
    	var p 			= '';
    	{/if}{literal}
    	var IMAGE 		= '{/literal}{$NONSSL_IMAGE}{literal}';
    	var order 		= '{/literal}{$order}{literal}';
    	var sort1  		= '{/literal}{$sort}{literal}';
    	var search_id 	= '{/literal}{$search_id}{literal}';
    	var page 		= {/literal}{$page}{literal};
    	var pages		= '{/literal}{$pages}{literal}';
    	var results		= '{/literal}{$results}{literal}';
    	var limit 		= '{/literal}{$limit}{literal}';
    	record_arr = new Array ({/literal}{$limit}{literal});
    	var i = 0;	
    //  END -->
    </script>
    <SCRIPT SRC="themes/{/literal}{$THEME_NAME}{literal}/search.js"></SCRIPT>
    {/literal}

    <!-- SHOW THE SEARCH NAVIGATION MENU -->
    <center><script language="JavaScript">document.write(search_nav_top());</script></center>

<!-- BEGIN THE RESULTS CONTENT AREA -->
<div id="search_results" onKeyPress="key_handler(event);">
 <table id="main1" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_background">
  <form id="form1" name="form1" method="post" action="">
    <tr>
      <td>
          <table id="main2" width="100%" border="0" cellspacing="1" cellpadding="2">
            <!-- DISPLAY THE SEARCH HEADING -->
            <tr valign="middle" align="center" class="table_heading"> 
              <td width="43" class="table_heading">&nbsp;</td>
              <td width="177" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=staff}field_nickname{/translate}{literal}','nickname'));
				 </script>
                {/literal}
              </td>
              <td width="199" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=staff}field_account_id{/translate}{literal}','account_id'));
				 </script>
                {/literal}
              </td>
              <td width="287" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=staff}field_notify_new{/translate}{literal}','notify_new'));
				 </script>
                {/literal}
              </td>
              <td width="248" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=staff}field_notify_change{/translate}{literal}','notify_change'));
				 </script>
                {/literal}
              </td>
              <!-- LOOP THROUGH EACH RECORD -->
              {foreach from=$staff item=record}
            <tr id="row{$record.id}" onClick="row_sel('{$record.id}',1);" onDblClick="window.location='?_page=staff:view&id={$record.id},';" onMouseOver="row_mouseover('{$record.id}', 'row_mouse_over_select', 'row_mouse_over');" onMouseOut="row_mouseout('{$record.id}', '{$record._C}', 'row_select');" class="{$record._C}"> 
              <td align="center" width="43"> 
                <input type="checkbox" name="record{$record.id}" value="{$record.id}" onClick="row_sel('{$record.id}',1,'{$record._C}');">
              </td>
              <td width="177">&nbsp; 
                {$record.nickname}
              </td>
              <td width="199">&nbsp; 
                {$record.account_id}
              </td>
              <td width="287">&nbsp; 
                {if $record.notify_new == "1"}
                {translate}
                true 
                {/translate}
                {else}
                {translate}
                false 
                {/translate}
                {/if}
              </td>
              <td width="248">&nbsp; 
                {if $record.notify_change == "1"}
                {translate}
                true 
                {/translate}
                {else}
                {translate}
                false 
                {/translate}
                {/if}
              </td>
            </tr>
            {literal}
            <script language="JavaScript">row_sel('{/literal}{$record.id}{literal}', 0, '{/literal}{$record._C}{literal}'); record_arr[i] = '{/literal}{$record.id}{literal}'; i++; </script>
            {/literal}
            {/foreach}
            <!-- END OF RESULT LOOP -->
          </table>
      </td>
    </tr>
  </form>
 </table>
{if $VAR._print != TRUE}<br>
<center>
<input type="submit" name="Submit" value="{translate}view_edit{/translate}" 	onClick="mass_do('', module+':view', limit, module);" 		class="form_button">
<input type="submit" name="Submit" value="{translate}delete{/translate}" 		onClick="mass_do('delete', module+':search_show&search_id={$search_id}&page={$page}&order_by={$order}&{$sort}', limit, module);" class="form_button">
<input type="submit" name="Submit" value="{translate}select_all{/translate}" 	onClick="all_select(record_arr);" 		class="form_button">
<input type="submit" name="Submit" value="{translate}deselect_all{/translate}" 	onClick="all_deselect(record_arr);" 	class="form_button">
<input type="submit" name="Submit" value="{translate}range_select{/translate}" 	onClick="all_range_select(record_arr,limit);" class="form_button">
<br>
</center>
{/if}
{/if}
</div>
