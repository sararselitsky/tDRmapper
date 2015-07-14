


<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>TDRmapper/README.md at master · sararselitsky/TDRmapper</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="sararselitsky/TDRmapper" name="twitter:title" /><meta content="TDRmapper - tRNA-derived RNA alignment pipeline" name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/10501967?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/10501967?v=3&amp;s=400" property="og:image" /><meta content="sararselitsky/TDRmapper" property="og:title" /><meta content="https://github.com/sararselitsky/TDRmapper" property="og:url" /><meta content="TDRmapper - tRNA-derived RNA alignment pipeline" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="web-socket" href="wss://live.github.com/_sockets/MTA1MDE5Njc6ZTNjZWIwODMxMzZiNTBjNmU4NDkzNDQ2NDRiNmRmNTk6N2EyNzFhNWVkN2EyNzhhNTVlM2E0ZWMwYTdkNjNjOGZlODIzNjFmMGYzOGMxNDRmYzYxYjgyZjYzN2Q3ZDJlMg==--b55b60bdd28027d7fedfd8fa1619df1327a02b98">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

        <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="6B0F3B4F:0FA2:83EC6B0:55A54A62" name="octolytics-dimension-request_id" /><meta content="10501967" name="octolytics-actor-id" /><meta content="sararselitsky" name="octolytics-actor-login" /><meta content="ff426d7a9db2a7d8b4040e32c4976efc15e61642afb5ef09b9693d75dcd59d63" name="octolytics-actor-hash" />
    
    <meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />
    <meta class="js-ga-set" name="dimension1" content="Logged In">
    <meta name="is-dotcom" content="true">
      <meta name="hostname" content="github.com">
    <meta name="user-login" content="sararselitsky">

      <link rel="icon" sizes="any" mask href="https://assets-cdn.github.com/pinned-octocat.svg">
      <meta name="theme-color" content="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="SpylF1bME8ON9pv8E9iChUeonZ11tFfZfNiRRTzFty6Ng6qvx8UNv85sfcpOIYEpHbHwErdih9xCRGXddgVVHQ==" name="csrf-token" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github/index-8824a5ef57ac4ae0b5ca429778b9660b1c66d09deea2ff11681de18d86a4bbb1.css" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2/index-f0d033a37796c27f6b5b24aa8dc21af9c206a51ed2fe782d660dc20267c17d2b.css" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="3f58d2288e653bc3998db56bf3ad89c7">

      
  <meta name="description" content="TDRmapper - tRNA-derived RNA alignment pipeline">
  <meta name="go-import" content="github.com/sararselitsky/TDRmapper git https://github.com/sararselitsky/TDRmapper.git">

  <meta content="10501967" name="octolytics-dimension-user_id" /><meta content="sararselitsky" name="octolytics-dimension-user_login" /><meta content="34063762" name="octolytics-dimension-repository_id" /><meta content="sararselitsky/TDRmapper" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="34063762" name="octolytics-dimension-repository_network_root_id" /><meta content="sararselitsky/TDRmapper" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/sararselitsky/TDRmapper/commits/master.atom" rel="alternate" title="Recent Commits to TDRmapper:master" type="application/atom+xml">

  </head>


  <body class="logged_in  env-production macintosh vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      



        <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/sararselitsky/TDRmapper/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
      </div>

      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item">
      <span class="js-socket-channel js-updatable-content"
        data-channel="notification-changed:sararselitsky"
        data-url="/notifications/header">
      <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
          <span class="mail-status all-read"></span>
          <span class="octicon octicon-inbox"></span>
</a>  </span>

  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new..."
       data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus left"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>


  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="sararselitsky/TDRmapper">This repository</span>
  </div>
    <a class="dropdown-item" href="/sararselitsky/TDRmapper/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>
    <a class="dropdown-item" href="/sararselitsky/TDRmapper/settings/collaboration" data-ga-click="Header, create new collaborator">
      New collaborator
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-s js-menu-target" href="/sararselitsky"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@sararselitsky" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/10501967?v=3&amp;s=40" width="20" />
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu dropdown-menu-sw">
        <div class="dropdown-header header-nav-current-user css-truncate">
          Signed in as <strong class="css-truncate-target">sararselitsky</strong>
        </div>
        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/sararselitsky" data-ga-click="Header, go to profile, text:your profile">
          Your profile
        </a>
        <a class="dropdown-item" href="/stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>
        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
          Settings
        </a>

        <form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="hTcpEngw2UofUV1JOkCoYDDuEn13j33T6kierlT8r6ioHqfXZVcec8JmN+VUH4kojISdQc8sVpaOx8JpbDSwtA==" /></div>
          <button class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
            Sign out
          </button>
