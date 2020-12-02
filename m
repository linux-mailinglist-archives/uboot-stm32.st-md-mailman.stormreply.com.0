Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA52CBB13
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 11:55:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1E7C424C0;
	Wed,  2 Dec 2020 10:55:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2840EC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 10:55:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2All37012340; Wed, 2 Dec 2020 11:55:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VxNMu+mN3d0MzHqgLIOyZofDd8N6+eZE3P35+VNM+4E=;
 b=aqxejKOsON4qfkUsJbSj5ea62xFJpR5N3VJdYIZYRwTU9Sv3TQyQAOfGxHqkJrAuXSto
 YD1Bh9iceTcQIUHalHrt8dMIuSPX0JoM0sn5qGs9rlyuVTijZ3gNLhGGyPx8mr51fQvu
 1U/pWG4v/8nsrsTUH+1zguh1PVgiHp9TSsmq6qQswgFc5Z6R5vdavlW+EsczX24z6sJ2
 R31y2AtsoPlh4XZE1irFPEizFptPXZRheR41NABMBPoDt+91qIbNyVVipyUw+qWu6EzI
 MgugJ6MMpyqtewBGnAf+FK4ySG/BW/tkLUUciHAziGjyuMbwiCKLY0t7qxQ+5UmP0j3r 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w2vawfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 11:55:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72F92100034;
 Wed,  2 Dec 2020 11:55:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64D80245E5B;
 Wed,  2 Dec 2020 11:55:23 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 11:55:23 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 2 Dec 2020 11:55:23 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Sean Anderson <seanga2@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 4/9] log: use console puts to output trace before LOG
 init
Thread-Index: AQHWxKcFGdDgxDlaSEK3Yn4tGIGhrKncAmgAgAeBlYA=
Date: Wed, 2 Dec 2020 09:15:55 +0000
Message-ID: <d4c8cc64b2e14ff9af03f4b9e658e2ee@SFHDAG2NODE3.st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127112000.v2.4.I01167328d604e359d69c0d241754caeec1f65ebe@changeid>
 <07e2863f-aa2a-e995-1958-9bae28006a46@gmail.com>
In-Reply-To: <07e2863f-aa2a-e995-1958-9bae28006a46@gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v2 4/9] log: use console puts to output
 trace before LOG init
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
> Sent: vendredi 27 novembre 2020 16:02
> 
> On 11/27/20 5:20 AM, Patrick Delaunay wrote:
> > Use the console puts functions to output the traces before the log
> > initialization (when CONFIG_LOG is not activated).
> >
> > This patch allows to display the first U-Boot traces (with macro
> > debug) when CONFIG_DEBUG_UART is activated and not only drop them.
> >
> > For example for traces in board_f.c requested by the macro debug, when
> > LOG_DEBUG is defined and CONFIG_LOG is activated.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v2:
> > - replace printascii by console puts, remove test on CONFIG_DEBUG_UART
> >
> >   common/log.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/common/log.c b/common/log.c index 212789d6b3..a4ed7d79f8
> > 100644
> > --- a/common/log.c
> > +++ b/common/log.c
> > @@ -246,6 +246,15 @@ int _log(enum log_category_t cat, enum
> > log_level_t level, const char *file,
> >
> >   	if (!(gd->flags & GD_FLG_LOG_READY)) {
> >   		gd->log_drop_count++;
> > +
> > +		/* display dropped traces with console puts and DEBUG_UART */
> > +		if (rec.level <= CONFIG_LOG_DEFAULT_LEVEL ||
> rec.force_debug) {
> > +			va_start(args, fmt);
> > +			vsnprintf(buf, sizeof(buf), fmt, args);
> > +			puts(buf);
> > +			va_end(args);
> > +		}
> > +
> >   		return -ENOSYS;
> >   	}
> >   	va_start(args, fmt);
> >
> 
> Couldn't this be done like
> 
>   	va_start(args, fmt);
>   	vsnprintf(buf, sizeof(buf), fmt, args);
>   	va_end(args);
>   	rec.msg = buf;
> 	if (!gd || !(gd->flags & GD_FLG_LOG_READY)) {
> 		if (gd)
> 			gd->log_drop_count++;
> 		if (rec.level < CONFIG_LOG_DEFAULT_LEVEL ||
> 		    rec.force_debug)
> 			puts(buf);
> 		return -ENOSYS;
> 	}
> 
> I don't see the optimization of not doing the vsnprintf() coming up very often.

In normal use case, I agree it should be occurs often, with default LOGLEVEL.

But it is not the case if LOGLEVEL increase => all the debug existing in
U-boot code will call the log function and then the vsnprintf can cost few us
(I make measurement on stm32mp157 board)

This patch at be done after Simon remarks in
http://u-boot.10912.n7.nabble.com/PATCH-00-33-stm32-enable-logging-features-tt429439.html#none

The better optimization found is to execute the vsnprintf only before the log message is really dispatched 
(patch 2/9 of the serie),

I reduce drastically the log overhead when MAX_LOG_LEVEL=8 and when
all log messages > CONFIG_LOG_DEFAULT_LEVEL= 6 are filtered
=> with patch 2/9: all debug messages in U-Boot are build but not displayed. 

This patch is not elegant, but it is a consequence of this optimization.

> Also, shouldn't this return 0 instead of ENOSYS if something is actually printed?

I hesitate about the return value, but I choose to keep the ENOSYS because 
even if the trace can be displayed (but not is all the case, only if DEBUG_UART is activated)

The real LOG feature failed => LOG trace is dropped, the string with added information
(filename , line, function name) is not build and not send to all LOG backend
(console et/or in network et/or other support log backend)

But return value of _log() is not important because is never used except in cmd_log.c
(not used in log() macro).

But to be more clear I can add trace for dropped trace:

 		if (rec.level < CONFIG_LOG_DEFAULT_LEVEL ||
 		    rec.force_debug) {
+ 			puts("log dropped:");
 			puts(buf);
		}

> 
> --Sean

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
