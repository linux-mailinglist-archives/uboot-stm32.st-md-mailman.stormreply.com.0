Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023529CFD1
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 12:53:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8377C36B0B;
	Wed, 28 Oct 2020 11:53:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AA41C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 11:53:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SBl8PY015892; Wed, 28 Oct 2020 12:52:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dQrKwCdfef3O1jKQSevMDMe2vmYyMJXHWveU7VNHvKQ=;
 b=d+O8ytUE5AHVyMrYwfioHbgfrkRzPm5WmbLWaOqVKZmFCi9dUf+/3c7MHPtI+edvJ2Gb
 ZE+dQk4kjAYLSBpT0/XdBw45yDb47s9dhcqLmTFl/k+8fmYkX/L0Hc9Do9fIwNc+iVSP
 cppeU3eNExr3cmgJgmTPgGUV25O9iS36NqOVYNYeYEhMsJEsZYXwUGhpq0q+Ms13/+/A
 uiQzTvjvn7f5nzS+erXVNncU5dsMoNz20ZIF3iegFBsyuhX2UkIP+EeObxZCebBMrJ7T
 DqS/rI4cV/Ae9ae0tYkXBhjDjLWO08U6hLDbF58cNHNKn5nwkwFRvxXQGeJ+0/1b8k8q gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj2119b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 12:52:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1C99100038;
 Wed, 28 Oct 2020 12:52:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B75E02BA2BB;
 Wed, 28 Oct 2020 12:52:40 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 12:52:40 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 28 Oct 2020 12:52:40 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 00/33] stm32: enable logging features
Thread-Index: AQHWogq+KGMXxr763EqZXROs/LdT36mYo72AgAAosRCAEXl6gIACseXA
Date: Wed, 28 Oct 2020 11:52:40 +0000
Message-ID: <8a219eb12a6446999545b375827980d8@SFHDAG2NODE3.st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
 <88a21c960cc248af9cd08e2fc5681a69@SFHDAG2NODE3.st.com>
 <CAPnjgZ3S8PzSYjJSNJ0HhYk_=jkFR4yryL-qwPZRDM4BDQOwiw@mail.gmail.com>
In-Reply-To: <CAPnjgZ3S8PzSYjJSNJ0HhYk_=jkFR4yryL-qwPZRDM4BDQOwiw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_06:2020-10-26,
 2020-10-28 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Heiko Schocher <hs@denx.de>, Christophe KERELLO <christophe.kerello@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Lukasz Majewski <lukma@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [Uboot-stm32] [PATCH 00/33] stm32: enable logging features
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

> From: Simon Glass <sjg@chromium.org>
> Sent: lundi 26 octobre 2020 20:23
> 
> Hi Patrick,
> 
> On Thu, 15 Oct 2020 at 09:59, Patrick DELAUNAY <patrick.delaunay@st.com>
> wrote:
> >
> > Hi Simon,
> >
> > > From: Simon Glass <sjg@chromium.org>
> > > Sent: jeudi 15 octobre 2020 17:06
> > >
> > > Hi Patrick,
> > >
> > > On Wed, 14 Oct 2020 at 03:16, Patrick Delaunay
> > > <patrick.delaunay@st.com>
> > > wrote:
> > > >
> > > >
> > > > This patch-set migrates several stm32 drivers to API compatible
> > > > with logging features (use dev_...() or log_...() function) and
> > > > activate the logging features in STM32MP15 boards.
> > > >
> > > > The size of U-Boot increased by 19kB (933026 to 952830 on
> > > > STM32MP157C-EV1 board for basic defconfig) but the boot time don't
> > > > change
> > > drastically.
> > >
> > > >

(...)

> > > > For information even with all trace embbeded in U-Boot but not
> > > > activated, MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6
> > > >
> > > > Size increase by 190KB (952830 to 1147918) but boot time is stable
> > > > (1,748s vs 1,696s).
> > >
> > > This seems pretty bad. Is this because of console output, or
> > > something else? I understand the size increase, but not the boot time
> increase.
> >
> > For this last point I just execute STM32MP157C-EV1 boot with a patch
> > in configs/stm32mp15_basic_defconfig
> >
> > +CONFIG_LOGLEVEL=8
> > +CONFIG_LOG_MAX_LEVEL=8
> > +CONFIG_LOG_DEFAULT_LEVEL=6
> > +CONFIG_LOGF_FILE=y
> > +CONFIG_LOGF_LINE=y
> > +CONFIG_LOGF_FUNC=y
> >
> > And execute "bootstage report" after the second boot (the first boot
> > is pertubated by env save)
> >
> > I think the delta is linked to
> > 1/ size of U-Boot (SPL spent more time to load U-Boot)
> >     end of SPL 987,579  => 996,117
> 
> OK.
> 
> >
> > 2/ time to check for each debug trace: because I increase the log level
> >    (gd->default_log_level = 6 < MAX_LOG_LEVEL=8)
> 
> This might be the biggest part. If you look at _log() it always does the vsprintf()
> even if in fact log_dispatch() does not dispatch it to anything.

Yes, log_dispatch / log_passes_filter are called after vsnprintf

> I suspect that could be refactored to move the checking to a separate function,
> and then call it before doing the expensive vsprintf().

Or save va_list, fmt in log_rec and call vsnprintf allow when needed in log_dispatch, just before emit

> >
> > 3/ treatment added in log_console_emit (some printf) and
> >     log_dispatch (processing_msg / gd->loghead)
> 
> Likely this is fast.
> 
> >
> > 4/ lower cache performancy as trace code are pesent in memory even
> >     they are not used
> >
> > Can I do some check/experimentation on my side ?
> 
> Yes, if you can use the bootstage_start() and bootstage_accum() within the _log()
> function to measure the total time take in the run.

Ok, I add it in my TODO list

> Regards,
> Simon

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
