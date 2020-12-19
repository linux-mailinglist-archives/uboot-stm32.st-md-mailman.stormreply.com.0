Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 008F62DECF6
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Dec 2020 04:35:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEAACC5717E;
	Sat, 19 Dec 2020 03:35:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B22BAC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 03:35:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n16so7000438wmc.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qw+ttWwSIe5ZSbD267lAtnGUMMSyFHiuii2u/ePIlCc=;
 b=JQP8aCrYQb4se8MdcBltTQWirZRIyez+85iYQjLimCd2v37T8KuxUlFkaFLzAQ6QdX
 1Jlwonl4EYB/nNdc+STZdI6sPvnUScfwrZH6Bktdi79dWizlt24lViIUBb1L9ISDh5UI
 PE6/ygvv++Vm5wmGr5GBZBzdBylsPUhoTId1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qw+ttWwSIe5ZSbD267lAtnGUMMSyFHiuii2u/ePIlCc=;
 b=Gr25kpXf1XPdAGHMan3bxp2bRT8dsJ9PhPf7ucFcawLlPomcSLW9LFBImbiH673y7t
 T97D7BCF6ipmt5pWROi8J/QkIP/9mmX96Oh+1/N8yWEnguxv/J3Lnqo+SBoM4VRytRyw
 KWYY1AQ317FWU82Wpy1ht4K3JWsA2mxinD7gQ+TzuSXn2xS1/htI769aRCC2DxbqYmpk
 DG6AOUemA2gGcVAlvZnb50Pj2+TkOQWFy/0xKf9Gr1B3oYKCLrV4AQ/LExPQ7V4hRaVg
 5WtLuWhNUWcYkmkyu5nBQxPQ4GF9MnWYGR2bMsrI/C1wA7B1pjNyn0Bymq6js2n5J2ZI
 swQA==
X-Gm-Message-State: AOAM532ZVFRATk7kKQ/gzJ0bJeSlIlbr86eAdjToFlUIV9K2ZFpLYdbG
 ZycNonwQ0G6WBP2cfB+8DS4J3q9X1J5ctH4MrVRFmg==
X-Google-Smtp-Source: ABdhPJyt+VN/IN2cW4szgpaqo1NY6lQyZ1w9rKh+VsOYcwtM7CihzJsKjsp2fZMYRAN/4bCqfS/kQCGbodKUum/zq4g=
X-Received: by 2002:a1c:65d4:: with SMTP id z203mr6660068wmb.65.1608348907138; 
 Fri, 18 Dec 2020 19:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
In-Reply-To: <20201218124642.v3.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 18 Dec 2020 20:34:55 -0700
Message-ID: <CAPnjgZ2Oqne9+OaEiEba54DOu2EnMUwk9QTv8rTzj8ScvpvCow@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 4/4] console: add console_has_tstc
	helper function for CONSOLE_MUX
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

On Fri, 18 Dec 2020 at 04:46, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> From: Patrick Delaunay <patrick.delaunay@st.com>
>
> Add the helper function console_has_tstc() and replace the test
> #if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple 'if' test to
> respect the U-Boot coding rule.
>
> No functional change.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v3:
> - update commit message with new function name console_has_tstc
>
> Changes in v2:
> - add comment for tstcdev variable
> - rename console_tstc_check to console_has_tstc
>
>  common/console.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