</form>      </div>
    </div>
  </li>
</ul>


    
  </div>
</div>

        

        


      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">

        
<ul class="pagehead-actions">

  <li>
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="5CoumcjXagc7+tGUox+kEhVyMUkUp5O2G4RGp96Ye8OR8T1KuN5wG52Bt/E6UvG+b/+2ok6YWiL9CJbh6Hu0gw==" /></div>    <input id="repository_id" name="repository_id" type="hidden" value="34063762" />

      <div class="select-menu js-menu-container js-select-menu">
        <a href="/sararselitsky/TDRmapper/subscription"
          class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
          data-ga-click="Repository, click Watch settings, action:blob#show">
          <span class="js-select-button">
            <span class="octicon octicon-eye"></span>
            Unwatch
          </span>
        </a>
        <a class="social-count js-social-count" href="/sararselitsky/TDRmapper/watchers">
          1
        </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
            <div class="select-menu-header">
              <span class="select-menu-title">Notifications</span>
              <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
            </div>

            <div class="select-menu-list js-navigation-container" role="menu">

              <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                <span class="select-menu-item-icon octicon octicon-check"></span>
                <div class="select-menu-item-text">
                  <input id="do_included" name="do" type="radio" value="included" />
                  <span class="select-menu-item-heading">Not watching</span>
                  <span class="description">Be notified when participating or @mentioned.</span>
                  <span class="js-select-button-text hidden-select-button-text">
                    <span class="octicon octicon-eye"></span>
                    Watch
                  </span>
                </div>
              </div>

              <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                <span class="select-menu-item-icon octicon octicon octicon-check"></span>
                <div class="select-menu-item-text">
                  <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                  <span class="select-menu-item-heading">Watching</span>
                  <span class="description">Be notified of all conversations.</span>
                  <span class="js-select-button-text hidden-select-button-text">
                    <span class="octicon octicon-eye"></span>
                    Unwatch
                  </span>
                </div>
              </div>

              <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                <span class="select-menu-item-icon octicon octicon-check"></span>
                <div class="select-menu-item-text">
                  <input id="do_ignore" name="do" type="radio" value="ignore" />
                  <span class="select-menu-item-heading">Ignoring</span>
                  <span class="description">Never be notified.</span>
                  <span class="js-select-button-text hidden-select-button-text">
                    <span class="octicon octicon-mute"></span>
                    Stop ignoring
                  </span>
                </div>
              </div>

            </div>

          </div>
        </div>
      </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/unstar" class="js-toggler-form starred js-unstar-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="dCUSFnN4Mq9xbw8yiEvZ1sfpj9WnIyYiCPLBcSwz5advQrEmunh2AbgiILUFdWSdQgK61fI9NwgDLHRPeht3rw==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar sararselitsky/TDRmapper"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/sararselitsky/TDRmapper/stargazers">
          0
        </a>
</form>
    <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/star" class="js-toggler-form unstarred js-star-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="On0N+BjZ1vgbYKp8qZxaPfXlbRb5fx9ZOneYY/7F0YP77eoCPo6IbC9M5raTScrzgWoZ5thEmIyyDQqvG00ESA==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star sararselitsky/TDRmapper"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/sararselitsky/TDRmapper/stargazers">
          0
        </a>
</form>  </div>

  </li>

        <li>
          <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/fork" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="a9F2KphdAkW9J1/gk+MSKrTMzpQCwt2fyGNvy7xsu+U9ObfCYCZ1fngonMMJAr7NLwbknsGK1OlUUuAwztCOrw==" /></div>
            <button
                type="submit"
                class="btn btn-sm btn-with-count"
                data-ga-click="Repository, show fork modal, action:blob#show; text:Fork"
                title="Fork your own copy of sararselitsky/TDRmapper to your account"
                aria-label="Fork your own copy of sararselitsky/TDRmapper to your account">
              <span class="octicon octicon-repo-forked"></span>
              Fork
            </button>
            <a href="/sararselitsky/TDRmapper/network" class="social-count">0</a>
