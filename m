Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 198902DECF4
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Dec 2020 04:35:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1750C5717E;
	Sat, 19 Dec 2020 03:35:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9919C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 03:35:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id g185so5210898wmf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8HkMsztu7Ui6MH/pD74iO2LmxiSzXVcXhKsXaLS9Ock=;
 b=kThK5pFRPVDT0ll+3a6dPvVdmQkmBPfOePT/T9AJ2rWqE+uIoJIzNXzIzytsX99Ej+
 LVaLQx3vq6QkGnOFXGkqAnTX7GGxPBEp9x/poAZwWtaGOalNndBmciF8jDQv5fJeNil3
 HC5wEXHALf9mQ/XEqJxaAm24LwL3DVPD4HzW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8HkMsztu7Ui6MH/pD74iO2LmxiSzXVcXhKsXaLS9Ock=;
 b=pOqwV2VmC9ZIo43FyS0R8PPA74qnV2Y47N6qBpWSX+wRuUHno1hVSNS559wXxcEQI8
 L9TpKbu/V9LgfAiYc/4CtOMKuhYAvDbX5b1cy+piuYlbSIaZhCsFwZlhR21o06AlI8Ym
 QmuCUsgMPGlazXs/BJgbEAoAn254ixqpu6NsCvjHHlPXdoR/x0mLO1br5NahpocUoDJh
 GR9nu6O6k6zs9dbg9WFrt0cP3ZmYzjPgTa6tRa1Txev3381bi1abFjJYQK5yRaUi1pQq
 zO+Yz36UnJbCUjiqdFELPymAu96lfFL/Z2Cb6RjzgaU+bIoGGNqONSN3PupfPeuMuST5
 rMsQ==
X-Gm-Message-State: AOAM531LYILoRcvjZSk5iRsidE0LwdRmu27mVmq+DpWNhmkSRJbVVG8l
 hIvHznoI2Nc4KBFYupfoHoGeZbSyGp2DlnGB7JyOyA==
X-Google-Smtp-Source: ABdhPJx9VFMPx8Cua4YSGi8JKvsp0dh8JabFI2ByMw5AQa95SP2cMjIE0FTV8i8ZCm9fVAkuCCoJP6xofZ6FFNYhQPc=
X-Received: by 2002:a1c:2783:: with SMTP id n125mr6558620wmn.74.1608348904083; 
 Fri, 18 Dec 2020 19:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
In-Reply-To: <20201218124642.v3.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 18 Dec 2020 20:34:52 -0700
Message-ID: <CAPnjgZ07TwtVBt65qr-LEmTsCig6=rh8hd+2DfQ8uYi2Am0hDA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 1/4] console: remove #ifdef CONFIG when
	it is possible
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
> Remove #ifdef or #ifndef for CONFIG when it is possible to simplify
> the console.c code and respect the U-Boot coding rules.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - update also #ifdef CONFIG_SANDBOX after Simon Glass remark
>   (code can't be removed to avoid to rely sandbox on debug uart)
>
>  common/console.c | 158 +++++++++++++++++++----------------------------
>  1 file changed, 64 insertions(+), 94 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
