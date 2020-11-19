Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AD2B93C7
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Nov 2020 14:42:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E984C3FAD6;
	Thu, 19 Nov 2020 13:42:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3D30C35E3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Nov 2020 13:42:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJDfvb3030485; Thu, 19 Nov 2020 14:42:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Yp+J2BUrgHn7CysfhJtcr4agvJP7ufkcv7LSECBxQGg=;
 b=PYlcQ9TXVBtTJ5mkfTa1/PH/0io1L+gGdJHpD3+l56WHgys4yJMdqHncLJns4eHN3tb3
 qBeSjwrnpi9k491wZX+t4E/TEw2R3nk3rr7DjvLDf0NdasJYCAgOvZxOVcKtg3vc0Aiw
 qiZcPqEnJaWMv4ud0sDJy6eUTRC1mkt9RdISWtY5o2uokyPx9ZJu7T3oNH9BC03nr1h4
 4nf+r2+NcIHdUKDdtiA+lO4eUjEcmVScwtgHdNMIz0Qo3Dg14qVSKEP0pUx2RUu0wTCV
 IpkafIN4Rm7/5LGBqlZwC61qVom3IaU3t+/RWRK6dF0CSQ5kLtVey87zK1ruL4oTv+W0 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t70h0ct7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 14:42:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 068E410002A;
 Thu, 19 Nov 2020 14:42:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6E46264DA5;
 Thu, 19 Nov 2020 14:42:30 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 14:42:23 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 19 Nov 2020 14:42:23 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Thread-Topic: [PATCH 2/3] log: use debug uart to output trace before LOG init
Thread-Index: AQHWtGX30OlIPbclRkCcA/J2IFzEJqnC9UcAgAyUZFA=
Date: Thu, 19 Nov 2020 13:42:23 +0000
Message-ID: <38f324dac9c3453bb2a9e1b0b765b18e@SFHDAG2NODE3.st.com>
References: <20201106175339.30683-1-patrick.delaunay@st.com>
 <20201106175339.30683-2-patrick.delaunay@st.com>
 <CAPnjgZ1WOvuw5E04ncJVSqWSAoCbT4i-1FeW=Ob-3L9+VE2J6w@mail.gmail.com>
In-Reply-To: <CAPnjgZ1WOvuw5E04ncJVSqWSAoCbT4i-1FeW=Ob-3L9+VE2J6w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/3] log: use debug uart to output trace
	before LOG init
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
> Sent: mercredi 11 novembre 2020 15:32
> To: Patrick DELAUNAY <patrick.delaunay@st.com>; Heinrich Schuchardt
> 
> +Heinrich Schuchardt

OK

> On Fri, 6 Nov 2020 at 10:55, Patrick Delaunay <patrick.delaunay@st.com> wrote:
> >
> > Use the debug uart functions to output the traces before the log
> > initialization (when CONFIG_LOG is not activated) as it is done in
> > puts/putc function in console.c.
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
> >  common/log.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> Again this needs a sandbox test

I am preparing a sandbox test for v2.
But I think I will replace printascii() by console function, puts()

To use all supported feature of console.c

=> DEBUG_UART / PRE_CONSOLE_BUFFER / CONSOLE_RECORD

CONSOLE_RECORD is needed by unitary test...
 
> >
> > diff --git a/common/log.c b/common/log.c index aadf533fb2..aa5505943f
> > 100644
> > --- a/common/log.c
> > +++ b/common/log.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <common.h>
> > +#include <debug_uart.h>
> >  #include <log.h>
> >  #include <malloc.h>
> >  #include <dm/uclass.h>
> > @@ -245,6 +246,16 @@ int _log(enum log_category_t cat, enum
> > log_level_t level, const char *file,
> >
> >         if (!(gd->flags & GD_FLG_LOG_READY)) {
> >                 gd->log_drop_count++;
> > +
> > +               /* manage droppped trace at default level with debug
> > + uart */
> 
> dropped
> 

OK

 
> > +               if (IS_ENABLED(CONFIG_DEBUG_UART) &&
> > +                   (rec.level <= CONFIG_LOG_DEFAULT_LEVEL ||
> rec.force_debug)) {
> > +                       va_start(args, fmt);
> > +                       vsnprintf(buf, sizeof(buf), fmt, args);
> > +                       printascii(buf);
> > +                       va_end(args);
> > +               }
> > +
> >                 return -ENOSYS;
> >         }
> >         va_start(args, fmt);
> > --
> > 2.17.1
> >

Thanks for the review

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