</form>        </li>

</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/sararselitsky" class="url fn" itemprop="url" rel="author"><span itemprop="title">sararselitsky</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/sararselitsky/TDRmapper" data-pjax="#js-repo-pjax-container">TDRmapper</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/sararselitsky/TDRmapper/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/sararselitsky/TDRmapper" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /sararselitsky/TDRmapper">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/sararselitsky/TDRmapper/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /sararselitsky/TDRmapper/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/sararselitsky/TDRmapper/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /sararselitsky/TDRmapper/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Wiki">
        <a href="/sararselitsky/TDRmapper/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g w" data-selected-links="repo_wiki /sararselitsky/TDRmapper/wiki">
          <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/sararselitsky/TDRmapper/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /sararselitsky/TDRmapper/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/sararselitsky/TDRmapper/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /sararselitsky/TDRmapper/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Settings">
        <a href="/sararselitsky/TDRmapper/settings" aria-label="Settings" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_settings repo_branch_settings hooks /sararselitsky/TDRmapper/settings">
          <span class="octicon octicon-tools"></span> <span class="full-word">Settings</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>
</nav>

              <div class="only-with-full-nav">
                  
<div class="js-clone-url clone-url open"
  data-protocol-type="http">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/sararselitsky/TDRmapper.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="ssh">
  <h3><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="git@github.com:sararselitsky/TDRmapper.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="subversion">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/sararselitsky/TDRmapper" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<div class="clone-options">You can clone with
  <form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=http&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="0RAQTkDwvvK2jC/wJwy+mVd8htmYwXIztyrRTfX85gHZO2IzevXyyGicbDBRZHmkozSLSrsM7DNu/Ixun4zxjA==" /></div><button class="btn-link js-clone-selector" data-protocol="http" type="submit">HTTPS</button></form>, <form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="CCv+u9Gv4ey19uYylCZdMjboq8f2AK746p+ddJHMBJPnihA1smg7O4WFr9s3Hvlz1osWJ8PIOrSUWnYfXXpDCA==" /></div><button class="btn-link js-clone-selector" data-protocol="ssh" type="submit">SSH</button></form>, or <form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="nUSaIA5/61jH8vvlQJC/wZJJ/RYxG7HXYn4hBv6J0Nl80hPHThObu0+P6FXz4LOldEHttgqy0v1/sjd9nFGV2A==" /></div><button class="btn-link js-clone-selector" data-protocol="subversion" type="submit">Subversion</button></form>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</div>

  <a href="https://mac.github.com" class="btn btn-sm sidebar-button" title="Save sararselitsky/TDRmapper to your computer and use it in GitHub Desktop." aria-label="Save sararselitsky/TDRmapper to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>



                <a href="/sararselitsky/TDRmapper/archive/master.zip"
                   class="btn btn-sm sidebar-button"
                   aria-label="Download the contents of sararselitsky/TDRmapper as a zip file"
                   title="Download the contents of sararselitsky/TDRmapper as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>

          

