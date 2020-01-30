Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B489D14D526
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7578CC36B0E
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:22 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A29C9C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:20 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id t23so1158300lfk.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kAs2BeK/kAG9G13nhn5A1vSaoX3Mc6HhWipTu7gEG14=;
 b=ZdrH6wiubs9xHZ7FNxGl+rKdFTGNg0z3meUbrnsk1/+sZZ+ZCHR2+xfjoqey5219Ky
 6u3wUbtXpen/PVxHn/jCT5MSMY8+jWzGRqsylo3/ysG2n2dWiK1rNu/HyqJ6sLnrQPbz
 9iSdP0S9om6Xs0tZWxsLt1+5+39SmZVcy3oGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kAs2BeK/kAG9G13nhn5A1vSaoX3Mc6HhWipTu7gEG14=;
 b=KOH5HUTg6mG+xUrbHpsm0Nyg1GQWwNfqNOeia2itJFExVUCbWzojgtSTzF7y/I8Ixv
 ixY7WNAVYp3YpV5uHDQsPHyxPPkGJjUcbpco4C3161VrMCGHt8w8SgYYNf+vBOd/eJ9W
 HiSp49B88qFqMosdfQYmUFHKgVh9vbYSU9vObzUUUxsPxiqagR+BHk12NOmJo58rlcrH
 QRYsWoJiCs3mfTG64eouK/nXZ6Kx6/V63xlb6gAwRYjrvlcd0FBraQ05eFNHNMGok5sB
 P1yGF3c/K4KrWh1XdKui8qUlDAEGF3mqNbUHTOGr0zgLpyvhW7Ox2CIzQc5/TRcG9tY2
 ZXzA==
X-Gm-Message-State: APjAAAWJBmIolHn9DX+liEUgwV/nBCkNRjeflyKzoA7I76lDRpygY+Cy
 Z7OzTyO3U9lLDkr1P9A7BKhtUUwl9JH047+UrOP1xA==
X-Google-Smtp-Source: APXvYqztEnTvDgEJ1IRerK42M6yWp7/iq8yq0RsUoXHXYdHlRAmGkrTsXZen4R/TYsF0eGjYYAzUE870ckAef3ysd9M=
X-Received: by 2002:ac2:5196:: with SMTP id u22mr1148270lfi.123.1580350699616; 
 Wed, 29 Jan 2020 18:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20200122135243.17683-1-patrick.delaunay@st.com>
 <20200122135243.17683-4-patrick.delaunay@st.com>
In-Reply-To: <20200122135243.17683-4-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:54 -0700
Message-ID: <CAPnjgZ3Oyx-A+05O5DKmv=EydyV8j+aAMK5MXpVsyz3eaGv_ew@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/4] arm: set the relocated gd with
	gd->new_gd
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

On Wed, 22 Jan 2020 at 06:52, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Simplify the arm relocation behavior and get gd directly form new_gd,
> as it is already done in crt0_64.S:
>
>         ldr     x18, [x18, #GD_NEW_GD]          /* x18 <- gd->new_gd */
>
> This patch avoid assumption on new GD location (new GD is below bd -
> with #GD_SIZE offset).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  arch/arm/lib/crt0.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
