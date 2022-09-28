Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E75ED2D2
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Sep 2022 03:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4322C63327;
	Wed, 28 Sep 2022 01:55:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46724C63326
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 01:55:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 r10-20020a1c440a000000b003b494ffc00bso281904wma.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 18:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fK7MoNWwIBsnrHKvDkLMzQH41hrbjREHJs4pbKk/aOM=;
 b=leIpiP7iMT8HQkE5aW/0GiLE+Wh/FiPaWf9DjScgg+9iuaClxnlQ5qV2odRdt/HgUv
 +zr/Tub44+X8dEDZoLKZBnjbEcLChHPLzBy8lKcurrgljqTgD8lfM9ViS7RmAnAwxlh8
 vsKI+hZ07h9TANMFYx3sjcaDjI1O+19pk3kNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fK7MoNWwIBsnrHKvDkLMzQH41hrbjREHJs4pbKk/aOM=;
 b=2/8BQXiHLjWrMS8UHsf7FIoItAn3MlHpjLK9a90M/DFDcqML5+FktdnIO+0ZnuW909
 yDz3/JwWQ1UzuisEuXKryXIwPCCbCyzQm47PcAHf3xZn75uLu0f3OJjMJ71rhCnUlHap
 cyStR2Z6ccmaaAPDH7e4UAIbrG3fvc4XYX8c10vROupDM/JhUDrLUcaBJE9cgV/3nzFn
 RXQ4XdfhYldwmI0C/FX5/+Z/SY1ltz7neXGl6aWuC81x5Gz3Vhm3NyAs1SPd4z8kjPQT
 qmeEAvlsPMuve/+q0fH8wQ4iMGLlPHKzf7a9+2U1J+finm8QEaxPty1vucYG2kA3xz/B
 e6Ew==
X-Gm-Message-State: ACrzQf3EVzo/5l1q6AI8dn1EkcSiANFTt9R6cNtWxhL4N0DYmy1/aeVw
 V1cYD+o4VeqGVzuUEyZ0HCzjRc+koRxaLvIYpaXZOA==
X-Google-Smtp-Source: AMsMyM61CS9CFarUoDoLNeqfhQxfxhiBi7nxmBau7G8Dx1DIES3R1QkAbFm3E+Lu1r3Wy3s8AttrGAHAvYdLFq4SR2Q=
X-Received: by 2002:a05:600c:1694:b0:3b4:6205:1f95 with SMTP id
 k20-20020a05600c169400b003b462051f95mr4963321wmn.151.1664330111627; Tue, 27
 Sep 2022 18:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220927101756.1.I33483759ec654ce103609cc3ef13a6162b722975@changeid>
In-Reply-To: <20220927101756.1.I33483759ec654ce103609cc3ef13a6162b722975@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 27 Sep 2022 19:54:58 -0600
Message-ID: <CAPnjgZ3w_=AZg+WyVvUuyYue=wdfbqpcJBhEsHi=FaNkozSLrg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] fdt_support: cosmetic: remove
	fdt_fixup_nor_flash_size prototype
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

On Tue, 27 Sept 2022 at 02:18, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Remove prototype for the removed function fdt_fixup_nor_flash_size.
> This patch has no impact as the function is never used.
>
> Fixes: 98f705c9cefd ("powerpc: remove 4xx support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/fdt_support.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