<a href="/sararselitsky/TDRmapper/blob/77274b49c54836fa0a553cb598b2f1e2a9e17bb9/README.md" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:44a66a3eb47f36e7c010e1cbe9368b78 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Find or create a branch…" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/sararselitsky/TDRmapper/blob/master/README.md"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="aL4AuJdUiQS7wg5wcAuYO6r0POXPoomqa4E1RUU/6lu3dYzEbeSxU1mkRPgdzjmuCwdWvjXBzSdK14dsAPzWUA==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <span class="select-menu-item-heading">Create branch: <span class="js-new-item-name"></span></span>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="README.md">
</form>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/sararselitsky/TDRmapper/find/master"
          class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/sararselitsky/TDRmapper" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">TDRmapper</span></a></span></span><span class="separator">/</span><strong class="final-path">README.md</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="@sararselitsky" class="avatar" height="24" src="https://avatars2.githubusercontent.com/u/10501967?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/sararselitsky" rel="author">sararselitsky</a></span>
        <time datetime="2015-07-14T16:50:23Z" is="relative-time">Jul 14, 2015</time>
        <div class="commit-title">
            <a href="/sararselitsky/TDRmapper/commit/0a4d22334d2723bb1f88ebc82f8625be874472d6" class="message" data-pjax="true" title="Update README.md">Update README.md</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>1</strong>
           contributor
        </a>
      </p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="@sararselitsky" height="24" src="https://avatars2.githubusercontent.com/u/10501967?v=3&amp;s=48" width="24" />
            <a href="/sararselitsky">sararselitsky</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
    <div class="file-actions">

      <div class="btn-group">
        <a href="/sararselitsky/TDRmapper/raw/master/README.md" class="btn btn-sm " id="raw-url">Raw</a>
          <a href="/sararselitsky/TDRmapper/blame/master/README.md" class="btn btn-sm js-update-url-with-hash">Blame</a>
        <a href="/sararselitsky/TDRmapper/commits/master/README.md" class="btn btn-sm " rel="nofollow">History</a>
      </div>

        <a class="octicon-btn tooltipped tooltipped-nw"
           href="https://mac.github.com"
           aria-label="Open this file in GitHub for Mac"
           data-ga-click="Repository, open with desktop, type:mac">
            <span class="octicon octicon-device-desktop"></span>
        </a>

            <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/edit/master/README.md" class="inline-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="o0qXxVn9oNltHFv65FY27+kks1ICE2loU0MIVlJIaLB4e2XszuwTMf0XrnTBjnSh6lvsZJDzSPgYDkphC/4HqA==" /></div>
              <button class="octicon-btn tooltipped tooltipped-n" type="submit" aria-label="Edit this file" data-hotkey="e" data-disable-with>
                <span class="octicon octicon-pencil"></span>
              </button>
</form>
          <form accept-charset="UTF-8" action="/sararselitsky/TDRmapper/delete/master/README.md" class="inline-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="pw6zr0dXJmrmSKw0y2NEFzLTzTU7YazuH7SLXW1+GVf/+BdQTY+pvwFkXF/bEYE6fUQAd83BdYJjcVEpc4giqQ==" /></div>
            <button class="octicon-btn octicon-btn-danger tooltipped tooltipped-n" type="submit" aria-label="Delete this file" data-disable-with>
              <span class="octicon octicon-trashcan"></span>
            </button>
</form>    </div>

    <div class="file-info">
        170 lines (105 sloc)
        <span class="file-info-divider"></span>
      12.145 kB
    </div>
  </div>
  
  <div id="readme" class="blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="mainContentOfPage"><h1><a id="user-content-tdrmapper" class="anchor" href="#tdrmapper" aria-hidden="true"><span class="octicon octicon-link"></span></a>tDRmapper</h1>

<p><strong>tDRmapper introduction</strong></p>

<p>Small RNA-sequencing has revealed the diversity and high abundance of small RNAs derived from tRNAs, referred to as tRNA-derived RNAs (tDRs). </p>

<p>tRNA-derived RNAs have unique features that limit the utility of conventional alignment tools and quantification methods. <em>tDRmapper</em> is a tool for mapping, naming, and quantifying tDRs while annotating and quantifying mismatches and deletions.</p>

<p><em>tDRmapper</em> was designed specifically for trimmed human small RNA-seq data (single-end, 50x) generated on the Illumina sequencing platform using cDNA libraries that were prepared using the Illumina TruSeq protocol. </p>

<p><strong>Quick run</strong></p>

<p><code>module add r</code></p>

<p><code>perl TdrMappingScripts.pl hg19_mature_and_pre.fa trimmed_small_RNA-seq.fastq</code></p>

<p><strong>Program steps</strong></p>

