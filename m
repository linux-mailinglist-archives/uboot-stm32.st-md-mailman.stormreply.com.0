Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98D7830DA
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D95BDC6B456;
	Mon, 21 Aug 2023 19:13:41 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06EA0C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:40 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d35a9d7a5bdso3638360276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=peuiP+2oF7jq6hv12ayPcC1Q+k0J97VbfzG1+254vzg=;
 b=LboJCpF4H6HMRp4p4673nLJGPCGkCDEBpaMOpOl8zS3+IlwZ62L+H1JPA+Xk9bzqC/
 lGSg0a6xEjn265sPaRhAPklN4HHc7+v32F0LduC9AwejmzJ+kNCgne+8uFktxmT+Qszy
 EK7WBY4BqOThIs2H4gEHV1eKUzmwTyYyr6MEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=peuiP+2oF7jq6hv12ayPcC1Q+k0J97VbfzG1+254vzg=;
 b=BQIbKOyqQasMok9Mn49hp+WKX46xnjjbn+bo5TdmvMGhCLiFGP/1q2iOSPFF+Sjz/5
 Wcj0zTiBxArjIQ/YOGBIWSNvONrNkUg/D/AM1on1Yj5L199iTu2SgllPqTR/s1Oinnf2
 o54ODl+eGdjs/JO1W9+E5fMehYZIEamSPxx/msqR1qeEs7K1007q9FC492/m25rTSdvR
 kMZ0wh996TN1IHk5SR95Vz/d9eoBQzB2oQfZOSK3GpWCrf/UeCnjceQ6eX5Qe6P+l53p
 bmqxVaNyGEG8+owTczdb7qwigfZGHU3myBiU4X9LOTpCteZO2FigTdNY6lqWcPoIoVjl
 oK7Q==
X-Gm-Message-State: AOJu0Yy0BB5pQ9Awvnxs91reZstXe0X9LE/k39dTYGjLWGhT+6TMwx3l
 /5tvY6wTw62ygBhCI9/fI2hY0YrLDC3mfpnD1iS7UQ==
X-Google-Smtp-Source: AGHT+IHKQRhsgkKuuzrsFqMt4f72ppjxq7hjCyxGSoYklaPMNOtPdsaLj/rDMDnuNOacG6GmfxMT4ofmDDzwjvKsQr8=
X-Received: by 2002:a25:fc15:0:b0:d62:ba45:539f with SMTP id
 v21-20020a25fc15000000b00d62ba45539fmr7843516ybd.43.1692645218739; Mon, 21
 Aug 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-14-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-14-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:54 -0600
Message-ID: <CAPnjgZ2Ct9YJq5bFLabnrmF6wO5HUfsNtwpg40GKcVeQwiG+wQ@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 13/13] video: Enable VIDEO_DAMAGE for
	drivers that need it
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

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> From: Alexander Graf <agraf@csgraf.de>
>
> Some drivers call video_set_flush_dcache() to indicate that they want to
> have the dcache flushed for the frame buffer. These drivers benefit from
> our new video damage control, because we can reduce the amount of memory
> that gets flushed significantly.
>
> This patch enables video damage control for all device drivers that call
> video_set_flush_dcache() to make sure they benefit from it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> [Alper: Add to VIDEO_TIDSS, imply instead of select]
> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Imply VIDEO_DAMAGE for video drivers instead of selecting it
> - Imply VIDEO_DAMAGE also for VIDEO_TIDSS
>
> Changes in v4:
> - Add patch "video: Enable VIDEO_DAMAGE for drivers that need it"
>
>  arch/arm/mach-omap2/omap3/Kconfig | 1 +
>  arch/arm/mach-sunxi/Kconfig       | 1 +
>  drivers/video/Kconfig             | 8 ++++++++
>  drivers/video/exynos/Kconfig      | 1 +
>  drivers/video/imx/Kconfig         | 1 +
>  drivers/video/meson/Kconfig       | 1 +
>  drivers/video/rockchip/Kconfig    | 1 +
>  drivers/video/stm32/Kconfig       | 1 +
>  drivers/video/tegra20/Kconfig     | 1 +
>  drivers/video/tidss/Kconfig       | 1 +
>  10 files changed, 17 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
