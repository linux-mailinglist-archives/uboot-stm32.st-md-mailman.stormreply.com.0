Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C054A20F3B3
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jun 2020 13:42:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69C18C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jun 2020 11:42:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61907C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 11:42:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05UBeegP017457; Tue, 30 Jun 2020 13:42:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=KKE7r+aBgtGgiqwGj70ki2kFm0LJnaQQiH182rRyYQ8=;
 b=YJKBVqyL14ufPsXCbrXy/gTphtvRjVKhc1OtJ1rnLFBT/EilAfBQADx2BTnUQk2bYgza
 qY5XHcuxhtZdJop9yDbJ8jvFdHYUYSjrJkIKoyo1WWYrcJdDmGDTL+4BIa1qxNzE8wbs
 bjc4J84ihwlLXczEy/gZAEcMvW29blSzS0RSUsA5RujU9CmrESTXmGeHrO1hWkszyTcE
 8N2sKFPKbQNJ3XxqIy/HpXcVTNg+Nru/uVFTpG/hjV1sxuEfui4NQtXl5Xkaa/EAMrzu
 KcooR1kvANXLcDrJpph4bUN4Vi6ChuCB6IAJe0++fmGt7aRz12U6fZV2nfOm+V0ojfKO kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0g27hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 13:42:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A41510002A;
 Tue, 30 Jun 2020 13:42:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F0C92B8A33;
 Tue, 30 Jun 2020 13:42:30 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Jun
 2020 13:42:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 30 Jun 2020 13:42:29 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v3 08/14] cmd: env: add env select command
Thread-Index: AQHWSsawJBFQ5YJGFkqW/pEaduwelKjrQPiAgAW/9EA=
Date: Tue, 30 Jun 2020 11:42:29 +0000
Message-ID: <acd03330616d4fc6aa85d00e2e5082bb@SFHDAG6NODE3.st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-9-patrick.delaunay@st.com>
 <20200626205447.GE8432@bill-the-cat>
In-Reply-To: <20200626205447.GE8432@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_04:2020-06-30,
 2020-06-30 signatures=0
Cc: Joel Johnson <mrjoel@lixil.net>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>, Frank
 Wunderlich <frank-w@public-files.de>, Joe Hershberger <joe.hershberger@ni.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH v3 08/14] cmd: env: add env select command
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

Hi Tom

> From: Tom Rini <trini@konsulko.com>
> Sent: vendredi 26 juin 2020 22:55
> 
> On Thu, Jun 25, 2020 at 09:59:52AM +0200, Patrick Delaunay wrote:
> 
> > Add the new command 'env select' to force the persistent storage of
> > environment, saved in gd->env_load_prio.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> [snip]
> > +	/* search priority by driver */
> > +	for (prio = 0; (drv = env_driver_lookup(ENVOP_INIT, prio)); prio++) {
> > +		if (entry->location == env_get_location(ENVOP_LOAD, prio)) {
> > +			/* when priority change, reset the ENV flags */
> > +			if (gd->env_load_prio != prio) {
> > +				gd->env_load_prio = prio;
> > +				gd->env_valid = ENV_INVALID;
> > +				gd->flags &= ~GD_FLG_ENV_DEFAULT;
> > +			}
> > +			printf("OK\n");
> > +			return 0;
> > +		}
> > +	}
> 
> So, after we do this, is some follow up env command required to initialize the
> environment to now exist somewhere else?  Or will we have initialized all
> configured locations during boot, and don't have to?
> But what will happen if we select say "nand" but it's not present so didn't init.  Will
> things fail gracefully (not panic) ?  Thanks!

I was not sure if a automatic load was needed in this command, as I add a sparate load command
in this patch I don't add an  automatic load => and default env is used

My expected sequence for the env commands was:

	env  select  <target> 
	env load
	...
	env save

when user try to select a not compiled backend the command return "driver not found"
(tested on sandbox, I will add unitary test for this point)

or when backend is not accessible by any priority, the select command return pritority not found
	manual test on sandbox, with env_locations[] = { ENVL_NOWHERE };	

	=> env select EXT4
	Select Environment on EXT4: priority not found

I don't think that abort can occur for other commands because
- the env backend for all priotity are initialized at boot (env_init use the same loop than env select)

- in all env function (env_load / env_reload / env_save it is tested again
   (to check if the backend was correctly initilializaed, if .init() retur 0= 
		if (!env_has_inited(drv->location))
			return -ENODEV;

- all direct acces (in env_get_char for example) are intercepted because gd->env_valid == ENV_INVALID
     => by default (without explicite reload) the default environent is used, exactly when the load failed.
     => "gd->env_addr" is never used


but user can also execute the sequence 

	env  select  <target>
	env save

and here the command behavior  is strange....
because the default is forced on each select

	env select EXT4
	env load

	env select MMC    (reset on default  environment)
	env save

=> I expect at the end of the sequence the EXT4 env was copied in MMC....
     But in finally only the default environment is saved in MMC

I don't sure of the expected behavior by user for these commands....

what it is better solution ?
add a option to select command ? 
force the load after the select ?

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
