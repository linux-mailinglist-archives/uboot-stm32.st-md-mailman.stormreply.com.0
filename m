Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88214EE7E
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 15:31:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D2A0C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 14:31:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E091C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 14:31:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VENPMT001705; Fri, 31 Jan 2020 15:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+iv+/mf0bScIt+WDSIwv1wG8J87mRvb+jnoSCHbpIz4=;
 b=oGR0BM5FYqNGMmk5WXCCwycu+hCmzzHEoK9qWPBr5KVcMF2c0rowjO52vpdcpqWjrFmw
 6Uz8ZDF2M/F784Iz6adH7urLGnTxe/GdCdMzpT9xa6ZBqhwcv33ZGYVt9mChTdTqCW5q
 z1MkahZxI/shM1+nuMnQY60RzShFm64px9Oc/WtIt97ARPL4B02eZNMyR9RDZ76LEQoU
 7xEEyLtif9Qefzn76GHl6VaS88Xhg7svPNtrWjGoAgBV39DnMWgmCxam8kUVqQWUFHIe
 lEih4yDsbuJnv8lIML8wlSs2EEPpBkHtj32Nhaz2PQKg9paxZt5uKsPjrNunCPvN35mV zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcayeb3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 15:31:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6594E10002A;
 Fri, 31 Jan 2020 15:31:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45EFC2BF9AE;
 Fri, 31 Jan 2020 15:31:14 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 31 Jan
 2020 15:31:13 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 31 Jan 2020 15:31:13 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 1/5] cmd: env: add option for quiet output on env info
Thread-Index: AQHV0rKH04NTdQ1xPkK1xI7tI+VQvqgCcL4AgAJsJzA=
Date: Fri, 31 Jan 2020 14:31:13 +0000
Message-ID: <965b97ea1b3e466a9bf18ff5f66efd99@SFHDAG6NODE3.st.com>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
 <CAPnjgZ3=FfN=f8NFQ=5mw+L8DNsENpNqswk5XxZSpdfTx0WPDA@mail.gmail.com>
In-Reply-To: <CAPnjgZ3=FfN=f8NFQ=5mw+L8DNsENpNqswk5XxZSpdfTx0WPDA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_03:2020-01-31,
 2020-01-31 signatures=0
Cc: Anup Patel <Anup.Patel@wdc.com>, Leo Ruan <tingquan.ruan@cn.bosch.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Frank
 Wunderlich <frank-w@public-files.de>, Lukasz Majewski <lukma@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] cmd: env: add option for quiet output
	on env info
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

> From: Simon Glass <sjg@chromium.org>
> Sent: jeudi 30 janvier 2020 03:18
> 
> On Fri, 24 Jan 2020 at 05:34, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > The "env info" can be use for test with -d and -p parameter, in
> > scripting case the output of the command is not needed.
> >
> > This patch allows to deactivate this output with a new option "-q".
> >
> > For example, we can save the environment if default environment is
> > used and persistent storage is managed with:
> >   if env info -p -d -q; then env save; fi
> >
> > Without the quiet option, I have the unnecessary traces First boot:
> >       Default environment is used
> >       Environment can be persisted
> >       Saving Environment to EXT4... File System is consistent
> >
> > Next boot:
> >       Environment was loaded from persistent storage
> >       Environment can be persisted
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  cmd/Kconfig  |  1 +
> >  cmd/nvedit.c | 26 +++++++++++++++++++-------
> >  2 files changed, 20 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>

Thanks for the review

 > We could have a test for this command

Yes, I will do it.

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
