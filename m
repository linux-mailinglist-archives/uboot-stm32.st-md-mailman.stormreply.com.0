Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD658AEF95
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 18:30:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12BB1C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 16:30:56 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 628B2C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 16:30:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46SVrv07yDz1rBnG
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 18:30:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46SVrt5pW3z1qqkj
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 18:30:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id xRuDtPwWA0Ew
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 18:30:54 +0200 (CEST)
X-Auth-Info: tTSMaRmGmUaTjRuFClUiXSUHb7fJ1wa5lalY5KAPgao=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 18:30:54 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id 80DF4A2CF2; Tue, 10 Sep 2019 18:30:53 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 0280BA12E4;
 Tue, 10 Sep 2019 18:30:39 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 984F9240039;
 Tue, 10 Sep 2019 18:30:39 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
 <20190907115149.42B2624009F@gemini.denx.de>
 <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
Comments: In-reply-to Patrick DELAUNAY <patrick.delaunay@st.com>
 message dated "Tue, 10 Sep 2019 11:01:18 -0000."
Date: Tue, 10 Sep 2019 18:30:39 +0200
Message-Id: <20190910163039.984F9240039@gemini.denx.de>
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal
 Simek <michal.simek@xilinx.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>
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

Dear Patrick,

In message <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com> you wrote:
> 
> And I agree the name seens not perfect.
> 
> > > - CONFIG_SPL_ENV_SUPPORT for SPL
> > > - CONFIG_TPL_ENV_SUPPORT for TPL
> 
> These pre-existing name are defined in common/spl/Kconfig
> 
> With the same issue (env/common.o env/env.o are always compiled for SPL/TPL
> so it is alo bad names)

Correct.

> > So please reconsider this whole implementation, and make sure that only a single
> > macro ise used everywhere to enable these features.
> 
> But, if I use the same CONFIG for the 3 binary SPL,TPL and U-Boot,
> l increase the size of TPL/SPL for all the platforms when these
> additional features are not needed.

Either the U-Boot environment makes use of these features, then they
have to be enabled, and exactly the same way in SPL, TPL and U-Boot
proper.  Or you don't need them, then they can be disabled, but
again in a consistent way in SPL, TPL, and U-Boot proper.

It is not acceptable to have for example .flags support in U-Boot,
but not is SPL.  If you cannot affort the size in SPL (and need
environment there at all), then you cannot have it in U-Boot either.
Yes, this is sad, but anything else would break the implementation of
these features, and given that they are often used to implement some
level of protection or security, introduce massive security issues.


So if SPL size is critical, you can try do not access the
environment at all and omit _all_ of the environment code there; or
you can try to arrange for a read-only implementation (omitting at
least the code needed for "env save" including write routines to
storage).  But you CANNOT omit the extensions if these are present
in U-Boot proper.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Die Scheu vor Verantwortung ist die Krankheit unserer Zeit.
                                                 -- Otto von Bismarck
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
