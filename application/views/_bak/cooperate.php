<?$this->view('header')?>
<div class="l w-710">
	<div class="hd_map">
		<a href="{WIKI_URL}"><?=$setting['site_name']?></a> &gt;&gt; <a href="{url doc-cooperate}">{lang cooperatedoc}</a></div>
	<div class="m-t10 dws_list">	
	<ul>
	<!--{loop $coopdoc $cooperatedoc}-->
	<li><a href="{url doc-innerlink-{eval echo rawurlencode(string::hiconv(<?=$cooperatedoc['title']?>, 'utf-8'))}}" target="_blank" title="<?=$cooperatedoc['title']?>"><?=$cooperatedoc['title']?></a></li>
	<!--{/loop}-->
	</ul>
	</div>
</div>
<div class="r w-230">
<div class="m-t10 columns">
<h2 class=" m-t10 m-lr8"><img alt="" src="style/dwsct_tit.gif"/></h2>
<p class="col-p">{lang cooperatedocTip1}</p>
<p class="col-p">{lang cooperatedocTip2}</p>
<p class="col-p">{lang cooperatedocTip3}</p>
</div>
<div id="block_right">{block:right/}</div>
</div>
<div class="c-b"></div>
<?$this->view('footer')?>