<ol>
<li><p>Filters reads with high quality at each position, programmed for Phred 33.
<code>perl quality_at_positions.pl $file</code></p></li>
<li><p>Maps the high quality reads to tRNA sequences, exact matches only. Reads that do not map are outputted to $file.hq_cs.notEM.
<code>perl tdrMappingExactMatches.pl $tRNAFasta $file.hq_cs &gt; $file.hq_cs.mapped</code></p></li>
<li><p>Reads that did not map in the previous step are mapped, allowing for one mismatch. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.
<code>perl tdrMappingOneMisMatch.pl $tRNAFasta $file.hq_cs.notEM &gt;&gt; $file.hq_cs.mapped</code></p></li>
<li><p>Reads that did not map in the previous step are mapped, allowing for one deletion. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.
<code>perl tdrMappingOneGap.pl $tRNAFasta $file.hq_cs.notEM.not1MM &gt;&gt; $file.hq_cs.mapped</code></p></li>
<li><p>Reads that did not map in the previous step are mapped, allowing for two mismatches. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.not2MM.
<code>perl tdrMappingTwoMisMatches.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del &gt;&gt; $file.hq_cs.mapped</code></p></li>
<li><p>Reads that did not map in the previous step are mapped, allowing for two deletions. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del.
<code>perl tdrMappingTwoDeletions.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del.not2MM &gt;&gt; $file.hq_cs.mapped</code></p></li>
<li><p>Reads that did not map in the previous step are mapped, allowing for a three base pair deletions. Reads that do not map are outputted to $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del.not3cons.
<code>perl tdrMappingThreeConsGap.pl $tRNAFasta $file.hq_cs.notEM.not1MM.not1del.not2MM.not2del &gt;&gt; $file.hq_cs.mapped</code></p></li>
<li><p>The directory is cleaned up. If you do not want files automatically removed, then delete or comment out this line.
<code>rm $file.hq_cs.*not*</code></p></li>
<li><p>All of the mapped reads above are in one file, small_RNA-seq.fastq.mapped. This file is then assessed for tDR quantification.
<code>perl makeCovgPlotTop50_and_overallStats.pl $tRNAFasta $file.hq_cs.mapped</code></p></li>
<li><p>Generates visualization of the top 50 (ranked by expression) tDRs derived from mature tRNAs.
<code>Rscript rCovgPlot.r $file.hq_cs.mapped.top50covg.txt</code></p></li>
<li><p>Generates visualization of the top 50 (ranked by expression) tDRs derived from pre-tRNAs.
<code>Rscript rCovgPlotPre.r $file.hq_cs.mapped.top50covgPre.txt</code></p></li>
</ol>

<p><strong>Outputs:</strong></p>

<p><strong>(a)</strong> *.mapped</p>

<p><strong>(b)</strong> *.speciesInfo.txt</p>

<p><strong>(c)</strong> *.covg.txt</p>

<p><strong>(d)</strong> *.covgPre.txt</p>

<p><strong>(e)</strong> *.top50covg.txt</p>

<p><strong>(f)</strong> *.top50covgPre.txt</p>

<p><strong>(g)</strong> *.top50Pre_tdr.pdf</p>

<p><strong>(h)</strong> *.top50_tdr.pdf</p>

<p><strong>Output descriptions</strong></p>

<p><strong>(a)</strong> The reads that map to mature or pre-tRNAs are outputted into *.mapped.</p>

<p>From left to right, the columns are:
(1) count: Number of times that exact sequence occurs in the FASTQ after the filtration step,
(2) length: length of the sequence,
(3) tdrSeq: the sequence,
(4) genomicMatchType: which “error type” (mismatch or deletion) the read mapped with,
(5) From: the original sequence,
(6) To: what the alteration was,
(7) tdrStartPos: The first position the sequence aligns to in the parent tRNA,
(8) tdrMusPos: The location(s) where the mismatch or deletion occurred,
(9) tRNAName: all of the tRNAs that read aligned to,</p>

<p><em>(b-f) Outputs generated in Step 9</em> </p>

<p><strong>(b)</strong> *speciesInfo.txt, the main output with the quantification results and the tDR species assignment</p>

<p>From left to right, the columns are:
(1) file: the .mapped file that was inputted into step 9, 
(2) tRNA: the parent tRNA name,
(3) species: the assigned majority tDR species name,
(4) tRNAPer: quantification of that tDR species: (the percent of tRNA-derived RNA reads that map to that tRNA)*proportion of maximum coverage for that tRNA,
(5) locMajorityCovg: the nucleotide positions that have coverage &gt; 50% (number of reads at that position / number of reads mapping to that tRNA).</p>

