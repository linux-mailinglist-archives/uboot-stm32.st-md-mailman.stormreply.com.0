Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2276C2D8751
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Dec 2020 16:39:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6B71C3FADB;
	Sat, 12 Dec 2020 15:39:22 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A4C7C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 15:39:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t4so11995160wrr.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 07:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/906Uqqnyj4Xi5j22Rm9SiCCzHtO2rMmezrcSNb6WMA=;
 b=WMYX5OEYVMJU7fI0VEPsYDjkHhALB6K/SwGiIVaOtN7Yq3cDRCNkVkm9OqQ/20VcRZ
 UXZ9v/bjdM8aNwS+9syVQ+r7s2RERg+fjDF5zCYmSqTL/gl0kp+ZANcUz07XWq0e1vYT
 sq+CZ13HZ5po1c1XPDZ89dyLmYsVT/InbMzR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/906Uqqnyj4Xi5j22Rm9SiCCzHtO2rMmezrcSNb6WMA=;
 b=WWWgwm8ynYa3hC3DBBHjs69y3cbPff3hrcyuyehp0S+bSvS0NrSwN5oMPujPb2fI5R
 I1sikcp4aJfqZNOsfNQWL6T11bWLTrh1tTHVnD0FC5u9a16I4pGuUi16fwLavC/OxlHf
 2LxxWlB3g2Ut2oR4tfgZoLr9sBJKzEAak5rkQY03lk9IMgCViI06cf6AE+ddBboGg7Qn
 6b0/1kwB/yYbI7DW5MyN5xvcuRsmzEI+rjuZz6grz0aYE/Q3GpcHAufabDTVFlqFPgbG
 Hx6sFtfp4xr9SyUOEFpCyQEt5SFXza0VMRNRsddY+Zt3cbc27uLYac91lUXBsNEWiv+F
 rGew==
X-Gm-Message-State: AOAM530dMI9FB8l/1ivxGl8lTxtMMmy1rwQmXfsE6IZ/51fUI1pfQhgi
 l6NYPWQKXh8/jCVq5EOC8YxFPdz2vriiv37esWcubw==
X-Google-Smtp-Source: ABdhPJytmzeSknCvMfbkHBQfvwHHrlUUlSkgp35BkohFUv9bEQSm4apTd5SvX9eIgBgWBynA9GaeQsx8pjsC5KQpdBo=
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr12151082wru.43.1607787559455; 
 Sat, 12 Dec 2020 07:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20201203092032.8124-1-patrick.delaunay@st.com>
 <20201203102027.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
In-Reply-To: <20201203102027.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 12 Dec 2020 08:39:06 -0700
Message-ID: <CAPnjgZ104dGFx4AJ3suS9okE5=ikDeNrrYJtpDV3VnGpMY9J5A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] console: remove #ifdef CONFIG when it
	is possible
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

On Thu, 3 Dec 2020 at 02:20, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove #ifdef or #ifndef for CONFIG when it is possible to simplify
> the console.c code and respect the U-Boot coding rules.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/console.c | 149 +++++++++++++++++++----------------------------
>  1 file changed, 61 insertions(+), 88 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
