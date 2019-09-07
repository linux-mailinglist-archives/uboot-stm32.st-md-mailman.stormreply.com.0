Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260BAD370
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Sep 2019 09:15:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BED9C36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Sep 2019 07:15:37 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 552F0C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2019 11:51:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46QXpQ5ZJbz1rJsk
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2019 13:51:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46QXpQ3z4Vz1qqkw
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2019 13:51:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id NtCcC4tDu7pz
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2019 13:51:57 +0200 (CEST)
X-Auth-Info: X6+FNMxpKcsb7Nt/gpFRx1PSBQ7adl+HaITJ8MEUwS4=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2019 13:51:57 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id 220F8A2C65; Sat,  7 Sep 2019 13:51:57 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 86E1EA12E4;
 Sat,  7 Sep 2019 13:51:49 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 42B2624009F;
 Sat,  7 Sep 2019 13:51:49 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Tue, 03 Sep 2019 19:09:06 +0200."
Date: Sat, 07 Sep 2019 13:51:49 +0200
Message-Id: <20190907115149.42B2624009F@gemini.denx.de>
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:15:36 +0000
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
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

Dear Patrick,

In message <1567530547-14331-1-git-send-email-patrick.delaunay@st.com> you wrote:
> Add a new flag CONFIG_ENV_SUPPORT to compile all
> the environment features in U-Boot (attributes, callbacks
> and flags). It is the equivalent of the 2 existing flags

I think this is a bda name, as it is misleading.  It sounds as if it
is used to enable the support of environment vaiables at all, which
it does not - instead it only enables / disables a few specific
extended features.  This must be reflected in the name.

> - CONFIG_SPL_ENV_SUPPORT for SPL
> - CONFIG_TPL_ENV_SUPPORT for TPL

This scares me.  Why are there different settings for SPL, TPL and
U-Boot proper?  This looks conceptually broken to me - if a system
is configured to use a specific set of environment features and
extensions, then the exact same settings must be use in all of SPL,
TPL and U-Boot proper.

I understand that it may be desirable for example to reduce the size
of the SPL by omitting some environment extensions, but provide
these in U-Boot proper, but this is broken and dangerous.  For
example, U-Boot flags are often used to enforce a certain level of
security (say, by making environment variables read-only or such).
The same level of handling and protection must also be maintained in
SPL and TPL.

So please reconsider this whole implementation, and make sure that
only a single macro ise used everywhere to enable these features.


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Never ascribe to malice that which can  adequately  be  explained  by
stupidity.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
