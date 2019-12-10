Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C00361184E5
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 11:22:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0639C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2019 10:22:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0919EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 10:22:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47XGMl5RsMz1qql9;
 Tue, 10 Dec 2019 11:22:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47XGMl4rdnz1rjrG;
 Tue, 10 Dec 2019 11:22:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MOjshgQ33qbI; Tue, 10 Dec 2019 11:22:26 +0100 (CET)
X-Auth-Info: +utLpJ32UE1patyGLfp1qG4AZPl8SMsUXtV9Leonc4w=
Received: from crub (p5483338F.dip0.t-ipconnect.de [84.131.51.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 10 Dec 2019 11:22:26 +0100 (CET)
Date: Tue, 10 Dec 2019 11:22:26 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191210112226.2231558c@crub>
In-Reply-To: <20191120131116.20620-3-patrice.chotard@st.com>
References: <20191120131116.20620-1-patrice.chotard@st.com>
 <20191120131116.20620-3-patrice.chotard@st.com>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Yannick =?UTF-8?B?RmVydHLDqQ==?= <yannick.fertre@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] video: bmp: Fix
	video_display_rle8_bitmap()
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

On Wed, 20 Nov 2019 14:11:16 +0100
Patrice Chotard patrice.chotard@st.com wrote:
... 
> Changes in v2: None
> 
>  drivers/video/video_bmp.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
