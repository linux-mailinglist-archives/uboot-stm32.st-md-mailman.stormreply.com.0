Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F919E2C40
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 20:46:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9FF8C6C841;
	Tue,  3 Dec 2024 19:46:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C41A4C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 19:46:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-724d57a9f7cso5196961b3a.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 11:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733255197; x=1733859997;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W4dDcFRi9TMtQePwTEZKn7EN2iWPam1RJ/Wu9pQEF3c=;
 b=i9Sxv5gaeCVZ+oyzZ0pv79KOhT02xg1dYxFMsy9KjZmSShqqVkwJUyQ02YtTMxGh96
 ly6ev67cTonxlXZtPXCakzBUThS0xHTJQ43MQss6rA0AwMNfTTp3JtOjkPu1D/bUPxhE
 CbrcvvQFRHQQWAzy658j1GZETfDuYrXc0LYEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733255197; x=1733859997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W4dDcFRi9TMtQePwTEZKn7EN2iWPam1RJ/Wu9pQEF3c=;
 b=B081wGPDpgcDrg05x8BgMWHZHowRCnrR4DOcchsx4JXFAsCGZkal5uINkDVgqPyXL1
 uMbfjfuiUUmMipangK4dXsRxsP615PBAcja9SGlAM4phclhcjlGM5aS7tYt1byBWUkF4
 c97ClsLT/ULLJ9Jge7lKOA4uQtBRDYyV7iDI+D9dMar77ZU6Zfrz0cL8PFLbsrVIh5BX
 5mtnBwTZcNJGF6BPEYvh5c3DHLpUN01ZDzvvKpwBKEtyOJpTHEKK/wZl664ClRUpDjw9
 /ke/pr98dCA6xxOnWWht1hXtLXc9cMDWMfq750dHyq1yPwT4R797g644s9Ca5cnUEE8W
 tmJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpR43sUytzrPrhBgqiPxtfhNeMF8tsqZLqhB/ahOyde2LcAVgNYbLxQgbOvRpEQJW4WioOXoqtSwvOnQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJmcWrncZEW7gheQLSfRhFUzE4y11oMpm5LHiZuFyI1u6fC4+7
 T1jyHcWxRYsK6vglvQ8VyZbvbsi5KLng1LAHZDZT6WcYPPLYdF/6fYIWRVgFK+LrRyhM8MqgDdC
 6/s3G6afG71Nfs7l5XgleqRYulGnQ4QRQuFdZ
X-Gm-Gg: ASbGncsgATQnaQDbryiy7mJ6I/j8nbmcDy3ZOtglQU9pqO8iqaeNJ7S058oxoErUG5b
 xdvKb7Y6UDPqunHsxlbY392nTyfIE0rm1
X-Google-Smtp-Source: AGHT+IGFFAdyiTvWljgpEqDmrxGGfieRXwNylcl4KKvutnkx8+PFQOUHQm9ZUGyQLZRGJZk+jj6GfezPmg7PWoWuKDw=
X-Received: by 2002:a17:90b:52c4:b0:2ee:8e75:4aeb with SMTP id
 98e67ed59e1d1-2ef0121357amr5667377a91.17.1733255197498; Tue, 03 Dec 2024
 11:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20241102221737.547938-1-sjg@chromium.org>
 <20241102221737.547938-9-sjg@chromium.org>
 <e27167fa-5d65-40b4-92d7-27bfcba1e2b3@foss.st.com>
In-Reply-To: <e27167fa-5d65-40b4-92d7-27bfcba1e2b3@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 3 Dec 2024 12:45:58 -0700
Message-ID: <CAFLszTgAjrEUhS4s669W7-BVYTKDJC3uVCM+o=Uo9AgSg8t1_w@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Kamil Lulko <kamil.lulko@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v3 08/25] st: stm32f429: Drop old LED code
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

On Tue, 12 Nov 2024 at 04:20, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
> On 11/2/24 23:17, Simon Glass wrote:
> > This predates the LED framework, so drop it.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >   board/st/stm32f429-discovery/Makefile |  1 -
> >   board/st/stm32f429-discovery/led.c    | 39 ---------------------------
> >   2 files changed, 40 deletions(-)
> >   delete mode 100644 board/st/stm32f429-discovery/led.c
> >
> >
> Thanks
>
> for information LEDs are also defined in device tree:
> arch/arm/dts/stm32f429-disco.dts
>
>      leds {
>          compatible = "gpio-leds";
>          led-red {
>              gpios = <&gpiog 14 0>;
>          };
>          led-green {
>              gpios = <&gpiog 13 0>;
>              linux,default-trigger = "heartbeat";
>          };
>      };
>
>
> but today the CONFIG_LED_GPIO=y is missing in
> configs/stm32f429-discovery_defconfig
>
> to restore the LED support on this board
>
>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>

Applied to ci/master, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