<p><strong>(c)</strong> *covg.txt: this output is designed for inputting into R and generating a tRNA mature coverage plot</p>

<p>From left to right, the columns are:
(1) file: The .mapped file that was inputted into step 9,
(2) tRNA: the parent tRNA name,
(3) tRNAPer: quantification of that tDR species,
(4) Catted: info for the y-axis of the coverage plots (tRNA proportion, tRNA, and the species),
(5) Position: then nucleotide position within the tRNA,
(6) perCovg: the percent of coverage at that position, (number of reads at that position / number of reads mapping to that tRNA)
(7) GM: "error type" listed if there is an “error type" that is present in more than 5% of the reads and the majority "error type" at that position is listed,
(8) perGM: the proportion of “error type” at that position (number of reads that have a mismatch or gap / number of total reads at each position),
(9) base: the nucleotide at that position, unless that position part of the anti-codon</p>

<p><strong>(d)</strong>  *covgPre.txt: this output is designed for inputting into R and generating a pre-tRNA coverage plot</p>

<p>From left to right, the columns are:
(1) file: The .mapped file that was inputted into step 9,
(2) tRNA: the parent tRNA name,
(3) tRNAPer: quantification of that tDR species,
(4) Catted: info for the y-axis of the coverage plots (tRNA proportion, tRNA, and the species),
(5) Position: then nucleotide position within the tRNA,
(6) perCovg: the percent of coverage at that position, (number of reads at that position / number of reads mapping to that tRNA)
(7) tbase: location in pre-tRNA, (A) -40 to -1 nts downstream of tRNA sequence, (B) tRNA sequence, (C) +1 to +40 nts upstream of tRNA sequence</p>

<p><strong>(e)</strong> *.top50covg.txt: </p>

<p>same description as (c), but with only the top 50 most highly expressed tDRs from mature tRNAs. This output is used to generate the mature tRNA coverage plot (*.top50_tdr.pdf).</p>

<p><strong>(f)</strong> *.top50covgPre.txt: </p>

<p>same description as (d), but with only the top 50 most highly expressed tDRs from pre-tRNAs. This output is used to generate the pre-tRNA coverage plot (*top50Pre_tdr.pdf).</p>

<p><strong>(g)</strong> *.top50_tdr.pdf:</p>

<p>The y-axis of the mature tRNA coverage map shows the top 50 most highly abundant tDRs from mature tRNAs in descending order, and also includes the relative abundance. The x-axis shows the position within the tRNA. Each row displays the percent read coverage at each position, the nucleotide sequence of each tRNA, and the positions and proportions of any “error types” that are present at &gt;5% of the reads that map to a given position. The legend is included, TDR_covg_gmt_legend.tif.</p>

<p><strong>(h)</strong> *top50Pre_tdr.pdf:</p>

<p>The y-axis of the tRNA coverage map shows the top 50 most highly abundant tDRs from pre-tRNAs in descending order, and also includes the relative abundance. The x-axis shows the position within the pre-tRNA (leader, tRNA body, or trailer). Each row displays the percent read coverage at each position and the location in the tRNA.</p>

<p><strong>Naming tDRs</strong></p>

<p>tDRmapper will assign to each tDR a name that has three components:</p>

<ol>
<li><p>The first component of the tDR name indicates the parent tRNA “family” from which the TDR is derived.</p>

<p>a. For the mature tRNA sequences, the “family” names consist of four parts, “W-X-Y-Z”, where W is the tRNA amino acid (sometimes preceded by “nmt-tRNA,” which means “nuclear encoded mitochondrial tRNA”), X is the anti-codon, Y is a unique identifier for each tRNA family, and Z is the number of mature tRNA genes with the identical sequence. For example, Asp-GTC-2-11 represents a mature tRNA “family” sequence that could be derived from 11 different tRNA genes, has a unique ID, “2”, bears the GTC anti-codon, and associates with Aspartate. This naming scheme builds on the nomenclature for tRNAs used by gtRNAdb.</p>

