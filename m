Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2192CBB14
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 11:55:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63A9DC56635;
	Wed,  2 Dec 2020 10:55:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04A4FC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 10:55:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2Ar1UK009243; Wed, 2 Dec 2020 11:55:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=x4MXw8YknPv70K6ZQCNL6TT1rqWhAU/U+32iTGP0kF8=;
 b=h9xwccaUpUBNkHYC+IK25oxOB0wZrOnGM3BjVS8Q5gkZ1F1Tti+sgiYKJATWOnc+ZM2D
 WhTJoifB43izTNPDEC5ElanfgopaEKUyOWuh+TLZihH4rECmE/ajKpbNy+nQeOWCgdDa
 qqTg4HTpRwLTYY9O5BtbVyg6yKTHAOyyi9c8/sjtQag+9wKvKapLJh1qMByNLs3Iy+X0
 /Yy5QShWRJ6QKiuOZEoju2GPfm5dArVaTzPWRSiwH3YzmzmfORkv9kcwhj1/wIcPYpEo
 RjZn9f2hElMVDHpgJWlL/nORVfhCq9BRXepMTSK77NsEcgsyQLytbEhEg55AjjUeJNjI EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e2np5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 11:55:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A27C10002A;
 Wed,  2 Dec 2020 11:55:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8976C245E55;
 Wed,  2 Dec 2020 11:55:24 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 11:55:23 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 2 Dec 2020 11:55:23 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [Uboot-stm32] [PATCH v2 7/9] console: allow to record console
 output before ready
Thread-Index: AQHWx1UiiQe/T3hD2UyZX45F8sEufKnjkRfA
Date: Wed, 2 Dec 2020 09:55:31 +0000
Message-ID: <c9ebfd35ec6b421680d8b7e2b1a8b102@SFHDAG2NODE3.st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-6-patrick.delaunay@st.com>
 <CAPnjgZ3F08GCMY+K4F8xVS7iFoyDZWY-MQv+OgMzYNfHXqMcQg@mail.gmail.com>
In-Reply-To: <CAPnjgZ3F08GCMY+K4F8xVS7iFoyDZWY-MQv+OgMzYNfHXqMcQg@mail.gmail.com>
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
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, U-Boot Mailing
 List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/9] console: allow to record
	console	output before ready
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

Hi Simon,

> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> Behalf Of Simon Glass
> 
> Hi Patrick,
> 
> On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > Allow to record the console output before before U-Boot has a console
> > ready.
> >
> > This patch allows to test the console output in sandbox test based on
> > console record.
> >
> > It is possible because GD_FLG_RECORD and GD_FLG_SERIAL_READY are 2
> > independent flags.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v2:
> > - Record all messages in console, even when dropped (NEW)
> >
> >  common/console.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/common/console.c b/common/console.c index
> > 70579af042..c3d552bb3e 100644
> > --- a/common/console.c
> > +++ b/common/console.c
> > @@ -519,6 +519,10 @@ void putc(const char c)  {
> >         if (!gd)
> >                 return;
> > +#ifdef CONFIG_CONSOLE_RECORD
> 
> Can we use CONFIG_IS_ENABLED() here and avoid the #ifdef? We might need to
> add some inline functions for the case where console_out is not available. See
> global_data.h for some examples.
...
> 
> Regards,
> Simon

I see this warning when I push this patchset but I preferred sent the path as it,
to easy the review as I just move existing line.

But in parallel I prepare a other patchset to remove all (or almost all) the #if def CONFIG in console.c

I don't sent it yet as I am still solving some compilation issues, but it is solved now....

https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5431

So I will sent it I few days, after a last review / test.

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
