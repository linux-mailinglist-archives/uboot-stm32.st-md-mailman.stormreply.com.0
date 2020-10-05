Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5F284224
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 23:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2D11C32EA8;
	Mon,  5 Oct 2020 21:32:32 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0958EC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 21:32:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l15so858755wmh.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 14:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=ZJaHdMpv/jCT3TKX8ecu5txObNOV3IqNZ8lXRBbX9MQ=;
 b=nLgYs+8T7nmRHdJp++vFdEFzWaSmh5yIu/Oadi2b1wiONwDgXIXsP1yFam6ZAy1Zam
 pc73abt+hYknkdvmAcJDj/yPy4v4blq0aBtK4vVuWOSkaT+nIrLB742pvVomhbmyu8Bd
 dh6io/z5gYJNy+MzvscstySYhkfUAHwjY6AJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=ZJaHdMpv/jCT3TKX8ecu5txObNOV3IqNZ8lXRBbX9MQ=;
 b=dW9JuiFvoO3IdvSvc2BZPIz32N3e4PVBr3mxPKPAANcByCsP2rHrTGnWoKg7KIbTDN
 u3e066EdPBCjs/s5+03T51AmNpFc0vyrKSo0rv9qhIg/n/tX0xAYBps+JvpTAtRMYDWq
 PBu8TQnJvdHgvAn83rCNaR2Opjyl2K8bSsD3OLGrDSdpTakr7SkgH5gLAxoQM2Wu5nEs
 FGfj08iBuEpZ3jkfMWYoKesQ3ervHZWN4H1wV0vDsPHD875+hYMajn+rQBGQdB8Z4M7F
 KoBZGremhMG1olZyLoOxJy0wAEmHCOQBHi6w91FSSEDPOVaRh8++QOqRtR1/vPk5iWw8
 1ZPQ==
X-Gm-Message-State: AOAM531qH5zoAPhmMVrj7jkgLoH92CY59MBNg+b/q14Op5FEyUYTtDbT
 gasWdFkQevl40dTMt0FmxIDVpNCLlT3dsHGzMsBuuQ==
X-Google-Smtp-Source: ABdhPJyW2m2wjC3xUzHFCIshwPne4mFbGMjtiuZgDh2g5dyselitjNynw3ipA8O3fUpHz1UAEFQ1ciw8XJx28BLBMM8=
X-Received: by 2002:a1c:2d94:: with SMTP id t142mr1303142wmt.74.1601933551346; 
 Mon, 05 Oct 2020 14:32:31 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Oct 2020 14:32:29 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ1v7YKyc6itKaxQTi4V772iK0Ncsxm8vWWV5Xun5QGXxA@mail.gmail.com>
References: <CAPnjgZ1v7YKyc6itKaxQTi4V772iK0Ncsxm8vWWV5Xun5QGXxA@mail.gmail.com>
 <20200925074116.16068-1-patrick.delaunay@st.com>
 <20200925074116.16068-2-patrick.delaunay@st.com>
Date: Mon, 5 Oct 2020 14:32:29 -0700
X-Google-Sender-Auth: 2TfOF-g-cKb_IX-XuyQi4FGm-Pw
Message-ID: <CAPnjgZ08A9vhFmG1sDjc9sXJmSHeXWxkjoGkyi6Xa+8=RHq_EQ@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] fdtdec: correct test on return of
	fdt_node_offset_by_phandle
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

On Fri, 25 Sep 2020 at 01:41, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The result of fdt_node_offset_by_phandle is negative for error,
> so this patch corrects the check of this result in
> fdtdec_parse_phandle_with_args.
>
> This patch allows to have the same behavior with or without OF_LIVE
> for the function dev_read_phandle_with_args with cell_name = NULL and
> with invalid phandle.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  lib/fdtdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
