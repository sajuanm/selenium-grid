# selenium-grid-4
<article class="markdown-body entry-content container-lg" itemprop="text">
<h1>Objective</h1>
<p>This project is a PoC with the objective to test the capabilities of Selenium Grid 4 in full distributed mode.</p>
<hr>
<h1>Description of Selenium Grid 4</h1>
<p>Selenium Grid is a part of the Selenium Suite that specializes in running multiple tests across different browsers, operating systems, and machines in parallel. <br>
It is achieved by routing the commands of remote browser instances where a server acts as a hub. A user needs to configure the remote server in order to execute the tests.</p>
<h3>Purposes and main functionalities</h3>
<ul>
<li>Central entry point for all scripts</li>
<li>Management and control of the nodes / environment where the browsers run</li>
<li>Scaling</li>
<li>Running scripts in parallel</li>
<li>Cross platform testing</li>
<li>Load balancing</li>
</ul>
<h3>When to use Selenium Grid</h3>
<ul>
<li>To run your scripts against multiple browsers, multiple versions of browser, and browsers running on different operating systems.</li>
<li>To reduce the time it takes for the scripts to be completed</li>
</ul>
<h3>There are 4 different modes of Grid setup in Selenium 4</h3>
<ul>
<li>Standalone</li>
<li>Hub and Node</li>
<li>Distributed</li>
<li>Docker</li>
</ul>
<h2>Extra help</h2>
<h3>More documentation about Selenium Grid 4</h3>
<p>In this link you can consult the full documentation about Selenium Grid 4<br>
<a href="https://www.selenium.dev/documentation/en/grid/grid_4/" rel="nofollow">https://www.selenium.dev/documentation/en/grid/grid_4 </a>
</p>
<h3><a id="user-content-community" class="anchor" aria-hidden="true" href="#community"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Community</h3>
<p>Do you need help to use these Docker images?
All the contact points for the different Selenium projects can be seen at:
<a href="https://www.selenium.dev/support/" rel="nofollow">https://www.selenium.dev/support/</a></p>
<p>The main selenium project can be found in the following link<br>
<a href="https://github.com/SeleniumHQ/docker-selenium" rel="nofollow">https://github.com/SeleniumHQ/docker-selenium</a></p>
<hr>
<h1>Installation</h1>
<h2>Docker</h2>
<p>In this demo we are using Docker images, the process to install Docker in your machine can be found in the following link:<br>
<a href="https://docs.docker.com/get-started/" rel="nofollow">https://docs.docker.com/get-started/ </a></p>
<hr>
<h1>Scripts</h1>
<p>The scripts will perform the following activities:</p>
<ul>
<li>Read from a .txt file a list of URLs</li>
<li>Extract the entire HTML code of the body</li>
<li>Take a screenshot of the page and save it.</li>
</ul>
<hr>
<h1>How to use</h1>
<p>To simulate a fully distributed mode we are going to install locally all the images, that will run as independent virtual machines.</p>
<h4>Windows</h4>
<p>To run it on Windows is necessary to use PowerShell and navigate to the location where we store the project.</p>
<h3><a id="user-content-fully-distributed-mode---router-queue-distributor-eventbus-sessionmap-and-nodes" class="anchor" aria-hidden="true" href="#fully-distributed-mode---router-queue-distributor-eventbus-sessionmap-and-nodes"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Fully distributed mode - Router, Queue, Distributor, EventBus, SessionMap and Nodes</h3>
<p>It is possible to start a Selenium Grid with all its components apart. For simplicity, only an
example with docker-compose will be provided. Save the file locally, and check the execution
instructions on top of it.</p>
<p><a href=""><code>docker-compose-v3-full-grid.yml</code></a></p>
<p>To execute this docker-compose yml file use: </p>
<code>docker-compose -f docker-compose-v3-full-grid.yml up</code>
<p> Add the `-d` flag at the end for detached execution </p>
<p> To stop the execution, hit Ctrl+C, and then: </p>
<code> docker-compose -f docker-compose-v3-full-grid.yml down</code>
<hr>
<h2><a id="user-content-monitoring" class="anchor" aria-hidden="true" href="#monitoring"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Monitoring</h2>
<p>Selenium grid provides a con</p>
<hr>
<h2><a id="user-content-debugging" class="anchor" aria-hidden="true" href="#debugging"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Debugging</h2>
<p>This project uses <a href="https://github.com/LibVNC/x11vnc">x11vnc</a> as VNC server to allow users inspect what is happening
inside the container. Users can connect to this server in two ways:</p>
<h3><a id="user-content-using-a-vnc-client" class="anchor" aria-hidden="true" href="#using-a-vnc-client"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Using a VNC client</h3>
<p>The VNC server is listening to port 5900, you can use a VNC client and connect to it. Feel free to map port 5900 to
any free external port that you wish.</p>
<p>The internal 5900 port remains the same because that is the configured port for the VNC server running inside the container.</p>
<p>Here is an example with the standalone images, the same concept applies to the node images.</p>
<div class="highlight highlight-source-shell"><pre>$ docker run -d -p 4444:4444 -p 5900:5900 -v /dev/shm:/dev/shm selenium/standalone-chrome:4.0.0-beta-3-20210426
$ docker run -d -p 4444:4444 -p 5901:5900 -v /dev/shm:/dev/shm selenium/standalone-edge:4.0.0-beta-3-20210426
$ docker run -d -p 4445:4444 -p 5902:5900 -v /dev/shm:/dev/shm selenium/standalone-firefox:4.0.0-beta-3-20210426
$ docker run -d -p 4446:4444 -p 5903:5900 -v /dev/shm:/dev/shm selenium/standalone-opera:4.0.0-beta-3-20210426</pre></div>
<p>Then, you would use in your VNC client:</p>
<ul>
<li>Port 5900 to connect to the Chrome container</li>
<li>Port 5901 to connect to the Edge container</li>
<li>Port 5902 to connect to the Firefox container</li>
<li>Port 5903 to connect to the Opera container</li>
</ul>
<p>If you get a prompt asking for a password, it is: <code>secret</code>. If you wish to change this, you should either change
it in the <code>/NodeBase/Dockerfile</code> and build the images yourself, or you can define a Docker image that derives from
the posted ones which reconfigures it:</p>
<div class="highlight highlight-source-dockerfile"><pre><span class="pl-c"><span class="pl-c">#</span>FROM selenium/node-chrome:4.0.0-beta-3-20210426</span>
<span class="pl-c"><span class="pl-c">#</span>FROM selenium/node-edge:4.0.0-beta-3-20210426</span>
<span class="pl-c"><span class="pl-c">#</span>FROM selenium/node-firefox:4.0.0-beta-3-20210426</span>
<span class="pl-c"><span class="pl-c">#</span>FROM selenium/node-opera:4.0.0-beta-3-20210426</span>
<span class="pl-c"><span class="pl-c">#</span>Choose the FROM statement that works for you.</span>

