Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7DEA9C61
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Sep 2019 09:57:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A332DC36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Sep 2019 07:57:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BB7AC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 07:57:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x857uT5i009077; Thu, 5 Sep 2019 09:56:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ktGr6RuqJIMoJtRi7QWzoYbm0kFi3ydA4HHLq3RmCDw=;
 b=MKl+ITZml4fczFfZSsQjC3LySOuIphJ0Tf+nP57SZNKIhUDUx0VOAsgNjbNXc/DTC27a
 ueg/D13El2XYSn0GsVCZkVT5hvH5euJ0s7dMhoTfxTfXcZS5Yl5cs7HJKgiIwJnxz9c3
 fys/lwbUzUUO7V7P6+fFIeM1I5+GtIUxMWgQCSjZbcr5+YEvWbnzmMIil37V0BiamLLD
 iCqe2BVq/ne6powk+V+fG48sf9aoISh9yInWcd6043s0Y2yvZB/YhlLRbEy3YxjkJoX5
 XLrSCTFF2t6/whVENiCz7x1UqVr9kL3te38n9q5b+WMDQCbXmlxAX+CeUpvcrNmiucU3 vQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec36mch-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 05 Sep 2019 09:56:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 71B044D;
 Thu,  5 Sep 2019 07:56:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 654B62B92BD;
 Thu,  5 Sep 2019 09:56:46 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Sep
 2019 09:56:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 5 Sep 2019 09:56:45 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [PATCH] env: Add CONFIG_ENV_SUPPORT
Thread-Index: AQHVYnpO9RDl78dH/0CQ7vwuqVbTS6cbFXWAgAGjOcA=
Date: Thu, 5 Sep 2019 07:56:45 +0000
Message-ID: <7fea5cf3c889406cb74e652068f0aaa0@SFHDAG6NODE3.st.com>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
 <20190904105141.71c20ab0@jawa>
In-Reply-To: <20190904105141.71c20ab0@jawa>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_02:2019-09-04,2019-09-05 signatures=0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Eugeniu
 Rosca <roscaeugeniu@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Jagan
 Teki <jagan@amarulasolutions.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>,
 Adam Ford <aford173@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH] env: Add CONFIG_ENV_SUPPORT
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

Hi Lukasz,

> From: Lukasz Majewski <lukma@denx.de>
> Sent: mercredi 4 septembre 2019 10:52
> 
> Hi Patrick,
> 
> > Add a new flag CONFIG_ENV_SUPPORT to compile all the environment
> > features in U-Boot (attributes, callbacks and flags). It is the
> > equivalent of the 2 existing flags
> > - CONFIG_SPL_ENV_SUPPORT for SPL
> > - CONFIG_TPL_ENV_SUPPORT for TPL
> 
> Shouldn't it be the "supplement" ?
> 
> I guess that it is possible to define
> 
> CONFIG_SPL_ENV_SUPPORT to have ENV support in SPL
> 
> CONFIG_TPL_ENV_SUPPORT to have ENV support in TPL
> 
> and there is a third flag - CONFIG_ENV_SUPPORT to enable envs support in U-
> Boot proper?
> 
> In that way one can enable ENV support only in SPL (via SPL_ENV_SUPPORT)
> and disable envs in U-Boot proper (by NOT defining ENV_SUPPORT) and use
> build in envs (in the binary).

Yes exactly the support for U-Boot, SPL or TPL are now independent,
I will update the commit message in V2, "supplement" is more clear.

> 
> >
> > This new configuration allows to use the macro
> > CONFIG_IS_ENABLED(ENV_SUPPORT) in the code without issue and solves
> > the regression introduced by commit 7d4776545b0f ("env: solve
> > compilation error in SPL"); change_ok was always NULL in U-Boot.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  cmd/Kconfig            |  2 ++
> >  env/Kconfig            |  7 +++++++
> >  env/Makefile           | 11 ++++-------
> >  include/env_callback.h |  4 ++++
> >  include/env_flags.h    |  4 ++++
> >  5 files changed, 21 insertions(+), 7 deletions(-)

> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 

Best regards

Patrick Delaunay
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
