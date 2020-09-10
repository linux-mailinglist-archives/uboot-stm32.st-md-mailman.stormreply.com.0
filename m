Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64F26471D
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 15:38:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3354DC424BA
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 13:38:35 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5FC1C424B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 13:38:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m6so6787463wrn.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLMYkCrNBC+c02E2FAS938NLpCD+/ppClg6sQowUpfs=;
 b=h9Dtt6zqYf65PvbmpnyeLnfvRxGsSm4+O0JSuuxgrNrXlvBII8iHvsKCf81hjR3194
 7z+ZR5EF5n1lhatFIUFVErUOqPx6h8uvp4vjsq64NpksSRuV8YaxA0GI5x3UUNCOwqXp
 iHnAYHIdNlhLQmGAGp40fQVdvzBBTOKuIwNAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLMYkCrNBC+c02E2FAS938NLpCD+/ppClg6sQowUpfs=;
 b=nIePGwThlEMgAdy9M1JKxDRfkiIdhVs3RAsSoT1cjFsnBbHVhgPtAzOZU7T/IF1azl
 Flx9upRQcjDH+Em3dfhdTRU9SvW72Oco7ArfTw5Hp2JadPfW5Dv16KgVTCy1OStrO6et
 tqiQehmCSFlTYQ5Ea38iLQ3UgavMoZjqL30yiAs+4Ujw7EFwtaT3d5Jn2iISFz3sPXG6
 nPKQhjrLqNt0+E2CtOJRprpvo8zgjy1HIbHVUQO37P5uLp6mHrL3oYrDZK/UG5Np8wZC
 NqYyJ1mxqEN5M3sctlBn4LRXl7Fm1oHDtNsRKhWyE9quIlxyfxCmn/ebaIWCI226RJyf
 Kwww==
X-Gm-Message-State: AOAM530xpAxzf7gVfTFLvz5Hxy5xrLMykchwwGSORf9NyYrE7wpiVJqz
 D3+GlcFhAvJyil/QJ7nvSI2VTbMcKnLQajRIJr98xw==
X-Google-Smtp-Source: ABdhPJz+nMC67I5ULmvW9vFVGVxn/tfPFxPpXAmrluR91cWvQRU+3AvgTxQdaBmJBUGtUbG0tetCMxCV7CfALaiRfNw=
X-Received: by 2002:a5d:430d:: with SMTP id h13mr9621912wrq.41.1599745110862; 
 Thu, 10 Sep 2020 06:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200909154413.28064-1-patrick.delaunay@st.com>
 <20200909154413.28064-2-patrick.delaunay@st.com>
In-Reply-To: <20200909154413.28064-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 10 Sep 2020 07:38:17 -0600
Message-ID: <CAPnjgZ3ETQVf2YUo7BU5OcyRrQ4q0xynyf_Dxr4RZbsRvkn+PA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] video: stm32_dsi: Convert to use APIs
 which support live DT
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

On Wed, 9 Sep 2020 at 09:44, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/video/stm32/stm32_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