<span class="pl-k">RUN</span> x11vnc -storepasswd &lt;your-password-here&gt; /home/seluser/.vnc/passwd</pre></div>
<p>If you want to run VNC without password authentication you can set the environment variable <code>VNC_NO_PASSWORD=1</code>.</p>
<h3><a id="user-content-using-your-browser-no-vnc-client-is-needed" class="anchor" aria-hidden="true" href="#using-your-browser-no-vnc-client-is-needed"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Using your browser (no VNC client is needed)</h3>
<p>This project uses <a href="https://github.com/novnc/noVNC">noVNC</a> to allow users inspect visually container activity with
their browser. This might come handy if you cannot install a VNC client on your machine. Port 7900 is used to start
noVNC, so you will need to connect to that port with your browser.</p>
<p>Similarly to the previous section, feel free to map port 7900 to any free external port that you wish.</p>
<p>Here is an example with the standalone images, the same concept applies to the node images.</p>
<div class="highlight highlight-source-shell"><pre>$ docker run -d -p 4444:4444 -p 7900:7900 -v /dev/shm:/dev/shm selenium/standalone-chrome:4.0.0-beta-3-20210426
$ docker run -d -p 4444:4444 -p 7901:7900 -v /dev/shm:/dev/shm selenium/standalone-edge:4.0.0-beta-3-20210426
$ docker run -d -p 4445:4444 -p 7902:7900 -v /dev/shm:/dev/shm selenium/standalone-firefox:4.0.0-beta-3-20210426
$ docker run -d -p 4446:4444 -p 7903:7900 -v /dev/shm:/dev/shm selenium/standalone-opera:4.0.0-beta-3-20210426</pre></div>
<p>Then, you would use in your browser:</p>
<ul>
<li><a href="http://localhost:7900/" rel="nofollow">http://localhost:7900/</a> to connect to the Chrome container</li>
<li><a href="http://localhost:7901/" rel="nofollow">http://localhost:7901/</a> to connect to the Edge container</li>
<li><a href="http://localhost:7902/" rel="nofollow">http://localhost:7902/</a> to connect to the Firefox container</li>
<li><a href="http://localhost:7903/" rel="nofollow">http://localhost:7903/</a> to the Opera container</li>
</ul>
<p>If you get a prompt asking for a password, it is: <code>secret</code>.</p>
<hr>
<h2><a id="user-content-troubleshooting" class="anchor" aria-hidden="true" href="#troubleshooting"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Troubleshooting</h2>
<p>All output gets sent to stdout, so it can be inspected by running:</p>
<div class="highlight highlight-source-shell"><pre>$ docker logs -f <span class="pl-k">&lt;</span>container-id<span class="pl-k">|</span>container-name<span class="pl-k">&gt;</span></pre></div>
<p>You can increase the log output by passing environment variable to the containers:</p>
<pre><code>SE_OPTS="--log-level FINE"
</code></pre>
<h3><a id="user-content--v-devshmdevshm-or---shm-size-2g" class="anchor" aria-hidden="true" href="#-v-devshmdevshm-or---shm-size-2g"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a><code>-v /dev/shm:/dev/shm</code> or <code>--shm-size 2g</code></h3>
<p>Why is <code>-v /dev/shm:/dev/shm</code> or <code>--shm-size 2g</code> necessary?</p>
<blockquote>
<p>This is a known workaround to avoid the browser crashing inside a docker container, here are the documented issues for
<a href="https://code.google.com/p/chromium/issues/detail?id=519952" rel="nofollow">Chrome</a> and <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=1338771#c10" rel="nofollow">Firefox</a>.
The shm size of 2gb is arbitrary but known to work well, your specific use case might need a different value, it is recommended
to tune this value according to your needs. Along the examples <code>-v /dev/shm:/dev/shm</code> will be used, but both are known to work.</p>
</blockquote>
<h3><a id="user-content-headless" class="anchor" aria-hidden="true" href="#headless"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Headless</h3>
<p>If you see the following selenium exceptions:</p>
<p><code>Message: invalid argument: can't kill an exited process</code></p>
<p>or</p>
<p><code>Message: unknown error: Chrome failed to start: exited abnormally</code></p>
<p>The reason <em>might</em> be that you've set the <code>START_XVFB</code> environment variable to "false", but forgot to
actually run Firefox, Chrome or Opera in the headless mode.</p>
</article>
