Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F34728F640
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 17:59:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3D11C424B2;
	Thu, 15 Oct 2020 15:59:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4B7FC424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 15:59:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FFqSYL030131; Thu, 15 Oct 2020 17:59:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EMDBG3SteBBC9swTBIquyfyj6EMcxsdiN2tayPffSNg=;
 b=uDFN+Dimug15BKDuqmJh03NOHhFhW9686H8D/0z4GBFsQq4Tgc9BU/48xahWgap2TxsZ
 An8iW72jtpKHEezSRhPu01WSNxdmbq+uZEAw7ZBZZwJ80KMeF9qIJSZBshnsOqYpkfuh
 Sd+lEbgaMxIUnlsPxPZUes6PFeT7b0OYdsyy0o7p/yApffoaL2B5IjYwg8fSxrV6uGbd
 p6ZIBKDFc6d9l3Td2A9z2k2jsknjbX85SuRzktqPw4abkx+m6tLn/wz+G9eoD1QhsWvc
 4EbwLROICMsY4ymtz1yG0C1aondyOR0nI1KnIsmhMvpLU1CJn+hRWRskErenkRGu09AE 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wqu5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 17:59:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4FD510002A;
 Thu, 15 Oct 2020 17:59:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA43F2CD074;
 Thu, 15 Oct 2020 17:59:08 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 17:59:08 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 15 Oct 2020 17:59:08 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 00/33] stm32: enable logging features
Thread-Index: AQHWogq+KGMXxr763EqZXROs/LdT36mYo72AgAAosRA=
Date: Thu, 15 Oct 2020 15:59:08 +0000
Message-ID: <88a21c960cc248af9cd08e2fc5681a69@SFHDAG2NODE3.st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ2Z8=hXqoWXz8nuUToWTGz3sCY8zneGA9WsaVGYPprxzQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_10:2020-10-14,
 2020-10-15 signatures=0
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
> Sent: jeudi 15 octobre 2020 17:06
> 
> Hi Patrick,
> 
> On Wed, 14 Oct 2020 at 03:16, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> >
> > This patch-set migrates several stm32 drivers to API compatible with
> > logging features (use dev_...() or log_...() function) and activate
> > the logging features in STM32MP15 boards.
> >
> > The size of U-Boot increased by 19kB (933026 to 952830 on
> > STM32MP157C-EV1 board for basic defconfig) but the boot time don't change
> drastically.
> 
> >
> > For example on STM32MP157C-EV1 board:
> >
> > 1/ Before LOG patchset
> >
> > Timer summary in microseconds (12 records):
> >        Mark    Elapsed  Stage
> >           0          0  reset
> >     224,514    224,514  SPL
> >     961,170    736,656  end SPL
> >     964,006      2,836  board_init_f
> >   1,186,986    222,980  board_init_r
> >   1,651,379    464,393  id=64
> >   1,674,463     23,084  id=65
> >   1,675,164        701  main_loop
> >   4,025,806  2,350,642  id=175
> >
> > Accumulated time:
> >                 55,064  dm_f
> >                 66,749  dm_r
> >                 88,796  dm_spl
> >
> > 2/ With LOG activated (after this patchset)
> >
> > Timer summary in microseconds (12 records):
> >        Mark    Elapsed  Stage
> >           0          0  reset
> >     227,142    227,142  SPL
> >     984,585    757,443  end SPL
> >     987,579      2,994  board_init_f
> >   1,210,091    222,512  board_init_r
> >   1,673,354    463,263  id=64
> >   1,696,073     22,719  id=65
> >   1,696,775        702  main_loop
> >   5,443,104  3,746,329  id=175
> >
> > Accumulated time:
> >                 62,154  dm_f
> >                 66,264  dm_r
> >                 89,376  dm_spl
> >
> > For information even with all trace embbeded in U-Boot but not
> > activated, MAX_LOG_LEVEL=8 and LOG_DEFAULT_LEVEL=6
> >
> > Size increase by 190KB (952830 to 1147918) but boot time is stable
> > (1,748s vs 1,696s).
> 
> This seems pretty bad. Is this because of console output, or something else? I
> understand the size increase, but not the boot time increase.

For this last point I just execute STM32MP157C-EV1 boot 
with a patch in configs/stm32mp15_basic_defconfig

+CONFIG_LOGLEVEL=8
+CONFIG_LOG_MAX_LEVEL=8
+CONFIG_LOG_DEFAULT_LEVEL=6
+CONFIG_LOGF_FILE=y
+CONFIG_LOGF_LINE=y
+CONFIG_LOGF_FUNC=y

And execute "bootstage report" after the second boot
(the first boot is pertubated by env save)

I think the delta is linked to 
1/ size of U-Boot (SPL spent more time to load U-Boot)
    end of SPL 987,579  => 996,117

2/ time to check for each debug trace: because I increase the log level
   (gd->default_log_level = 6 < MAX_LOG_LEVEL=8)

3/ treatment added in log_console_emit (some printf) and
    log_dispatch (processing_msg / gd->loghead)

4/ lower cache performancy as trace code are pesent in memory even
    they are not used

Can I do some check/experimentation on my side ?

Patrick

> >
> > STM32MP> bootstage report
> > Timer summary in microseconds (12 records):
> >        Mark    Elapsed  Stage
> >           0          0  reset
> >     230,028    230,028  SPL
> >     996,117    766,089  end SPL
> >     999,082      2,965  board_init_f
> >   1,220,225    221,143  board_init_r
> >   1,718,641    498,416  id=64
> >   1,746,096     27,455  id=65
> >   1,748,202      2,106  main_loop
> >   4,509,271  2,761,069  id=175
> >
> > Accumulated time:
> >                 58,481  dm_f
> >                 68,881  dm_r
> >                 89,385  dm_spl
> >
> >
> >

(...)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