<p>b. For the pre-tRNA sequences, the “family” names consist of 6 parts, “pre-W-X-Y-Z.n”. This reflects the same naming scheme described above in (a), but with the prefix “pre” and the suffix “.n”. The “.n” refers to the number of pre-tRNAs from the W-X-Y mature tRNA family that have the identical pre-tRNA sequence. From among those with the identical pre-tRNA sequence, the largest “Z” is chosen for the “family” name. For example, the pre-Gly-TCC-2-5.4 sequence accounts for four pre-tRNAs with identical sequence. The family members included under this name are pre-Gly-TCC-2-2, pre-Gly-TCC-2-3, pre-Gly-TCC-2-4, and pre-Gly-TCC-2-5.</p></li>
<li><p>The second component of the tDR name indicates the size of the tDR. tDRmapper determines the primary tDR associated with a parent tRNA by counting the number of positions in the tRNA that have &gt;50% coverage (where coverage at a position is defined as the percent of all reads mapping to the tRNA at that position). If the primary TDR sequence is &lt;41 nts and =&gt;28 nts, it is defined as a tRNA-half (tRH), and if it is &gt;14 nts and &lt;28 nts, it is defined as a tRNA-fragment (tRF). </p></li>
<li><p>The last component of the tDR name indicates the region in the mature or pre-tRNA from which the read is derived.</p>

<p>a. For the tDRs derived from mature tRNAs, we use a generalized tRNA secondary structure (Methods). First we determine if a read is derived from the 5’ or 3’ end of the tRNA. If not, then we assess whether it overlaps the D-loop, anti-codon loop (A-loop), or T-loop by at least one nucleotide. Details are provided below: </p>

<p>i. “5’” is added as a suffix to the TDR name if the coverage is &gt;50% at position +1 of the tRNA (first nucleotide at the 5’-end).</p>

<p>ii.    “3’” is added as a suffix to the tDR name if the coverage is &gt;50% at position -7 of the tRNA (7 nucleotides from the 3’ end). Position -7 was used instead of position -1 due to the tapering signal (graded reduction in coverage) observed at the 3’ ends of some TDRs.</p>

<p>iii. “D”, denoting the D-loop, is added as a suffix to the TDR name if the coverage is &gt;50% at any position between 13 and 22, and is not &gt;50% at position 1.</p>

<p>iv.    “A”, denoting the A-loop, is added as a suffix to the TDR name if the coverage is &gt;50% at any position between 31 and 39, and not &gt;50% at position 1 or position -7.</p>

<p>v. “T”, denoting the T-loop, is added as a suffix to the TDR name if the coverage is &gt;50% at any position between -23 and -15, and not &gt;50% at position -7. The T-loop is denoted using positions determined from the 3’ end (as opposed to the D-loop and A-loop which are denoted using positions determined from the 5’-end – see [iii] and [iv] above) due to variability in the size of the region between the A-loop and the T-loop (which contains what is known as the “variable loop”).</p>

<p>b. For the tDRs derived from pre-tRNAs, we annotate where in relation to the header, trailer, and tRNA “body” the tDR is derived (where “body” is defined as the full-length tRNA sequence provided by gtRNAdb). Details are provided below:</p>

<p>i. “0” is added as a suffix to the TDR name if the coverage is &gt;50% at one or more nucleotides 5’ of the tRNA body, the leader sequence.</p>

<p>ii.    “1” is added as a suffix to the tDR name if the coverage is &gt;50% at one or more nucleotides 3’ of the tRNA body, the trailer sequence. This annotation is consistent with the already described “tRF-1 series”18, which are tRFs derived exclusively from trailer sequences. </p>

<p>iii. “B”, denoting tRNA “body”, is added as a suffix to the tDR name (after either a “0” or a “1”) if the coverage is &gt;50% in any position in the body of the tRNA.</p></li>
</ol>
</article>
  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.12444s from github-fe130-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
    </ul>
  </div>
</div>


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder=""></textarea>
      <div class="suggester-container">
        <div class="suggester fullscreen-suggester js-suggester js-navigation-container"></div>
      </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-3241a40a58a82e21daef3dd3cdca01bde189158793c1b6f9193fff2b5293cd1d.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github/index-d3ef45e52a74e2511c31a0051d5dfd10b60b12a8b8a738ead962c35e11dbcc1f.js"></script>
      
      
  </body>
</html>

