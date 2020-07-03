Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA1213255
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 05:50:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA4CCC36B27
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 03:50:54 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 075EFC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 03:50:53 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d194so11103514pga.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2020 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdPPG0bAiC94xv5cmB5hwY9I0as9WhzQp6TnUoG52zk=;
 b=QoCwIDuscSFLfKEWBxQeNpNmA4Ygea1aHe/fx0pDXIdjwtT0GsxtI1eaYo/BE9PWvg
 IvIcDWy3dHOAUSL2L9/S0IfxtG+IbhK9lrOcEw07UTgm/7ZTDkuP6nO7dTyK7ALlrzqy
 s3VYXfJirPfpGHKgGOaJL6lgibMcD0vJIaG6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdPPG0bAiC94xv5cmB5hwY9I0as9WhzQp6TnUoG52zk=;
 b=L/Z0sAHqLfDhhIrlag3NX6ZURdNYLCJu1/Cr7mghK9Isf3lWXpuBMW5SVKcHA2PK6s
 VCXZ6sSIy93dWHhnqrct6Hsoa5ycHHrXIw5zHtE3L1g1gCqVO93Y89xY1GWWsVFhz1Ku
 ScCGzfkeh27HgeX0lUUGI2dNPJfmicL0FjGoIYGuFhwOdbYlxHCgyU6KWnFaYFHPjG7t
 B6ltZjUlh3e+Dg36W4lIZiVeEurPNokimAjs9HX7L8gc4GVvCt6FJqZyNiWLU1yLu7dj
 LGwJWuintCB9H5wLjjSTElcfp8edcuUyny+fLMRl58W1ci+YtbLsiFT7g5B9Or7IF5ie
 W2cg==
X-Gm-Message-State: AOAM531nsOUQCVMaxRfY1PFZC1HVv/J04+gidmnxCZ4CUG+G8Wge/rmH
 4TNw46a4p47mAEmd1wM5GR4EYxzGW9KJz25/lo5+WA==
X-Google-Smtp-Source: ABdhPJyUpIeyDBYsSrUiKykWijDVYrjIFhsrS01WPqyle74+/PGr8Ob23Xx//t6TCu6wZh0uRNvhhnL7c6tmmeFdYu0=
X-Received: by 2002:a65:6415:: with SMTP id a21mr26652612pgv.129.1593748251824; 
 Thu, 02 Jul 2020 20:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200702170824.16293-1-patrick.delaunay@st.com>
In-Reply-To: <20200702170824.16293-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 2 Jul 2020 21:50:34 -0600
Message-ID: <CAPnjgZ3MYPM8Cfh24_KskB83nW-9QMTJj51OMYLwOR189rm85g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] patman: Detect unexpected END
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

On Thu, 2 Jul 2020 at 11:08, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Detect unexpected 'END' line when a section is not detected.
>
> This patch detect issue when tag name for section start is misspelled,
> for example 'Commit-note:' for 'Commit-notes:'
>
>   Commit-note:
>   ....
>   END
>
> Then 'Commit-note:' is removed silently by re_remove = "Commit-\w*:"
> but 'END' is kept in commit message.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  tools/patman/patchstream.py | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
