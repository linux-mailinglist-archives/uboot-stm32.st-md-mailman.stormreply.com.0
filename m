Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0792C8EC7
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:13:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CF0FC56630;
	Mon, 30 Nov 2020 20:13:37 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E378CC3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:13:35 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id o25so15600508oie.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qHZ+D5d0eTBS6kUzhsOLHCe/UOg0URSWqa5z+hGf9p0=;
 b=OlFIXXGek8AQnXzuZR1uGTQGn3iJl0HcTWtpDjaDGWSDRtDPVOovYh4E2mzaWneTwy
 ycGcxtXFVEUckjeHqiLQ/VVxJXXeGRGwE4fo2jmfz91ptKe0qriaCNZ85BJIQq+LRg2v
 akO7a4WpN4qNkoGRXpteRdNSete1k7N8e3Q6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHZ+D5d0eTBS6kUzhsOLHCe/UOg0URSWqa5z+hGf9p0=;
 b=kNn+7QQxgtDaNwDiZewQLS9ei+EHdFfqpXL2FvS2UkOOUFtuB6MkZPQGlC35sz4Juv
 HTbBw1AQSZmDEw/lJRFrbZTllwA3Vr/k2fvm2kFL414IuzN2VDHpczln8adisKrGoI2G
 +k7an0xI+bT+ir0M5Hr23f9mnQkAZDAB2s6mvdtFskNiuaVcIFa6A9UPdHsuyeCKUSru
 3BE7XOhnZwAXhH6TKF127UW1c2ylfGmzXUt6kpb2gx5ArB2Vaf5iKqB8HWuLYXa19MK5
 6USGocINDrO/eL23wZZ2yeVUsXmevn4IaojnZ6SaZ26ovSzp3PynQaK+S4Pf2unxviY1
 iFFQ==
X-Gm-Message-State: AOAM533BpXjfB6Y+BvX2c8A6FG7wSczoRQ53JQcPnhuCuhMPeVvhI6R0
 B+L1qlgB5r80VwpmUAUFq1xxS0GmqZqP/N8oQwPMPA==
X-Google-Smtp-Source: ABdhPJyYRcySql9qrlBGWY8Xfk0U0VF5QRrpOqR0SsDX7oZqCE3u+OCDo1KeGz/LsOu7/y4NRpzO6l9iE15fuYvJURg=
X-Received: by 2002:aca:ab95:: with SMTP id u143mr482656oie.53.1606767214374; 
 Mon, 30 Nov 2020 12:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-2-patrick.delaunay@st.com>
In-Reply-To: <20201127102100.11721-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:23 -0700
Message-ID: <CAPnjgZ2oUjbETRmJYTLeQTh377TvTrspkj4_pxAxRRgq4c5V1A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/9] test: add LOGL_FORCE_DEBUG flags
	support in log tests
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

On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a check of the _log function with LOGL_FORCE_DEBUG flags,
> used to force the trace display.
>
> The trace should be displayed for all the level when flags
> have LOGL_FORCE_DEBUG bit is set, for any filter.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - Add test for LOGL_FORCE_DEBUG (NEW)
>
>  test/log/log_test.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
