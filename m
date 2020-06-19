Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016D200BD7
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 16:40:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D043BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 14:40:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A94D5C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 14:40:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JEcZBH022077; Fri, 19 Jun 2020 16:40:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=02v1Gp7SnFPu5/p3B+JG8nD20PX0GOe+XvS+d2dit10=;
 b=0v0VxERdDgp8bMlh0JDeoWlGJn20zxbKzgu4FONqdyfHXebcOdES1md/VYLnbVZC98FE
 lfH7LD4hc5JDlYNrAYQW4iXcZJbdTxMzemg5jkltwSPIU0mS6bbRyJ7nJB/NxFkm8Smu
 217y418w5DppRoP2+S7nZ8/n/3nj4pYGoNjRCzeyHYuwi1s7/Jrsiw82gZEoMJ06pfmJ
 zYqFgk8x3B4wZkIZeHTOG99Q6SJSHu5pPOpu7MobzC4VT5qkf0vXp4VpKMtmSWZVHEt8
 7lpqIb03pXtjlNiziQA3TY38fYXka8mi10IhSASgfKbxZ0Ss9r1xypqGJkIsQLIC0M7b oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q649scuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 16:40:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69F79100034;
 Fri, 19 Jun 2020 16:40:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D6732C38DA;
 Fri, 19 Jun 2020 16:40:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 16:40:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 19 Jun 2020 16:40:06 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v2 5/9] sandbox: support the change of env location
Thread-Index: AQHWQ7F3yFjAJvZ5UU6tPkkP+iyldajeoUGAgAFiWpA=
Date: Fri, 19 Jun 2020 14:40:06 +0000
Message-ID: <817efefe407341aa98d6a80f037a1610@SFHDAG6NODE3.st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-6-patrick.delaunay@st.com>
 <20200618191719.GV27801@bill-the-cat>
In-Reply-To: <20200618191719.GV27801@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_16:2020-06-19,
 2020-06-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] sandbox: support the change of env
	location
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

Hi,

> From: Tom Rini <trini@konsulko.com>
> Sent: jeudi 18 juin 2020 21:17
> 
> On Tue, Jun 16, 2020 at 09:40:44AM +0200, Patrick Delaunay wrote:
> 
> > Add support of environment location with a new sandbox command
> > 'env_loc'.
> >
> > When the user change the environment location with the command
> > 'env_loc <location>' the env is reinitialized and saved; the
> > GD_FLG_ENV_DEFAULT flag is also updated.
> >
> > When the user set the same env location, the environment is re-loaded.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v2:
> > - change cmd_tbl_t to struct cmd_tbl
> >
> >  board/sandbox/sandbox.c | 42
> > ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> This is for testing, which is why it's on sandbox?  But I think we should have this
> be a generic opt-in feature as changing where environment is saved at run time
> has use cases when we have multiple available.  Thanks!

Yes in my mind it was only for testing on sandbox....

But  I agree, I can a add a opt-in generic command to select and load ENV on one target.

Someting as "env load [<target>] " which loads with the request backend and update gd->env_load_prio

With <target> = name of the name define in backend with ENV_NAME macro
And using the default location gd->env_load_prio when absent.

Or split in 2 new commands

- env select <target>
- env load

Perhaps this last proposal with 2 command is more flexible.... 
to be combined with other command (env save / env erase)

if this proposal is OK, I will work on it.....

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
