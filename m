Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F82071F8
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 13:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3C08C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 11:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10C2AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 11:19:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OBDfdC020737; Wed, 24 Jun 2020 13:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=L3eO6XhOdVUAWVqf9mUvriBwLrYEzoLumVohBn05r5k=;
 b=RHnWzABvkWJuYPcRJVYXXK5a9vuU490vV7u1JvLY6Ph+I3YMV88LHgAoV09SYuJGqwBZ
 Zt9JYggHVrnayXNmDb05E5QE1L8I+Qw44PulgsfwlT+XxpoFnNlaq9tRq3zpvjFmXTEX
 XojDqKhBUfv/JRmz3Adc5I9M3QdlOwiM7xWRSstbEFjTJ/GR9iHxRFQ3cUJHOc5PBBUm
 QsUXEB8F5skHi1mqBIiBlwIB5tcpDEi46Jlq14eJskMCDp4hxuGKd5RMj7CDZ1kGPARq
 Q/eQy9KcglSstYDjfy6sO/9LVJ1XKv5NJ1oXDliDm6rey1f87Ur2yaKME3yWaggw6JJ0 yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuumbgx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 13:19:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 934E110002A;
 Wed, 24 Jun 2020 13:19:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A6272B98E4;
 Wed, 24 Jun 2020 13:19:50 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jun
 2020 13:19:49 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 24 Jun 2020 13:19:50 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v2 3/9] env: correctly handle result in env_init
Thread-Index: AQHWQ7F2kS0qGoL6Bkmc1/Cy7rTtKajeoL8AgAFZFACAACWbgIAF5yoQgAAzCoCAATuwcA==
Date: Wed, 24 Jun 2020 11:19:50 +0000
Message-ID: <8c5426d871bf454eb5d6efc6ba6f9d6b@SFHDAG6NODE3.st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
 <20200618191530.GU27801@bill-the-cat>
 <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
 <20200619180511.GP27801@bill-the-cat>
 <fd7c790062454362bf9d3153046144a9@SFHDAG6NODE3.st.com>
 <20200623151631.GT27801@bill-the-cat>
In-Reply-To: <20200623151631.GT27801@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_06:2020-06-24,
 2020-06-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Wolfgang
 Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] env: correctly handle result in
	env_init
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Tom,

