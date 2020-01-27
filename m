Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC814A248
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2020 11:54:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AF5CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2020 10:54:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08837C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 10:54:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RArJLZ009889; Mon, 27 Jan 2020 11:54:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/IIDFUgHSqYlxBJluxd7KVGQ7oQv41sB42NzqafgyrI=;
 b=ABiyLHeWlwIp0B9jNbXXml657yAUGDcvLPSL8v51nVwwo/VjbVymPrxSk1TMGABy2kJW
 5HRf4pdrUyYtpI6Mhxzfn8MkhZWSJsJYFEtadbR1gmoaMzim2iWknkuTXLR3LIbxOL59
 7VyDAbM0EUH40ZyYKPCDv7BNPM6uJmpAcAO7xBmWXy6RtbPTSb6tF1Zn4hCAyDmqZFfz
 HkelaDgZEvsnijxahXgId7GNEXCtKos4J5nXuV22xNwEM6YoNFOkZJyncH2hkB6jhB1W
 rFqeLOMVFHiuVRmIUPTzqq9JJpaJ6FWhrMtuCFpBSGg15B5rSF1ElpqrGNChKXtXpr8n fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbparnhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 11:54:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1E5D10002A;
 Mon, 27 Jan 2020 11:54:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEC6621ED06;
 Mon, 27 Jan 2020 11:54:32 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jan
 2020 11:54:32 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Jan 2020 11:54:32 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 3/5] cmd: env: check real location for env info command
Thread-Index: AQHV0rKIoPb7BMNXOEaw38kubYKQJaf5uwcAgASe1/A=
Date: Mon, 27 Jan 2020 10:54:32 +0000
Message-ID: <0a66c23475b3479bbdbec0c014488571@SFHDAG6NODE3.st.com>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
 <20200124133332.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
 <20200124131714.CE60724065B@gemini.denx.de>
In-Reply-To: <20200124131714.CE60724065B@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/5] cmd: env: check real location for env
	info command
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

Hi Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: vendredi 24 janvier 2020 14:17
> 
> Dear Patrick Delaunay,
> 
> In message
> <20200124133332.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
> you wrote:
> > Check the current ENV location, dynamically provided by the weak
> > function env_get_location to be sure that the environment can be
> > persistent.
> >
> > The compilation flag ENV_IS_IN_DEVICE is not enough when the board
> > dynamically select the available storage location (according boot
> > device for example).
> >
> > This patch solves issue for stm32mp1 platform, when the boot device is
> > USB.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  cmd/nvedit.c           | 13 ++++++++++---
> >  env/env.c              | 18 ------------------
> >  include/env_internal.h | 20 ++++++++++++++++++++
> >  3 files changed, 30 insertions(+), 21 deletions(-)
> >
> > diff --git a/cmd/nvedit.c b/cmd/nvedit.c index 3d1054e763..a37b7c094a
> > 100644
> > --- a/cmd/nvedit.c
> > +++ b/cmd/nvedit.c
> > @@ -1269,9 +1269,16 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
> >  	/* evaluate whether environment can be persisted */
> >  	if (eval_flags & ENV_INFO_IS_PERSISTED) {  #if
> > defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> > -		if (!quiet)
> > -			printf("Environment can be persisted\n");
> > -		eval_results |= ENV_INFO_IS_PERSISTED;
> > +		enum env_location loc = env_get_location(ENVOP_SAVE,
> 
> Please do not declare variables right in the middle of the code!

Yes, I will modify it....
I am surprised that this issue pas the check patch.
 
> 
> > +++ b/env/env.c
> > @@ -105,24 +105,6 @@ static void env_set_inited(enum env_location location)
> >  	gd->env_has_init |= BIT(location);
> >  }
> >
> > -/**
> > - * env_get_location() - Returns the best env location for a board
> > - * @op: operations performed on the environment
> > - * @prio: priority between the multiple environments, 0 being the
> > - *        highest priority
> > - *
> > - * This will return the preferred environment for the given priority.
> > - * This is overridable by boards if they need to.
> > - *
> > - * All implementations are free to use the operation, the priority
> > and
> > - * any other data relevant to their choice, but must take into
> > account
> > - * the fact that the lowest prority (0) is the most important
> > location
> > - * in the system. The following locations should be returned by order
> > - * of descending priorities, from the highest to the lowest priority.
> > - *
> > - * Returns:
> > - * an enum env_location value on success, a negative error code
> > otherwise
> > - */
> >  __weak enum env_location env_get_location(enum env_operation op, int
> > prio)
> 
> I think it is a really bad idea to remove the comment from the implementation.
> Please keep it here.

Yes I  agree .
I will come back on this par.
 
> > --- a/include/env_internal.h
> > +++ b/include/env_internal.h
> > @@ -209,6 +209,26 @@ struct env_driver {
> >
> >  extern struct hsearch_data env_htab;
> >
> > +/**
> > + * env_get_location() - Returns the best env location for a board
> > + * @op: operations performed on the environment
> > + * @prio: priority between the multiple environments, 0 being the
> > + *        highest priority
> > + *
> > + * This will return the preferred environment for the given priority.
> > + * This is overridable by boards if they need to.
> > + *
> > + * All implementations are free to use the operation, the priority
> > +and
> > + * any other data relevant to their choice, but must take into
> > +account
> > + * the fact that the lowest prority (0) is the most important
> > +location
> > + * in the system. The following locations should be returned by order
> > + * of descending priorities, from the highest to the lowest priority.
> > + *
> > + * Returns:
> > + * an enum env_location value on success, a negative error code
> > +otherwise  */ enum env_location env_get_location(enum env_operation
> > +op, int prio);
> 
> If absolutely necessary, copuy only what is needed for API documentation.

Ok

> Best regards,
> 
> Wolfgang Denk
> 
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de "This
> is a test of the Emergency Broadcast System. If this had been an actual
> emergency, do you really think we'd stick around to tell you?"

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
