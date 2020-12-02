Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A17542CBB15
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 11:55:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C691C56630;
	Wed,  2 Dec 2020 10:55:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C3EC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 10:55:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2Ar2o7009253; Wed, 2 Dec 2020 11:55:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sqViEZ1w8J0/QGA68+3gWgzLR8GV8Z8OliV1vm2QYqw=;
 b=mzE5uhQBOtI+3Zmpk3EKM9tcNXW0rul4hJoKwTwPdrChZy8u7e3iR5TuMocnyst2tMA5
 UWHhG2WwwBrEeNS9BcffcdqeSXAL3MHouvNK82HbFK107a9QQ5AuT+01oUe+XCAbnIu8
 IzL1+H80sZEw4mz7NxaMj4+1DyLNd4t8oJRYZr3GxyD8GuO3XQ/s+cK1xCEU2MbE2nJI
 F0z6qJt8bvEA7P59EiACCBei58VMM3E15tiUIsdMxwgX7EtkABsWcgllJTcasilocDL2
 0aUnEqGW8n+bTOZlrIAZ2InSxhxEkO68STU2WQHGViVmx0aifXSEO3XvhkhHXYHWzmqx QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e2npb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 11:55:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40CB110003A;
 Wed,  2 Dec 2020 11:55:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31A02245E57;
 Wed,  2 Dec 2020 11:55:27 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 11:55:18 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 2 Dec 2020 11:55:18 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Sean Anderson <seanga2@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 2/9] log: don't build the trace buffer when log is not
 ready
Thread-Index: AQHWxKcE9eSYkiTPCkCirjsAnvAYfanb/0IAgAd7CRA=
Date: Wed, 2 Dec 2020 08:37:58 +0000
Message-ID: <03b233cef51f431185e5b9f754f3b94e@SFHDAG2NODE3.st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-3-patrick.delaunay@st.com>
 <19fede5c-166c-1cff-643d-d80cbff6c34b@gmail.com>
In-Reply-To: <19fede5c-166c-1cff-643d-d80cbff6c34b@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_04:2020-11-30,
 2020-12-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/9] log: don't build the trace buffer
 when log is not ready
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

Hi Sean,

> From: Sean Anderson <seanga2@gmail.com>
> Sent: vendredi 27 novembre 2020 15:51
> 
> On 11/27/20 5:20 AM, Patrick Delaunay wrote:
> > Update _log function to drop any traces when log is yet initialized:
> > vsnprintf is no more executed in this case.
> >
> > This patch allows to reduce the cost for the dropped early debug trace.
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > (no changes since v1)
> >
> >   common/log.c | 13 ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/common/log.c b/common/log.c index ce39918e04..212789d6b3
> > 100644
> > --- a/common/log.c
> > +++ b/common/log.c
> > @@ -228,6 +228,9 @@ int _log(enum log_category_t cat, enum log_level_t
> level, const char *file,
> >   	struct log_rec rec;
> >   	va_list args;
> >
> > +	if (!gd)
> > +		return -ENOSYS;
> 
> How early are you expecting this function to get called? AFAIK this will only return
> true before board_init_f_init_reserve. Shouldn't functions that early just not call log
> in the first place?

I don't change the existing behavior, this test exists since the first commit on log.c, done
by Simon.

Patch 8/15 of
http://patchwork.ozlabs.org/project/uboot/list/?series=16677&state=*

I check, this line exist since the first version of this serie....

But I think you are right, log/debug fucntions should not called before C runtime is ready
(including gd configuration in board_init_f_alloc_reserve), it seens as over-protection.

> --Sean
> 
> > +
> >   	/* Check for message continuation */
> >   	if (cat == LOGC_CONT)
> >   		cat = gd->logc_prev;
> > @@ -240,15 +243,15 @@ int _log(enum log_category_t cat, enum log_level_t
> level, const char *file,
> >   	rec.file = file;
> >   	rec.line = line;
> >   	rec.func = func;
> > +
> > +	if (!(gd->flags & GD_FLG_LOG_READY)) {
> > +		gd->log_drop_count++;
> > +		return -ENOSYS;
> > +	}
> >   	va_start(args, fmt);
> >   	vsnprintf(buf, sizeof(buf), fmt, args);
> >   	va_end(args);
> >   	rec.msg = buf;
> > -	if (!gd || !(gd->flags & GD_FLG_LOG_READY)) {
> > -		if (gd)
> > -			gd->log_drop_count++;
> > -		return -ENOSYS;
> > -	}
> >   	if (!log_dispatch(&rec)) {
> >   		gd->logc_prev = cat;
> >   		gd->logl_prev = level;
> >

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
