Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D28AE8C0
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 13:01:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E92C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 11:01:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DE90C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 11:01:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8AB1DPJ011492; Tue, 10 Sep 2019 13:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Q3KTdj4K7ZCUYxJd011bZ8Aaj89wIkxrC4zrdUlldoE=;
 b=rkVS2oN+nWqIzVgcTzI6tgV0vf8+TMfD4CS/8uINtd3Ut4bGE/a07fZdR3ApJiiOCpJh
 EeilLa7vThoyYGBotq29vaXO5a0iDbp10HDBK08vA+mLXYFme8fgXvpkU9WCNffk2CcR
 fXjXkWYKcLOWMIyg0DU9rwTbwCeTLH/4cuyGEMlPuwF8+Dm5cdm80zZ4F6Xw5UVF9umI
 v8RI5EMkcGhfyKAncVTv1+Yvgnii9evRpTYnm0bgdyUX1XS3niudL/xyZNoLXqeSB7wz
 dDaYRoueNL6o5ugWRXasR+WgxWTPuVGDNSydO85fa4ScRTqj8UOBYwpi4Z5T7YAdc/EW yA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv2aw3q74-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 10 Sep 2019 13:01:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6AA1B4E;
 Tue, 10 Sep 2019 11:01:20 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E98B2BFF7B;
 Tue, 10 Sep 2019 13:01:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Sep
 2019 13:01:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 10 Sep 2019 13:01:19 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>, Heiko Schocher <hs@denx.de>
Thread-Topic: [U-Boot] [PATCH] env: Add CONFIG_ENV_SUPPORT
Thread-Index: AQHVYnpO9RDl78dH/0CQ7vwuqVbTS6cf/seAgASvGzA=
Date: Tue, 10 Sep 2019 11:01:18 +0000
Message-ID: <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
 <20190907115149.42B2624009F@gemini.denx.de>
In-Reply-To: <20190907115149.42B2624009F@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-10_07:2019-09-10,2019-09-10 signatures=0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal
 Simek <michal.simek@xilinx.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] env: Add CONFIG_ENV_SUPPORT
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

> From: Wolfgang Denk <wd@denx.de>
> Sent: samedi 7 septembre 2019 13:52
> 
> Dear Patrick,
> 
> In message <1567530547-14331-1-git-send-email-patrick.delaunay@st.com> you
> wrote:
> > Add a new flag CONFIG_ENV_SUPPORT to compile all the environment
> > features in U-Boot (attributes, callbacks and flags). It is the
> > equivalent of the 2 existing flags
> 
> I think this is a bda name, as it is misleading.  It sounds as if it is used to enable
> the support of environment vaiables at all, which it does not - instead it only
> enables / disables a few specific extended features.  This must be reflected in the
> name.

Yes, I use the name than SPL/TPL to use the macro CONFIG_IS_ENABLED(...)

And I agree the name seens not perfect.

> > - CONFIG_SPL_ENV_SUPPORT for SPL
> > - CONFIG_TPL_ENV_SUPPORT for TPL

These pre-existing name are defined in common/spl/Kconfig

With the same issue (env/common.o env/env.o are always compiled for SPL/TPL
so it is alo bad names)

> This scares me.  Why are there different settings for SPL, TPL and U-Boot
> proper?  This looks conceptually broken to me - if a system is configured to use a
> specific set of environment features and extensions, then the exact same settings
> must be use in all of SPL, TPL and U-Boot proper.
> 
> I understand that it may be desirable for example to reduce the size of the SPL by
> omitting some environment extensions, but provide these in U-Boot proper, but
> this is broken and dangerous.  For example, U-Boot flags are often used to
> enforce a certain level of security (say, by making environment variables read-
> only or such).

I agree, that scare me also.
For me also ENV_SUPPORT should be always enable for U-Boot.

My preferred proposal was only to solve the regression introduced by my initial patch and 
always set change_ok for U-Boot proper (when CONFIG_SPL_BUILD is not defined):

struct hsearch_data env_htab = {
- #if CONFIG_IS_ENABLED(ENV_SUPPORT)
-        /* defined in flags.c, only compile with ENV_SUPPORT */
+#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
+        /* defined in flags.c, only compile with ENV_SUPPORT for SPL / TPL */
         .change_ok = env_flags_validate,
 #endif
 };

http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-for-U-Boot-tt382673.html#a382688

The same test is already done in:

drivers/reset/reset-socfpga.c:47:#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
drivers/input/input.c:656:#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)

> The same level of handling and protection must also be maintained in SPL and
> TPL.

if I understood correctly the proposed dependency is :
	TPL ENV_SUPPORT select SPL_ENV_SUPPORT
	SPL ENV_SUPPORT select ENV_SUPPORT

> So please reconsider this whole implementation, and make sure that only a single
> macro ise used everywhere to enable these features.

But, if I use the same CONFIG for the 3 binary SPL,TPL and U-Boot,
l increase the size of TPL/SPL for all the platforms when these additional features are not needed.

And I am not the sure of the correct dependency for ENV between binary.

Heiko what is you feedback on Wolfgang remarks....

Do you think that I need to come back to the first/simple proposal ?

> 
> Best regards,
> 
> Wolfgang Denk
> 
> --

Best regards

Patrick Delaunay
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
