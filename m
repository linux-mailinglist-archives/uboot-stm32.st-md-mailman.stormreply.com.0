Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB5189E48
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 15:51:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE6F7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 14:51:23 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82976C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 14:51:22 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48jCfL0Vnqz1rsMq
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 15:51:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48jCfK6plLz1qv54
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 15:51:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id rd4jrQ5JZR_l
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 15:51:21 +0100 (CET)
X-Auth-Info: UnKrM6hU5qAiXAPHVgEcxc2J5q2lPhkGtRcabp+wxoI=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 15:51:21 +0100 (CET)
Received: by janitor.denx.de (Postfix, from userid 119)
 id BEA21A2C4B; Wed, 18 Mar 2020 15:51:20 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 2F1A8A2B7B;
 Wed, 18 Mar 2020 15:51:11 +0100 (CET)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 8E58024003E;
 Wed, 18 Mar 2020 15:51:10 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20200318143602.23253-1-patrick.delaunay@st.com>
References: <20200318143602.23253-1-patrick.delaunay@st.com>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Wed, 18 Mar 2020 15:36:02 +0100."
Date: Wed, 18 Mar 2020 15:51:10 +0100
Message-Id: <20200318145110.8E58024003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [Uboot-stm32] [RFC RFT PATCH] env: spl: filter the variables in
	default environment of SPL or TPL
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

In message <20200318143602.23253-1-patrick.delaunay@st.com> you wrote:
> Use a new option CONFIG_SPL_ENV_VARS to filter the variables included
> in the default environment used in SPL (and TPL).
>
> That allows to reduce the size of default_environment[].

Sorry, but NAK.  we had this discussion a couple of times before.
It is mandatory that both SPL and U-Boot proper will use the _same_
environment, including the same default environment, or all kind of
havoc may result.  Just think of situations where Falcon Mode is
being used and SPL and U-Boot proper would be using different
settings.

If your default environment is too big for the SPL, then make it
smaller.  If you need additional settings in U-Boot, there are many
ways to load thise there.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"If that makes any sense to you, you have a big problem."
                                  -- C. Durance, Computer Science 234
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
