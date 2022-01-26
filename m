Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C817649CEB6
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Jan 2022 16:37:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF96C5F1D8;
	Wed, 26 Jan 2022 15:37:24 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18E3AC5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 15:37:23 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so2259322otf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=38+ZPtSOCGMEBIzUVLcu28VbvETZ+V+NyepF+F23eiQ=;
 b=ipeGoW2P6iIrKyjD1e6PqGT6MQi3vzYjsXQkV7vMnVZB+zI6dg+bcQuV8Q3uvsBnAy
 BrCTXkV8iEXTfezzt0RBFrVTnH9U6+w+n0Vdh3+e91EjlU3baBHtLumtKmenRvvBQLao
 Qdh9wECwTXTVCsDqdtxobx1UlHLLw7Oab40S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=38+ZPtSOCGMEBIzUVLcu28VbvETZ+V+NyepF+F23eiQ=;
 b=FXaR0OpXTKsncjA/IMkgN0lddmTFL/yOUt8PgWO5DKiVOvYxSHkl3gv31w7zt7sI/C
 yodKRbsIRSFIkanJJLYsUDxjR505/75RHbvq8b3D7kv8oCwtycAA453rCDmMZiLhToNW
 QB8C89ZJ7A2oEux7lKOWXfHMEqx9gwo7aJ2i2cAZgPNNCtxrg6+W04g3pHkt0IGnXlVR
 0HrnrfSz3qALehw9TuuslgJW3++OhgXGILouQgHnYQ7bm9Zy5HtEzFpbeAA4u9G1JEdq
 JXftiBCci6And9NnvOtvo7CWC4X5gFxQPJpWCVZTGp+H0LuHYtrcHmD7QhFDeE3h4vmS
 epew==
X-Gm-Message-State: AOAM533HJt7a2v8nrbfcSu9E9meZquOBernRXXEv1sLgb5XccqiFCOeT
 Cjh1YujmP+4WDxVy3/deK7hq3HOsZVxEupfMgT5PHw==
X-Google-Smtp-Source: ABdhPJy6KC40GT9vb4TVwBh/V/8MMTndu6Yr3h2YBsfIMToUs/BDDdeJXk3siyEuwEs0F4ybgEV+oYk2B5Qqe+3GVxE=
X-Received: by 2002:a05:6830:2683:: with SMTP id
 l3mr17934020otu.203.1643211441630; 
 Wed, 26 Jan 2022 07:37:21 -0800 (PST)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Jan 2022 10:37:19 -0500
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ2uJjByHMftsfUn=Nbh54KhACNmEnmgDVTgF7SOpqo3Zw@mail.gmail.com>
References: <CAPnjgZ2uJjByHMftsfUn=Nbh54KhACNmEnmgDVTgF7SOpqo3Zw@mail.gmail.com>
 <20220104074248.25015-1-patrice.chotard@foss.st.com>
Date: Wed, 26 Jan 2022 10:37:19 -0500
X-Google-Sender-Auth: 1dWMZ6muWv7Aga5g5gVnLLIiEqk
Message-ID: <CAPnjgZ05PHGsFecS3XhofKqMBpObTmd8SvAeCpTwxuzo0qqxeA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

On Tue, 4 Jan 2022 at 00:42, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> When OF_LIVE flag is enabled on a 64 bits platform, there is an
> issue when dev_read_addr() is called and need to perform an address
> translation using __of_translate_address().
>
> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
> which is defined as (-1U) = 0xffffffff.
> In this case the comparison is always false.
>
> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
> AARCH64. Update accordingly related tests.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
> Changes in v2:
>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
>
>  include/fdtdec.h   | 5 ++++-
>  test/dm/ofnode.c   | 2 +-
>  test/dm/pci.c      | 4 ++--
>  test/dm/test-fdt.c | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
