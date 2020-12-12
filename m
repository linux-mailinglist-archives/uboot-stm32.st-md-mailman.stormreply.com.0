Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 065762D8752
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Dec 2020 16:39:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF28FC3FADA;
	Sat, 12 Dec 2020 15:39:24 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E56BC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 15:39:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a6so10011992wmc.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Dec 2020 07:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3gX+b0n5qPwfy2aUSLgeQs7ixMEK4nmfiCs7+LymJlw=;
 b=bZfHjv3XfK1xLdHa+kNoh4G8CpeLMHBtv7YtM01FubWA0j5yln1trLUEKwse2SHjn2
 XiFHSreoIWvvdjKticPrniOpwQ38aZrDMJnRXrzTp2zCB3E3y92prgN5vILD222DabkE
 jThzh+g+BSonKOW5Jis0CC2Jr3tRwieaY5g+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gX+b0n5qPwfy2aUSLgeQs7ixMEK4nmfiCs7+LymJlw=;
 b=f/vp/qcnsOWIdutf+TQsvVeurc939FTwoYdXOvzA4GnRexQ0jzFTbUiF9FDdRGejWx
 fgVrnHAJlEIbh6lR8gyKuf+2lWPAaZn4qzJydKlU0PnGy2r26AMCUv+TZujC8vwoWI87
 RPF8o2KbmTMlgqroUmFb+2gFDlYg3UWf4bnx4fFiP1Wh6okjZvX9MhqwayAQ4mPo+L4+
 3uff6Jq1+eVKHlFUkMeRfbqvd/dZVd4nP1qyN3d5BE6RpHA/v7XIlFRc0/A5L1/8h1hZ
 zn4r0LXaMDj8dQx8YvFyTnEapci6gGpZetmZUaznZkZJ+M6wqpo94Fh1eGMKXGy3qGj2
 Q91A==
X-Gm-Message-State: AOAM530s8Q2S55V5RbfxzkSSCgRfifqbzS/kV61SmrVrkH4zhCEGWFvR
 XW4Y3NEGJVJTXLH9NSTGouZ1o/gRM/iQRcOXYfEO4g==
X-Google-Smtp-Source: ABdhPJz3xjz70oGhkxV+kWtgziXH/FOYRfzz+fJDNd8RbwfPOD2eshFiuj9ktE77so6HWy0tcYeavPHwu+/lrjWPUSY=
X-Received: by 2002:a1c:65d4:: with SMTP id z203mr9755295wmb.65.1607787562037; 
 Sat, 12 Dec 2020 07:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20201203092032.8124-1-patrick.delaunay@st.com>
 <20201203102027.2.Icd4f9239c00329a77c50bc0c42b3638c744ea955@changeid>
In-Reply-To: <20201203102027.2.Icd4f9239c00329a77c50bc0c42b3638c744ea955@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 12 Dec 2020 08:39:09 -0700
Message-ID: <CAPnjgZ24QKsWbAPxL1p-BRBhYVJMWYqKJAvcrcF-nXscwm_rdw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] console: add function
	console_devices_set
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
> Add a new function to access to console_devices only defined if
> CONFIG_IS_ENABLED(CONSOLE_MUX).
>
> This path allows to remove #if CONFIG_IS_ENABLED(CONSOLE_MUX)
> in console_getc function.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/console.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
