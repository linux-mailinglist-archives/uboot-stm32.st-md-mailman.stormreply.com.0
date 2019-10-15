Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996BD724A
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 11:28:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E55E8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 09:28:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CFC6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 09:28:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sqq74gHSz1rfd1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 11:28:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sqq72xkhz1rD5h
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 11:28:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id D1fAJzyFatTE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 11:28:18 +0200 (CEST)
X-Auth-Info: Ux1fXJQW1ESNtdprep2FUZuc5KhglHmJFTZebOZ4zgk=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 11:28:18 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id 27111A2C1B; Tue, 15 Oct 2019 11:28:18 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 8D70F9FBE7;
 Tue, 15 Oct 2019 11:28:01 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 4A8BA240045;
 Tue, 15 Oct 2019 11:28:01 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <4f291ed4861b42b0af5a567901d2a9fd@SFHDAG6NODE3.st.com>
References: <20191003072428.19197-1-patrick.delaunay@st.com>
 <20191007175635.D9824240044@gemini.denx.de>
 <4f291ed4861b42b0af5a567901d2a9fd@SFHDAG6NODE3.st.com>
Comments: In-reply-to Patrick DELAUNAY <patrick.delaunay@st.com>
 message dated "Mon, 14 Oct 2019 14:46:25 -0000."
Date: Tue, 15 Oct 2019 11:28:01 +0200
Message-Id: <20191015092801.4A8BA240045@gemini.denx.de>
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Tom Rini <trini@konsulko.com>, Marek
 Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>, Ash
 Charles <ash@gumstix.com>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>, Anup
 Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
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

Dear Patrick,

In message <4f291ed4861b42b0af5a567901d2a9fd@SFHDAG6NODE3.st.com> you wrote:
> 
> Perhaps I not correctly understood the initial issue, 
> but I do my best to have the same level of ENV features
> (CONFIG_ENV_FULL_SUPPORT  activate the features and
> extensions= attribute / callback / flags) 
> between U--Boot proper, SPL and TPL.

You understood correctly: these should always be the same.

> With the serie 
> => when read from device (ENV_IS_IN....) is not supported ENV is still
>     supported in SPL/TPL with  (SPL_TPL_)ENV_IS_NOWHERE with
>     same feature level than U-Boot (only the default env is supported)
> => the only remaining issue today after my serie is the size of this default
>      environment (default_environment[]) in SPL and TPL.
>      The content of this variable need to have the same content in SPL/TPL
>      than in U-Boot proper ?

It would feel strange if it had different content, but I did not
spend much time on this thought (and practical use cases) yet.
In the olden days you usually wanted to have the console baud rate
setting from the envrinment, and not much else.  Things have changed
a lot. Sorry, I can't really tell...


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
If I don't document something, it's usually either for a good reason,
or a bad reason.  In this case it's a good reason.  :-)
                 - Larry Wall in <1992Jan17.005405.16806@netlabs.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
