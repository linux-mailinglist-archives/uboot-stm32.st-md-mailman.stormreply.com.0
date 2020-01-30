Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 184CC14D529
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8FD2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:00 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFC29C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:57 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id d10so1548570ljl.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WwmBikXBZ+vfK8JXFuvDwAGuOlY3fponv+Ych0C8KCw=;
 b=ZQ3aOvtuOBxOtRoQLgS3axctbjAasJ15baNMV7804R0wZCZAA4zSQiUlPi+pwn5C+m
 0Y2bdSjmrk2qOdwI95qlOin6DNQs1qZ1kzzLoYA5csRme3hP78gHwe36f21PN4Y1ukhf
 yThzNgvzPKVnElWvF5K71KA64dvKJKPxkAGGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwmBikXBZ+vfK8JXFuvDwAGuOlY3fponv+Ych0C8KCw=;
 b=OedmOQH2ApM2EAP1c+Z5xOG0s5bbfpmNJzJjId5PCMgTu2D9Sib3NNCXj3g2FuwEcC
 rZOAPCX33n31hlgUPvTw/RIFaNKtdE/Oq6hWWcUmr2WWPAP3XpitoMg4H4x+jiNvjFEs
 5AjH1rIU5IJ/EvEzfwh1Ab5ZZ69RCasGm26Dw6CI2Vj79/6fO3rzoOIfqsEr53MSi44z
 J1YycO2fQoPq8phghuui+13lUjlC0WW472/Qnh/YRrq+kLj817o20XnSyjzcO6t2rYNL
 gIqOuy5Q0v1Gba4n4yVkRqbf53qzyoocq+T9HafJ25ob+skF5ga4MQRld4MdDxQDusFx
 Z0Gw==
X-Gm-Message-State: APjAAAUYl17eS4y806CFggm0OXhlZUOUGAaU1MpU3iQCyMvVAi/hdvCR
 NIYy68O+EtFtAVyja8atyvYw7/KBPKRZTSqkKS661w==
X-Google-Smtp-Source: APXvYqyckiw4OqIcrkruKkykEHhoRDw132axmalXIp5a0+P9HSjE7vtBvsSFijbm/J7cgW5W94ua9gBWfPnC2mrC9CI=
X-Received: by 2002:a2e:3202:: with SMTP id y2mr1356958ljy.132.1580350736997; 
 Wed, 29 Jan 2020 18:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-6-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-6-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:02 -0700
Message-ID: <CAPnjgZ2STpK_tEV+DS9kK0d_5kadtDNtxUtOHGmGbD7b0E6a3A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 05/21] gpio: remove GPIOD_REQUESTED
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

On Mon, 13 Jan 2020 at 03:35, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the define GPIOD_REQUESTED as it is never used
> and use BIT() macro for other defines.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3: None
> Changes in v2:
> - remove the unused GPIOD_REQUESTED
>
>  include/asm-generic/gpio.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
