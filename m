Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82C213257
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 05:51:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA0E4C36B26
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 03:51:20 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAC0AC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 03:51:18 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id o22so8342720pjw.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2020 20:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bs9iJzRwztNEQL7wxP1Ul9yaYMuvuuKV+w9WFkq66wE=;
 b=Yu8btD5guLPKmGLGDO3cR2bo5n/xCmD0oZOT+1TKQpP9Xkbn9Sog0mHe0E74BtQsS8
 OlpgwvN9UyqYPatklbu/PXB97uPHJcqJyXMCk+IQ/U6eIz3dsD9uPSpyi+tFVAq+c66j
 Yxmco9BWlCFOXOKV9BBkIhY+4rVU+tZE5S9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bs9iJzRwztNEQL7wxP1Ul9yaYMuvuuKV+w9WFkq66wE=;
 b=C7SvXfHrUSaktWWW1G2cLbWL51hoYBh5KrXGrBmZD78nL42MTM080G0Vl1vzRQOf5B
 0B0t9h6osKRQqoYcKj5FOSaagBk7/xlu70YQFuTgRyHuXnn8xP4aiBLPqD277HfK1Q3p
 Ye8doTZKwQ09D4ouxPprF1cj0Kdow+trIWEUbVMstVgO7cjihvZlhvs4J0ia5SsrRYGp
 FGSWrWG7RWoDh3YN9xuPEVYC1GJ1T5wtCVLdQSnyrhMseuLW5dlrXiUgGZcty/h4k7yE
 Y30MB2xyaBgMg0mK8uHvmH30YB5pNFCnrdLwvAFe0CdDjywpFvws8ClLokzdhnliAuCM
 kz+A==
X-Gm-Message-State: AOAM531Q+H46bFiJP7GTn3O4JY0nUzN3Fz7raLCmKwHoviGmcqF+p34y
 UzxKddC9MA90rgMozknvszLJFsegOEVk0a7DYE7lKQ==
X-Google-Smtp-Source: ABdhPJyVehw81oHkHI+OgbcKrMSc9//piJo5FUwevtuarKKl7wf24iiNb2ea8ZoVr6SmoMkBiEdZp50LJ9KEFMuX4Ys=
X-Received: by 2002:a17:90a:9a98:: with SMTP id
 e24mr31781801pjp.141.1593748277222; 
 Thu, 02 Jul 2020 20:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200701125610.22340-1-patrick.delaunay@st.com>
In-Reply-To: <20200701125610.22340-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 2 Jul 2020 21:50:24 -0600
Message-ID: <CAPnjgZ2cDYxM8cOrLvt9Hx+2UisnjCHcqn5xWe0LmS93BdJ2wg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Soeren Moch <smoch@web.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] video: restore CONFIG_VIDCONSOLE_AS_LCD
	as boolean
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

On Wed, 1 Jul 2020 at 06:56, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This patch restores CONFIG_VIDCONSOLE_AS_LCD as boolean
> and introduce a separate sting as CONFIG_VIDCONSOLE_AS_NAME
> to search this string in stdout used as videoconsole.
>
> This patch avoid issue with board defconfig or code expecting
> CONFIG_VIDCONSOLE_AS_LCD as boolean.
>
> Fixes: 22b897a12323 ("video: extend stdout video console work-around for 'vga'")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Hi,
>
> It is fix for stm32mp157c-ev1 boot on next branch.
>
> The option names are not perfect but it is only a temporarily
> work around (up to end of 2020).
>
> You can see other example of boolean and string in Kconfig =
>   config USE_BOOTCOMMAND
>   config BOOTCOMMAND
>
> I think the correct name could be:
> - CONFIG_USE_VIDCONSOLE_AS_NAME
> - CONFIG_VIDCONSOLE_AS_NAME
>
> but these name need to modify many file for a fix on a workaround
> CONFIG.
>
> Regards,
>
> Patrick
>
>
>  common/console.c      |  6 +++---
>  drivers/video/Kconfig | 12 +++++++++++-
>  2 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
