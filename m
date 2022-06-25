Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8C55A7A8
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jun 2022 09:10:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98875C03FD3;
	Sat, 25 Jun 2022 07:10:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ABFCC03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jun 2022 07:10:15 +0000 (UTC)
Received: from crub (p54833d91.dip0.t-ipconnect.de [84.131.61.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6AACB84483;
 Sat, 25 Jun 2022 09:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656141014;
 bh=KJmr+xGaQTNZszEkjkwByjdKj89IZw4l2I4dy6eLeb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=olOw++lILwnXp+9vRBuHx+k06enVKWibdRyWoYBkGGoleFcBt71n2FpF404gyHN4h
 PoaecPCoXpuucWhtqQaGAP7GWdusEiBXk0c0kjrRelI69w/PkzuaWRvkzoyrXGLQIs
 zIBUKRQt5VgR+AtoPIsUtpxU2/UydPlrzJd7U+EbIWKT2gvpmXffcvHtlYuHKyo0Ht
 kaNSZiZyEWxQrgDOCfSxPgQB9OWwzkAcEEWn/6N1TeReATGSqMXgqZcUAG3m/QPkYe
 wQ7eqquwZDYEa7/XvKRzNZRgvnsPPj0kkquBGxAaR+qfFZ7kd3ChEdLYb3q20GlLKN
 G6gLX5V37Zm3g==
Date: Sat, 25 Jun 2022 09:10:13 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220625091013.04cea814@crub>
In-Reply-To: <20220620115452.1.I18e4ad5947e3b321573efe2085dd4c593cabbabe@changeid>
References: <20220620115452.1.I18e4ad5947e3b321573efe2085dd4c593cabbabe@changeid>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Yannick =?UTF-8?B?RmVydHI=?= =?UTF-8?B?w6k=?= <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: remove test on
	CONFIG_DM_REGULATOR
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

On Mon, 20 Jun 2022 11:55:07 +0200
Patrick Delaunay patrick.delaunay@foss.st.com wrote:

> The tests on CONFIG_DM_REGULATOR, added to avoid compilation issues, can
> now be removed, they are no more needed since the commit 16cc5ad0b439
> ("power: regulator: add dummy helper").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/video/stm32/stm32_dsi.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 

applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
