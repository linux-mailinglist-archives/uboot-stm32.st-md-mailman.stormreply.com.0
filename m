Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8980319AABC
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:26:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47255C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 11:26:25 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E49BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:26:22 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48skRL2VzWz1rtN6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:26:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48skRL2QT4z1r0cV
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:26:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id 4G_wesGkCuqF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:26:21 +0200 (CEST)
X-Auth-Info: 8erCSgZ70ECRWWElt+KonbqlEKFLjxXXOuCcIuLJq+Q=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:26:21 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id A150BA2C44; Wed,  1 Apr 2020 13:26:20 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id BA65FA12F3;
 Wed,  1 Apr 2020 13:26:15 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 931A024003E;
 Wed,  1 Apr 2020 13:26:15 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20200331160456.26254-1-patrick.delaunay@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331160456.26254-1-patrick.delaunay@st.com>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Tue, 31 Mar 2020 18:04:21 +0200."
Date: Wed, 01 Apr 2020 13:26:15 +0200
Message-Id: <20200401112615.931A024003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: detect U-Boot version
	used to save environment
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

Dear Patrick Delaunay,

In message <20200331160456.26254-1-patrick.delaunay@st.com> you wrote:
> Imply CONFIG_VERSION_VARIABLE for stm32mp1 target
> and test U-Boot version ($env_ver) when the environment was
> saved for the last time and to display warning trace.

What is env_ver?  Are you by chance reinventing the wheel?

The U-Boot version is stored in the environment variable "ver";
there should be no need for something similar.


Also. where is $env_ver coming from? It does not exist in mainline,
nor in any of the 3 patches that preceed this patch # 4/16 ?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Computers are not intelligent.  They only think they are.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
