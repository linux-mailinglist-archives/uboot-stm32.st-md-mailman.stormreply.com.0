Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB74CF7CC
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Oct 2019 13:10:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03C0FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Oct 2019 11:10:14 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62DFAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 11:10:13 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46nZPw4Yhqz1rh8V
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 13:10:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46nZPw2Wm0z1qqkJ
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 13:10:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id Z4xYiVXp0yMU
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 13:10:11 +0200 (CEST)
X-Auth-Info: 0tODFr3ejawEyAj8xKlDwNMYipfEuVl9aCoqq+PNA3s=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 13:10:11 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id F2051A2B9B; Tue,  8 Oct 2019 13:10:09 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id B441B9FBE7;
 Tue,  8 Oct 2019 13:09:53 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 573CD240044;
 Tue,  8 Oct 2019 13:09:53 +0200 (CEST)
To: Tom Rini <trini@konsulko.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20191007223650.GR6716@bill-the-cat>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191007175635.D9824240044@gemini.denx.de>
 <20191007223650.GR6716@bill-the-cat>
Comments: In-reply-to Tom Rini <trini@konsulko.com>
 message dated "Mon, 07 Oct 2019 18:36:50 -0400."
Date: Tue, 08 Oct 2019 13:09:53 +0200
Message-Id: <20191008110953.573CD240044@gemini.denx.de>
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ash Charles <ash@gumstix.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
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

Dear Tom,

In message <20191007223650.GR6716@bill-the-cat> you wrote:
> 
> > Do I understand correctly that all of this is obsolete and no longer
> > needed after Tom's commit d90fc9c3de ``Revert "env: solve
> > compilation error in SPL"'' ?
>
> So, I think there's a new topic here.  I seem to recall a concern from
> the previous thread that we could have less restrictive environment
> protections in SPL/TPL than we do in full U-Boot and thus open ourselves
> to a potential problem.  As of today, U-Boot is back to where it was
> prior to the problematic patch being applied.  But do we not have the
> potential problem above and thus need to evaluate the rest of the
> series (as the revert was largely the same as the first patch in the
> series) ?  Thanks!

The (potential) problem of having less restrictive/secure code in
SPL than in U-Boot proper resulted from the fact that the patch
series allowed different configurations of the U-Boot environment
features in these stages.

After the revert of the original problem, I don't see the need for
any such configuration, so if we simply do nothing we are as secure
as we have been before.

When accepting this new patch series, a full review of the impacts
(size, security) is needed.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
In an infinite universe all things are possible, including the possi-
bility that the universe does not exist.
                        - Terry Pratchett, _The Dark Side of the Sun_
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
