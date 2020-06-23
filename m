Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2A520531B
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 15:14:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D45D4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 13:14:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11AC0C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2020 13:14:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05ND3uCl018632; Tue, 23 Jun 2020 15:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uGjtpcxa+18gJy4xl6fYX2jAtrQdJlgqbGelr8mx480=;
 b=THyQbyaD6nf16yxn3t0TzamDYmSuqu+6E2bCeHSfM1CvlGzoJ76HHD6kJKTr3Ybxdaeh
 HuUJYxnpqz+0Dm/g2y1EbB4PCb8nyewt1Xs++052LRshl53DIKbNsE51z7o4i6+QMno4
 MLW8oOwQjaSLc+4jV4HMYDt50ZxTydqNnddC7abm+YFKpmxGe92eDgFswybawcGQKgTJ
 5P7bt4EuJRZO39Co5V5y4V0KMjAXaglZVFgSOAeik9ypr9U/WPbFqcnHM+ePz5wXxn9Y
 ML/ECFBb+mmPbXcyOAa6x+X2JTkSlFwOYITsD7GaqjhxnKusvyrw4WUSb3DybssYdi+l Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31s87vfcra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 15:13:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7259810002A;
 Tue, 23 Jun 2020 15:13:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A22C2124DD;
 Tue, 23 Jun 2020 15:13:56 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jun
 2020 15:13:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 23 Jun 2020 15:13:55 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v2 3/9] env: correctly handle result in env_init
Thread-Index: AQHWQ7F2kS0qGoL6Bkmc1/Cy7rTtKajeoL8AgAFZFACAACWbgIAF5yoQ
Date: Tue, 23 Jun 2020 13:13:55 +0000
Message-ID: <fd7c790062454362bf9d3153046144a9@SFHDAG6NODE3.st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
 <20200618191530.GU27801@bill-the-cat>
 <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
 <20200619180511.GP27801@bill-the-cat>
