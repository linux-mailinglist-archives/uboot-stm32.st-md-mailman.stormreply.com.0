Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE4660AA6
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:14:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5778EC69066;
	Sat,  7 Jan 2023 00:14:33 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC55FC69062
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:31 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-476e643d1d5so43097097b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e+hKJVlKnPnW7JAVs4WmU+hp4/2yGYs8T/Cc0bvjlV4=;
 b=X3EypemoEmNB/dtMz9fGusACwwM7N1P0MCDtaZdeOW//o8n2DHu5RZYEgjIFwpXKyy
 GYD7TFBxtqrH/KBAT6szXF6w0U8SizB5ejcDV0l4UYBMc1q0a9Kh3QS20HHn3DfMoQll
 h4dxB935KNSqUTIJapeZ2PtaHCqMyCu7D+Ryc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e+hKJVlKnPnW7JAVs4WmU+hp4/2yGYs8T/Cc0bvjlV4=;
 b=3TPOEEpHZg6xzP6fhUylX890eNJDlQT37FzSRMXW4h9/3d10zj+z2sK56UcQURHgm9
 XkPBYlk8gRiVMjAJqS15ysbPTvaWKzIGtRGWCJmu5BfxHh1/M9dGcmeUrd1rcJN/OTig
 A0/7vUwMvXVNDyTHm01N9jrYbYPWQk3rx+cmytwfXF3auZ7rFbJw6+kHo/m3txqNHLiV
 cttKrAgFl+NxYZmEP4TJyeeL4qsZVTmMzv8EwN+iGt9qVU1hVEciX0w2BlM9rZf0GEja
 oodGd+euSpIDTy6y3E77C8LoE3dazTfFsli8gEiHMAN+wgjs7/5DpjAIhOhMVpQOLZXF
 Hw+A==
X-Gm-Message-State: AFqh2kpzM1IGlkMKcqwNFM875XB84kUeiC7R+/vUMdHRtY9+pJNracw9
 Wpzn7uK6u2x/6k43wrcua5/ZcbNKcguvGHdrMcAJpA==
X-Google-Smtp-Source: AMrXdXvbLUmWFcFnd9Rh3aC2opuMm/Cx5uU6U4QRjKYgU1maTptzyaPFmqAzM/0TPQlTo04cpOgWoQB+tOGT8bmmcwY=
X-Received: by 2002:a81:17d6:0:b0:3ea:9ce2:cd76 with SMTP id
 205-20020a8117d6000000b003ea9ce2cd76mr945595ywx.217.1673050470547; Fri, 06
 Jan 2023 16:14:30 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-10-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-10-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:40 -0700
Message-ID: <CAPnjgZ31HQ8jQicS0xRDCXrRGf30cA8kummDRcKUgcAEs0ESmw@mail.gmail.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 9/9] video: Enable VIDEO_DAMAGE for
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

Hi Alex,

On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
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
> ---
>  arch/arm/mach-omap2/omap3/Kconfig | 1 +
>  arch/arm/mach-sunxi/Kconfig       | 1 +
>  drivers/video/Kconfig             | 9 +++++++++
>  drivers/video/exynos/Kconfig      | 1 +
>  drivers/video/imx/Kconfig         | 1 +
>  drivers/video/meson/Kconfig       | 1 +
>  drivers/video/rockchip/Kconfig    | 1 +
>  drivers/video/stm32/Kconfig       | 1 +
>  8 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/mach-omap2/omap3/Kconfig b/arch/arm/mach-omap2/omap3/Kconfig
> index 3e97ec2629..ea231f16a2 100644
> --- a/arch/arm/mach-omap2/omap3/Kconfig
> +++ b/arch/arm/mach-omap2/omap3/Kconfig
> @@ -113,6 +113,7 @@ config TARGET_NOKIA_RX51
>         select CMDLINE_TAG
>         select INITRD_TAG
>         select REVISION_TAG
> +       select VIDEO_DAMAGE

Please avoid using select since it means that boards cannot disable it.

You can use 'imply' instead.

Or you can use 'default y' for the damage Kconfig.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
