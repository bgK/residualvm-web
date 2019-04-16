{foreach from=$downloads item=dsection name=downloads_loop}
	{if $dsection->getAnchor() != ''}
		<a name="{$dsection->getAnchor()}"></a>
	{/if}
	<div class="box">
		<div class="head">{eval var=$dsection->getTitle()}</div>

		{if $smarty.foreach.downloads_loop.first}
		<div class="intro">
			<div class="navigation">
				<h2>Navigation</h2>
				<ul>
				{foreach from=$sections item=arr}
					<li><a href="downloads/#{$arr.anchor}">{eval var=$arr.title}</a></li>
				{/foreach}
				</ul>
			</div>
			<div class="text">
				<p>
					Downloads are mostly hosted with SourceForge.net. If you have one of the supported systems, you can directly
					download the appropriate binary distribution. If you have another system, download the source and read the
					<a href="https://github.com/residualvm/residualvm/blob/{$release}/README.md">README</a>
					file for directions on how to build ResidualVM.
					If you have successfully ported ResidualVM to a platform not listed, please drop us a note, telling which OS, etc.
					you used.
				</p>

				<ul>
					<li>
						The latest STABLE release of ResidualVM is {$release}, and can be downloaded below
						under '<a href="downloads/#stable">Release Binaries</a>'. If you run Windows
						and are confused, download the 'Windows Installer'.
					</li>

					<li>
						For UNSTABLE experimental versions of ResidualVM (for people who know what they
						are doing), please see the <a href="downloads/#daily">Daily Builds</a>
						section.
					</li>
				</ul>
			</div>
			<div class="spacing"></div>
		</div>

		<!-- Recommended download - start -->
		<script type="text/javascript">
			{$recommendedDownloadsJS}
		</script>
		<script type="text/javascript" src="javascripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="javascripts/recommended_dl.js"></script>
		
		<div class="subhead" id="recommendedDownloadHeader" style="display:none">Recommended download for your system</div>
		<div class="subhead-content" style="display:none">
			<div id="downloadContainer" style="display:none">
			</div>
		</div>
			
		<br>
		<!-- Recommended download - end -->

		{/if}

		{foreach from=$dsection->getSubSections() item=dsubsection}
			{if $dsubsection->getAnchor() != ''}
				<a name="{$dsubsection->getAnchor()}"></a>
			{/if}
			{if $dsubsection->getTitle() != ''}
				<div class="subhead">{eval var=$dsubsection->getTitle()}</div>
			{/if}

			<div class="subhead-content">
				{if $dsubsection->getNotes() != ''}
					{eval var=$dsubsection->getNotes()}
				{/if}

				{include file='list_items.tpl' list=$dsubsection->getItems()}
				{if !is_null($dsubsection->getFooter())}
					<p>{$dsubsection->getFooter()}</p>
				{/if}
			</div>
		{/foreach}
	</div>
{/foreach}
