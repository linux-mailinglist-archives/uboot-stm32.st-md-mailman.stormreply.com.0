Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA3200B18
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 16:14:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57B34C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 14:14:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2624C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 14:14:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JE8Njm025681; Fri, 19 Jun 2020 16:14:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fnoYrh+4kiis/47xzXb3T5TwW1At9gEmFI3pzPnZ73g=;
 b=Ghw7NhbRHwd84yvOYRxT6zRoRTJYoTjf+QQNasnOwPoKrIrypzzdDCrgkTvbVvr8ZIpx
 A89pCC70ZSc80EpFeSleHnm7YH2pKrav2yRbXDPRssgz2QM7N6RPylTwf8ISgjGc0vWw
 +p4HAgiEaRSZqKYVKCDIVbjcGmSN97ZPV4UlQgMQ4jBpooQ3VaaW9fkD46cd0u6rrGQ6
 tJw7Vy3W01FuUDAmM3Uk2inqT/TPQssJOode99J5V7P1ykr9nmNbLseW/1FPkiSarJ5B
 wabcT1lFD0SNlnpE3lbe5Xif78xfZKI5nY6RA0024UykF+nBWbXUbE7QAHvvkWWb+LOP lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64as6vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 16:14:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BB82100034;
 Fri, 19 Jun 2020 16:14:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C40A20FBC2;
 Fri, 19 Jun 2020 16:14:00 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 16:14:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 19 Jun 2020 16:14:00 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>
Thread-Topic: [PATCH v2 3/9] env: correctly handle result in env_init
Thread-Index: AQHWQ7F2kS0qGoL6Bkmc1/Cy7rTtKajeoL8AgAFZFAA=
Date: Fri, 19 Jun 2020 14:14:00 +0000
Message-ID: <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
 <20200618191530.GU27801@bill-the-cat>
In-Reply-To: <20200618191530.GU27801@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_14:2020-06-19,
 2020-06-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
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

Hi Tom and Marek,

> From: Tom Rini <trini@konsulko.com>
> Sent: jeudi 18 juin 2020 21:16
> 
> On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrote:
> 
> > Don't return error with ret=-ENOENT when the optional ops drv->init is
> > absent but only if env_driver_lookup doesn't found driver.
> >
> > This patch correct an issue for the code
> >   if (!env_init())
> >      env_load()
> > When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4), as the backend
> > env/ext4.c doesn't define an ops .init
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > (no changes since v1)
> >
> >  env/env.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/env/env.c b/env/env.c
> > index dcc25c030b..819c88f729 100644
> > --- a/env/env.c
> > +++ b/env/env.c
> > @@ -295,7 +295,10 @@ int env_init(void)
> >  	int prio;
> >
> >  	for (prio = 0; (drv = env_driver_lookup(ENVOP_INIT, prio)); prio++) {
> > -		if (!drv->init || !(ret = drv->init()))
> > +		ret = 0;
> > +		if (drv->init)
> > +			ret = drv->init();
> > +		if (!ret)
> >  			env_set_inited(drv->location);
> >
> >  		debug("%s: Environment %s init done (ret=%d)\n", __func__,
> 
> I'm adding in Marek here because this reminds me of similar questions / concerns
> I had looking in to his series.  At root, I think we're not being consistent in each of
> our env backing implementations about where flags such as ENV_VALID are set,
> and return values / checks of functions.
> 
> Just outside of the start of the patch context here, we set ret to -ENOENT and just
> past this, if still -ENOENT we say ENV_VALID and point at the default
> environment.
> 
> But, I don't follow the patch commit message here.  If we don't have
> drv->init we call env_set_inited(drv->location) but we won't have change
> ret to 0, which means that later on down the function we go back to default
> environment.

The cause of the issue is because the init() ops is optional in "struct env_driver".

When this opt is absent, I assume that the initialization is not mandatory but
this inititialization need to be tagged in gd->env_has_init with the call of
env_set_inited() function 

And the ENV backend is FOUND (don't return -ENOENT)

else the next call of env_has_inited(drv->location) always failed : in env_load()

I see the error  in EXT4 env backend,.all the other backend as a env_init() function

But some othe backend don't define the .init operation and have the issue

eeprom.c:235:U_BOOT_ENV_LOCATION(eeprom) = {
ext4.c:135:U_BOOT_ENV_LOCATION(ext4) = {
fat.c:128:U_BOOT_ENV_LOCATION(fat) = { 
mmc.c:393:U_BOOT_ENV_LOCATION(mmc) = {
onenand.c:108:U_BOOT_ENV_LOCATION(onenand) = {
sata.c:117:U_BOOT_ENV_LOCATION(sata) = { 
ubi.c:179:U_BOOT_ENV_LOCATION(ubi) = {

The other don't have issue:

flash.c:358:U_BOOT_ENV_LOCATION(flash) = {
flash.c:368:	.init		= env_flash_init,
nand.c:382:U_BOOT_ENV_LOCATION(nand) = {
nand.c:389:	.init		= env_nand_init,
nowhere.c:30:U_BOOT_ENV_LOCATION(nowhere) = {
nowhere.c:32:	.init		= env_nowhere_init,
nvram.c:117:U_BOOT_ENV_LOCATION(nvram) = {
nvram.c:122:	.init		= env_nvram_init,
remote.c:54:U_BOOT_ENV_LOCATION(remote) = {
remote.c:59:	.init		= env_remote_init,
sf.c:306:U_BOOT_ENV_LOCATION(sf) = {
sf.c:312:	.init		= env_sf_init,

> So isn't this a problem in most environment cases then?  Thanks!

I don't sure which environment configuration can case issue (only one ENV without drc->init() function)
But no issue if at least one CONFIG_ENV_IS_ is activated with driver implementing init ops 

But I see the issue in SANDBOX when I activate EXT4 only target. (CONFIG_ENV_IS_IN_EXT4), 
And no more issue when I add CONFIG_ENV_IS_NOWHERE.

PS: no direct issue if env_init result is not checked
       but I check this result in the sandbox tests in next patches:
	if (!env_init())
	     env_load()
 
       but anyway inconsistent value of gd->env_has_init 
       which can be a problem for any env_has_inited() calls


Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
