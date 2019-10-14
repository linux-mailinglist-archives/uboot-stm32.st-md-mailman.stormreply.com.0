Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3259D658A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 16:46:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C9A7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 14:46:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CD92C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 14:46:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9EEf94e000328; Mon, 14 Oct 2019 16:46:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nzDeAPR1GMSbJEpKwSNa2ayV05CzIxb0+wQVLSULh4o=;
 b=YwXhm+Vityi8nzh1c2TpnUJC74in+zi4aiuaJuL2mRmOl006CSwpttkcaL3nbrHEZYf0
 o6eNyThCBWuT8kX2EEPbtSKij2y+g15fqIKV5U4CpYIukJLGrVqB4bL3D1S8R4zsrOPx
 VhXnkTgvRfnOYzRMd2BI01LJklgmordTe0BlxbcbP9FNUWg05hOMUEry2cgcwm6izF3Z
 dR3ugnK4I4/wEms0cR2+B1VPiX3jvBhCznVmj9LT8DdCj9b2z/v2ymIS9HRpz212K3og
 276S9g3rHVGjLztgsvZRa1Kz88mG1/0wXWpGBd5B7FktJ21XasKzcqUkXRojangZHEzE Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a12xps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 16:46:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC11B100039;
 Mon, 14 Oct 2019 16:46:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94AFD2C6B40;
 Mon, 14 Oct 2019 16:46:26 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Oct
 2019 16:46:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 14 Oct 2019 16:46:25 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v4 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
Thread-Index: AQHVebuhJuHiDuRGcU6Z+heZE9rfl6dPXB+AgArg19A=
Date: Mon, 14 Oct 2019 14:46:25 +0000
Message-ID: <4f291ed4861b42b0af5a567901d2a9fd@SFHDAG6NODE3.st.com>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191007175635.D9824240044@gemini.denx.de>
In-Reply-To: <20191007175635.D9824240044@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_08:2019-10-11,2019-10-14 signatures=0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>, Marek
 Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>, Ash
 Charles <ash@gumstix.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
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

Hi Wolfgang and Tom,

> From: Wolfgang Denk <wd@denx.de>
> Sent: lundi 7 octobre 2019 19:57
> 
> Dear Patrick,
> 
> In message <20191003072428.19197-1-patrick.delaunay@st.com> you wrote:
> >
> > This patchset follow
> >
> > http://patchwork.ozlabs.org/project/uboot/list/?series=131268&state=*
> >
> > It follow the first proposal
> >   http://patchwork.ozlabs.org/project/uboot/list/?series=129339
> >   "env: Add CONFIG_ENV_SUPPORT"
> 
> Do I understand correctly that all of this is obsolete and no longer needed after
> Tom's commit d90fc9c3de ``Revert "env: solve compilation error in SPL"'' ?

The revert is a solution of the intial regression.

A other solution only to correct he regression was the first patch of the serie

[U-Boot,v4,1/3] env: correct the check of env_flags_validate presence
http://patchwork.ozlabs.org/patch/1171096/

But I am OK with Tom decision to just revert my initial patch.


The two other patch of the serie is a proposal after your remarks in:
http://patchwork.ozlabs.org/patch/1157174/

= This scares me.  Why are there different settings for SPL, TPL and
=  U-Boot proper?  This looks conceptually broken to me - if a system
=  is configured to use a specific set of environment features and
=  extensions, then the exact same settings must be use in all of SPL,
=  TPL and U-Boot proper.
....
= So please reconsider this whole implementation, and make sure that
= only a single macro ise used everywhere to enable these features.
 
Today in v2010.10  with have ENV attribute / callback / flags 
1/ always used in U-Boot proper
2/ optional in SPL/TPL (CONFIG_SPL_ENV_SUPPORT & CONFIG_TPL_ENV_SUPPORT)

In env:Makefile :

obj-y += common.o env.o

ifndef CONFIG_SPL_BUILD
obj-y += attr.o
obj-y += callback.o
obj-y += flags.o
else
obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += attr.o
obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += flags.o
obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += callback.o
endif

Perhaps I not correctly understood the initial issue, 
but I do my best to have the same level of ENV features
(CONFIG_ENV_FULL_SUPPORT  activate the features and
extensions= attribute / callback / flags) 
between U--Boot proper, SPL and TPL.

With the serie 
=> when read from device (ENV_IS_IN....) is not supported ENV is still
    supported in SPL/TPL with  (SPL_TPL_)ENV_IS_NOWHERE with
    same feature level than U-Boot (only the default env is supported)
=> the only remaining issue today after my serie is the size of this default
     environment (default_environment[]) in SPL and TPL.
     The content of this variable need to have the same content in SPL/TPL
     than in U-Boot proper ?

However if I not correctly understood the initial issue around ENV and security,
and if the current ENV code behavior is enough for you,Wolfgang and Tom, or any other 
maintainers interested by ENV, I will abandon the serie.

PS: I can change also the serie as RFC.... to have more feedback


> Best regards,
> 
> Wolfgang Denk
> 
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de The
> scientists of today think deeply instead of clearly. One must  be sane  to think
> clearly, but one can think deeply and be quite insane.
>                                                        - Nikola Tesla

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