In-Reply-To: <20200619180511.GP27801@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_06:2020-06-23,
 2020-06-23 signatures=0
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
> Sent: vendredi 19 juin 2020 20:05
> 
> On Fri, Jun 19, 2020 at 02:14:00PM +0000, Patrick DELAUNAY wrote:
> > Hi Tom and Marek,
> >
> > > From: Tom Rini <trini@konsulko.com>
> > > Sent: jeudi 18 juin 2020 21:16
> > >
> > > On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrote:
> > >
> > > > Don't return error with ret=-ENOENT when the optional ops
> > > > drv->init is absent but only if env_driver_lookup doesn't found driver.
> > > >
> > > > This patch correct an issue for the code
> > > >   if (!env_init())
> > > >      env_load()
> > > > When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4), as the
> > > > backend env/ext4.c doesn't define an ops .init
> > > >
> > > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  env/env.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/env/env.c b/env/env.c index dcc25c030b..819c88f729
> > > > 100644
> > > > --- a/env/env.c
> > > > +++ b/env/env.c
> > > > @@ -295,7 +295,10 @@ int env_init(void)
> > > >  	int prio;
> > > >
> > > >  	for (prio = 0; (drv = env_driver_lookup(ENVOP_INIT, prio)); prio++) {
> > > > -		if (!drv->init || !(ret = drv->init()))
> > > > +		ret = 0;
> > > > +		if (drv->init)
> > > > +			ret = drv->init();
> > > > +		if (!ret)
> > > >  			env_set_inited(drv->location);
> > > >
> > > >  		debug("%s: Environment %s init done (ret=%d)\n", __func__,
> > >
> > > I'm adding in Marek here because this reminds me of similar
> > > questions / concerns I had looking in to his series.  At root, I
> > > think we're not being consistent in each of our env backing
> > > implementations about where flags such as ENV_VALID are set, and return
> values / checks of functions.
> > >
> > > Just outside of the start of the patch context here, we set ret to
> > > -ENOENT and just past this, if still -ENOENT we say ENV_VALID and
> > > point at the default environment.
> > >
> > > But, I don't follow the patch commit message here.  If we don't have
> > > drv->init we call env_set_inited(drv->location) but we won't have
> > > drv->change
> > > ret to 0, which means that later on down the function we go back to
> > > default environment.
> >
> > The cause of the issue is because the init() ops is optional in "struct
> env_driver".
> 
> Right.
> 
> > When this opt is absent, I assume that the initialization is not
> > mandatory but this inititialization need to be tagged in
> > gd->env_has_init with the call of
> > env_set_inited() function
> 
> So when drv->init isn't set we are already calling env_set_inited(...).
> If that's not the case, what's going on?
> 
> > And the ENV backend is FOUND (don't return -ENOENT)
> >
> > else the next call of env_has_inited(drv->location) always failed : in
> > env_load()
> >
> > I see the error  in EXT4 env backend,.all the other backend as a
> > env_init() function
> >
> > But some othe backend don't define the .init operation and have the
> > issue
> >
> > eeprom.c:235:U_BOOT_ENV_LOCATION(eeprom) = {
> > ext4.c:135:U_BOOT_ENV_LOCATION(ext4) = {
> > fat.c:128:U_BOOT_ENV_LOCATION(fat) = {
> > mmc.c:393:U_BOOT_ENV_LOCATION(mmc) = {
> > onenand.c:108:U_BOOT_ENV_LOCATION(onenand) = {
> > sata.c:117:U_BOOT_ENV_LOCATION(sata) = {
> > ubi.c:179:U_BOOT_ENV_LOCATION(ubi) = {
> >
> > The other don't have issue:
> >
> > flash.c:358:U_BOOT_ENV_LOCATION(flash) = {
> > flash.c:368:	.init		= env_flash_init,
> > nand.c:382:U_BOOT_ENV_LOCATION(nand) = {
> > nand.c:389:	.init		= env_nand_init,
> > nowhere.c:30:U_BOOT_ENV_LOCATION(nowhere) = {
> > nowhere.c:32:	.init		= env_nowhere_init,
> > nvram.c:117:U_BOOT_ENV_LOCATION(nvram) = {
> > nvram.c:122:	.init		= env_nvram_init,
> > remote.c:54:U_BOOT_ENV_LOCATION(remote) = {
> > remote.c:59:	.init		= env_remote_init,
> > sf.c:306:U_BOOT_ENV_LOCATION(sf) = {
> > sf.c:312:	.init		= env_sf_init,
> 
> Right, there should be a problem showing up on a ton of locations, not just ext4
> which is why I'm concerned / confused here.  While ext4 isn't as widely used yet
> as I would expect, FAT/MMC are.
> 
> > > So isn't this a problem in most environment cases then?  Thanks!
> >
> > I don't sure which environment configuration can case issue (only one
> > ENV without drc->init() function) But no issue if at least one
> > CONFIG_ENV_IS_ is activated with driver implementing init ops
> >
> > But I see the issue in SANDBOX when I activate EXT4 only target.
> > (CONFIG_ENV_IS_IN_EXT4), And no more issue when I add
> CONFIG_ENV_IS_NOWHERE.
> >
> > PS: no direct issue if env_init result is not checked
> >        but I check this result in the sandbox tests in next patches:
> > 	if (!env_init())
> > 	     env_load()
> >
> >        but anyway inconsistent value of gd->env_has_init
> >        which can be a problem for any env_has_inited() calls
> 
> Right.  I think there's some bigger inconsistency going on here that needs to be
> fixed.  I'm also confused / concerned how you're not seeing
> env_set_inite(..) being called.  if (!NULL) is true.  Thanks!

I  was confused also...
and I check again the code

And I make a error in my first analysis.

For the case where init ops is not defined in only one backend.

	ret = -ENOENT

And the last test is true

	if (ret == -ENOENT) {
		gd->env_addr = (ulong)&default_environment[0];
		gd->env_valid = ENV_VALID;

		return 0;
	}

In  fact this function return the LAST result for 'drv->init()' call and
that it is strange when several backend are activated.

So this function have no issue when only one ENV backend is activated,
and it is the configuration today for most of boards...

I will change my patch in the V3 serie:
env_init() return 0 if, at least, one backend is correctly initialized
(when no ops init  or the ops init result is OK)
 
But I don't understood 2 thinks in the last test

1/ Why set ENV Is set to VALID:

	gd->env_valid = ENV_VALID;

	in nowhere backend, for same case of default env, it is set ENV_INVALID....

2/ Why flags is not update
 
	gd->flags |= GD_FLG_ENV_DEFAULT;


But as it s error case, in should never occurs 
And I will sent a separate patch for this part to review.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
