Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4CB2DF6DD
	for <lists+uboot-stm32@lfdr.de>; Sun, 20 Dec 2020 22:14:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B25B0C56610;
	Sun, 20 Dec 2020 21:14:14 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7371C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Dec 2020 21:14:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Czb285T1lz1qt49;
 Sun, 20 Dec 2020 22:14:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Czb2844Bnz1rbmy;
 Sun, 20 Dec 2020 22:14:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ab_7eEXEMFAT; Sun, 20 Dec 2020 22:14:07 +0100 (CET)
X-Auth-Info: mgTDMB4HvoRbx5Ck4aucBM0zi5dRbgrJrwZelMrKFQo=
Received: from crub (p5483356f.dip0.t-ipconnect.de [84.131.53.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 20 Dec 2020 22:14:07 +0100 (CET)
Date: Sun, 20 Dec 2020 22:14:06 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Tom Rini <trini@konsulko.com>, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>
Message-ID: <20201220221406.725af74b@crub>
In-Reply-To: <20201208161630.GP32272@bill-the-cat>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <9d8e34fa-cd69-f2ac-7d63-0b2da2e382f5@web.de>
 <f0bd0043f95b4364bde19d21902e09bd@SFHDAG2NODE3.st.com>
 <27f75682-4527-ffeb-24d3-420e7ff3bd35@foss.st.com>
 <20201208161630.GP32272@bill-the-cat>
MIME-Version: 1.0
Cc: Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Yannick FERTRE <yannick.fertre@st.com>, u-boot@lists.denx.de, smoch@web.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD and
 VIDCONSOLE_AS_NAME
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

On Tue, 8 Dec 2020 11:16:30 -0500
Tom Rini trini@konsulko.com wrote:
...   
> > => open point: which acceptable target to remove this feature ? v2022.01 ?  
> 
> This sounds like a good plan and reasonable date to me.  Anatolij?

I have no objection, this target date is okay for me.

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
