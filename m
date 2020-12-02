Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 414852CC981
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 23:22:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1385C06150;
	Wed,  2 Dec 2020 22:22:06 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F0BC424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 22:22:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t4so5700474wrr.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Dec 2020 14:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyeFoqHYnko6+8qtdIS8OeWp9/NuYwiBEmrRNGuPQSo=;
 b=NLqOF7FV8w7ci98WjMN2m7mBzy+SeUHtScPeSuYRr94kjlnCcUADOaJFkcNjsBysuE
 TPdPSGjtVKYDeMy3MSRxq3pCXceOU1htGv26y2UTExA4UECnePv666nez0b79A6LYJ4Z
 hjTxG8r95W45u+CFQYW+EIXZzfSvmRH4jWV/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyeFoqHYnko6+8qtdIS8OeWp9/NuYwiBEmrRNGuPQSo=;
 b=RnxWXKPOfZmcsUS2T/6b9MUVVGT2qiny1/RcVKkkHD8gzKFrbYacqY+sOeNqwk8aeW
 E2keRpUxImBiJwlPomJ5LFm+SwF+aY3KCmM/f2dZsR/LAdiDCIUZDKVxvsWt8rVU703y
 XLANya7bsHazEXsatRXV3qWXNfn/+T6gd5BsvKioyTvlZg2PsHXmQ6hh2YjkjejpyThO
 halg+EZFtEHvUTShZgoeXrSrzcfDSMGAGd3vD//R6AGNPFYuIkpVlo1KVkcExy/Ww3r0
 vbYC5KFXo6Tj77GJ5ZWcJ4VSe7U2242e8y+KwaLVQj34x4CMWB126SCmHKNdXlEu96L3
 6M8A==
X-Gm-Message-State: AOAM533KFk27knf6+mtsvJfozoknn+i9WxD5GO3BBmGeQMKta7mGDVyy
 zkiuQGQY5VzZNOfb1lL0nsI3+vVvUsnJAvA3JLL6sA==
X-Google-Smtp-Source: ABdhPJySS1s5nMeK0qdhKiLXAQYb/MxMYBc0WSVp5xbS9xPU77MPGE2Qcghvy7mGYRfHM+SorKj/WvPwnx1kWvBgjpA=
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr281040wrn.56.1606947724810;
 Wed, 02 Dec 2020 14:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20201202151553.1.I4114af6c3678fdd5bccc69f141dca0b7f30ccc92@changeid>
In-Reply-To: <20201202151553.1.I4114af6c3678fdd5bccc69f141dca0b7f30ccc92@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 2 Dec 2020 15:21:52 -0700
Message-ID: <CAPnjgZ0t-DQUCCEMvrsn5G0VGGaRiYgc3ZR2NxOyOZ9NsLeq2Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] console: cosmetics: remove #if 0
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

On Wed, 2 Dec 2020 at 07:16, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the #if 0 present since the first version of console.c
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/console.c | 10 ----------
>  1 file changed, 10 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