> From: Tom Rini <trini@konsulko.com>
> Sent: mardi 23 juin 2020 17:17
> 
> On Tue, Jun 23, 2020 at 01:13:55PM +0000, Patrick DELAUNAY wrote:
> > Hi Tom,
> >
> > > From: Tom Rini <trini@konsulko.com>
> > > Sent: vendredi 19 juin 2020 20:05
> > >
> > > On Fri, Jun 19, 2020 at 02:14:00PM +0000, Patrick DELAUNAY wrote:
> > > > Hi Tom and Marek,
> > > >
> > > > > From: Tom Rini <trini@konsulko.com>
> > > > > Sent: jeudi 18 juin 2020 21:16
> > > > >
> > > > > On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrote:
> > > > >
> > > > > > Don't return error with ret=-ENOENT when the optional ops
> > > > > > drv->init is absent but only if env_driver_lookup doesn't found driver.
> > > > > >
> > > > > > This patch correct an issue for the code
> > > > > >   if (!env_init())
> > > > > >      env_load()
> > > > > > When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4), as the
> > > > > > backend env/ext4.c doesn't define an ops .init
> > > > > >
> > > > > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > > > > ---
> > > > > >
> > > > > > (no changes since v1)
> > > > > >
> > > > > >  env/env.c | 5 ++++-
> > > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/env/env.c b/env/env.c index
> > > > > > dcc25c030b..819c88f729
> > > > > > 100644
> > > > > > --- a/env/env.c
> > > > > > +++ b/env/env.c
> > > > > > @@ -295,7 +295,10 @@ int env_init(void)
> > > > > >  	int prio;
> > > > > >
> > > > > >  	for (prio = 0; (drv = env_driver_lookup(ENVOP_INIT, prio));
> prio++) {
> > > > > > -		if (!drv->init || !(ret = drv->init()))
> > > > > > +		ret = 0;
> > > > > > +		if (drv->init)
> > > > > > +			ret = drv->init();
> > > > > > +		if (!ret)
> > > > > >  			env_set_inited(drv->location);
> > > > > >
> > > > > >  		debug("%s: Environment %s init done (ret=%d)\n",
> __func__,
> > > > >
> > > > > I'm adding in Marek here because this reminds me of similar
> > > > > questions / concerns I had looking in to his series.  At root, I
> > > > > think we're not being consistent in each of our env backing
> > > > > implementations about where flags such as ENV_VALID are set, and
> > > > > return
> > > values / checks of functions.
> > > > >
> > > > > Just outside of the start of the patch context here, we set ret
> > > > > to -ENOENT and just past this, if still -ENOENT we say ENV_VALID
> > > > > and point at the default environment.
> > > > >
> > > > > But, I don't follow the patch commit message here.  If we don't
> > > > > have
> > > > > drv->init we call env_set_inited(drv->location) but we won't
> > > > > drv->have change
> > > > > ret to 0, which means that later on down the function we go back
> > > > > to default environment.
> > > >
> > > > The cause of the issue is because the init() ops is optional in
> > > > "struct
> > > env_driver".
> > >
> > > Right.
> > >
> > > > When this opt is absent, I assume that the initialization is not
> > > > mandatory but this inititialization need to be tagged in
> > > > gd->env_has_init with the call of
> > > > env_set_inited() function
> > >
> > > So when drv->init isn't set we are already calling env_set_inited(...).
> > > If that's not the case, what's going on?
> > >
> > > > And the ENV backend is FOUND (don't return -ENOENT)
> > > >
> > > > else the next call of env_has_inited(drv->location) always failed
> > > > : in
> > > > env_load()
> > > >
> > > > I see the error  in EXT4 env backend,.all the other backend as a
> > > > env_init() function
> > > >
> > > > But some othe backend don't define the .init operation and have
> > > > the issue
> > > >
> > > > eeprom.c:235:U_BOOT_ENV_LOCATION(eeprom) = {
> > > > ext4.c:135:U_BOOT_ENV_LOCATION(ext4) = {
> > > > fat.c:128:U_BOOT_ENV_LOCATION(fat) = {
> > > > mmc.c:393:U_BOOT_ENV_LOCATION(mmc) = {
> > > > onenand.c:108:U_BOOT_ENV_LOCATION(onenand) = {
> > > > sata.c:117:U_BOOT_ENV_LOCATION(sata) = {
> > > > ubi.c:179:U_BOOT_ENV_LOCATION(ubi) = {
> > > >
> > > > The other don't have issue:
> > > >
> > > > flash.c:358:U_BOOT_ENV_LOCATION(flash) = {
> > > > flash.c:368:	.init		= env_flash_init,
> > > > nand.c:382:U_BOOT_ENV_LOCATION(nand) = {
> > > > nand.c:389:	.init		= env_nand_init,
> > > > nowhere.c:30:U_BOOT_ENV_LOCATION(nowhere) = {
> > > > nowhere.c:32:	.init		= env_nowhere_init,
> > > > nvram.c:117:U_BOOT_ENV_LOCATION(nvram) = {
> > > > nvram.c:122:	.init		= env_nvram_init,
> > > > remote.c:54:U_BOOT_ENV_LOCATION(remote) = {
> > > > remote.c:59:	.init		= env_remote_init,
> > > > sf.c:306:U_BOOT_ENV_LOCATION(sf) = {
> > > > sf.c:312:	.init		= env_sf_init,
> > >
> > > Right, there should be a problem showing up on a ton of locations,
> > > not just ext4 which is why I'm concerned / confused here.  While
> > > ext4 isn't as widely used yet as I would expect, FAT/MMC are.
> > >
> > > > > So isn't this a problem in most environment cases then?  Thanks!
> > > >
> > > > I don't sure which environment configuration can case issue (only
> > > > one ENV without drc->init() function) But no issue if at least one
> > > > CONFIG_ENV_IS_ is activated with driver implementing init ops
> > > >
> > > > But I see the issue in SANDBOX when I activate EXT4 only target.
> > > > (CONFIG_ENV_IS_IN_EXT4), And no more issue when I add
> > > CONFIG_ENV_IS_NOWHERE.
> > > >
> > > > PS: no direct issue if env_init result is not checked
> > > >        but I check this result in the sandbox tests in next patches:
> > > > 	if (!env_init())
> > > > 	     env_load()
> > > >
> > > >        but anyway inconsistent value of gd->env_has_init
> > > >        which can be a problem for any env_has_inited() calls
> > >
> > > Right.  I think there's some bigger inconsistency going on here that
> > > needs to be fixed.  I'm also confused / concerned how you're not
> > > seeing
> > > env_set_inite(..) being called.  if (!NULL) is true.  Thanks!
> >
> > I  was confused also...
> > and I check again the code
> 
> Thanks.  It's a very tricky section of the code and I think I got some part of it
> wrong too.  What got me off-track was unrolling the test isn't required in what you
> tried, just adding:
> 	ret = 0; // We found at least one env exits.
> before if (!drv->init || !(ret = drv->init())) would do the same.  That said...
> 
> > And I make a error in my first analysis.
> >
> > For the case where init ops is not defined in only one backend.
> >
> > 	ret = -ENOENT
> >
> > And the last test is true
> >
> > 	if (ret == -ENOENT) {
> > 		gd->env_addr = (ulong)&default_environment[0];
> > 		gd->env_valid = ENV_VALID;
> >
> > 		return 0;
> > 	}
> >
> > In  fact this function return the LAST result for 'drv->init()' call
> > and that it is strange when several backend are activated.
> 
> Yes.  Things are very fragile in the multi-env case.  There being underlying bugs
> would not surprise me.

I dig deeper in the code and I agree: I will just sent a v3 with minimal update. 

The multi-env cases it could be  long story.

> > So this function have no issue when only one ENV backend is activated,
> > and it is the configuration today for most of boards...
> 
> Right, the common case is the way things have worked historically, env exists in
> one defined location and when that fails (device not present), we get the built-in
> environment and saveenv needs to fail rather than crash the board (due to writing
> to non-existent HW, etc).

Yes tested today on sandbox
env save failed to avoid crash but without any trace.

=> I push a patch to add trace is that make sense.
[PATCH] env: add failing trace in env_save
http://patchwork.ozlabs.org/project/uboot/list/?series=185459


> > I will change my patch in the V3 serie:
> > env_init() return 0 if, at least, one backend is correctly initialized
> > (when no ops init  or the ops init result is OK)
> >
> > But I don't understood 2 thinks in the last test
> >
> > 1/ Why set ENV Is set to VALID:
> >
> > 	gd->env_valid = ENV_VALID;
> >
> > 	in nowhere backend, for same case of default env, it is set
> ENV_INVALID....
> 
> A good question.  I see:
> commit eeba55cb4a8a29a47d0d26692c188b47ba6bf396
> Author: Tom Rini <trini@konsulko.com>
> Date:   Sat Aug 19 22:27:57 2017 -0400
> 
>     env: Correct case of no sub-init function
> 
> changed that from setting it to 0 to setting it to ENV_VALID, where 0 meant
> ENV_INVALID at the time, but the comments in that commit say it used to be
> setting it to valid.  Which brings us back to:
> commit 203e94f6c9ca03e260175ce240f5856507395585
> Author: Simon Glass <sjg@chromium.org>
> Date:   Thu Aug 3 12:21:56 2017 -0600
> 
>     env: Add an enum for environment state
> 
> as adding a enum for 0 = ENV_INVALID, 1 = ENV_VALID, 2 = redundant.
> 
> And there's basically part of a longer series to clean up the environment code.  In
> particular:
> commit 7938822a6b75b69fff9793b6b1769dddf1249525
> Author: Simon Glass <sjg@chromium.org>
> Date:   Thu Aug 3 12:22:02 2017 -0600
> 
>     env: Drop common init() function
> 
> is the root of this particular question.  Before this change, the logic was "For the
> init function in of an env location, point at the in-memory default environment,
> declare it valid".  With this change the new common env init function (now
> env_init() then env_init_new() as functionality migrated to it) when we did not have
> an explicit drv->init() call we need to point at the in-memory default environment
> and (was wrong at the time, later fixed to...) mark env as valid.
> 
> So today, ret = -ENOENT is for the case of no explicit drv->init() function so do
> what those env drivers were doing before of just pointing
> gd->env_addr to the default environment and mark it valid.
> 
> What we're doing today works but feels too clever, given the amount of time it
> takes to dig in to see what is supposed to be going on.
> 
> In the case of one environment location, this logic works as expected.
> In the case of multiple environments, I would need to write down all of the possible
> combinations and walk the code to be sure what happens, especially since it's
> link-order dependent on the order we try drivers in.

I check the code deeper and
I see many incoherency in multi-env support

For example sometime the global ENV configuration 
	gd->env_valid = ENV_VALID;

is initialiazed in init function of each backend...
for me it should be initialzed only on the load ops when the ENV is really valid.

and for default ENV configuration

we have
	gd->env_addr	= (ulong)&default_environment[0];
	gd->env_valid	= ENV_INVALID;

	in this case set gd->env_addr with ENV_INVALID is not necessary 

or
	gd->env_addr	= (ulong)&default_environment[0];
	gd->env_valid	= ENV_VALID;

it seems incoherent or uneeded with

int env_get_char(int index)
{
	if (gd->env_valid == ENV_INVALID)
		return default_environment[index];
	else
		return env_get_char_spec(index);
}

I will continue to check the code deeper but it seems 
out of the scope for this serie.

I will sent a v3 soon.

> > 2/ Why flags is not update
> >
> > 	gd->flags |= GD_FLG_ENV_DEFAULT;
> >
> >
> > But as it s error case, in should never occurs And I will sent a
> > separate patch for this part to review.
> 
> With all of the above in mind, it's not an error case, but being clever with variable
> names and our errno meanings.  So we don't set this flag here because the
> "default" drv->init() that we're making this snippet of code act like never did that.
> We only set this flag later on when we're at the point where we know that we
> cannot get at a stored environment.
> the "default_environment" variable plays the role of both being the literal default
> environment as well as being the allocated space we use and move around as gd-
> >env_addr in many cases.  The env_init() code block for -ENOENT is to set
> things up for that case.
> 
> Please let me know if this makes sense, or if you think I misread something
> (which is quite possible).  Thanks!

Yes that make sense: it is fallback to default ENV when all .init failed, I will update
my patch in V3 with minimal update of this part and with a new comment.

The env code use many gloabal tag, sometime managed by common code,
sometime managed by backend... it is difficult to know the responsibility of each
part in multi-env context.

I will continue check of ENV code in background (and perhaps activate and test a other
ENV backend in sandbox)

Thanks for your time.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
