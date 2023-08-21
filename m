Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2567830D6
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9601C6B44C;
	Mon, 21 Aug 2023 19:13:35 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DDCDC6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:34 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d743a5fe05aso3367910276.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645213; x=1693250013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FH3eOxQscQ5CAcOn0+VC0pA6Dmlur/T4lBfA3IEN4wo=;
 b=YOdkDu7ViaDsC5BZPnPn1WC/Ng+P/Fr8bvL3mLJ6CZDIKNlF+AWggY0MaZAp+NhKO/
 q3Eoa7FhYyGHmq7mJfF2TAAIrOQMrap3gMd3iOMTH2kxS1nTdGO8eYjLWHJqA5r4cebD
 w/+E0a2dUeNxIxoUht9qbdas6hnQyxgd3AOOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645213; x=1693250013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FH3eOxQscQ5CAcOn0+VC0pA6Dmlur/T4lBfA3IEN4wo=;
 b=Ndd8zD90WjYPAdrnA1AbdmEU5vMIb9718JavmbxgaWkFaYfa+tfhG5bGGxSxtcTGHC
 zbbGZoQmjlA+5hZkOtpIdQ52HV7tQiLgIKqw3uHo0SHOWZN96l/V7lX45/2pD88EtxJh
 Mt6byu/KYKbNE2C9nFSx1qOUYu8cjDPbNfdXGj3/BREXFDT6/bOT9a4mABFG7TbAlMwK
 qcQlDWHnWif3QzxMaZyzqujqg0JRuV6zky1DyD7/BSBba8NIOXs1zR4xnAoOEaFR6bQg
 buPpGra2nNx5FJj1B5hkcOuArj8CGXhxWEKwSnkZyfAhFJy0M5H+V72xcOxOdo/gjJeA
 eMQQ==
X-Gm-Message-State: AOJu0YzxdHB+yx8xKE6Vso1tG+c8zAFexRd/Ts70w5GJrVric1Fa9Y4g
 JbYwXg1FzC7WPV+Nidt4YFTNIv3aDiOWRBkvCJjV1Q==
X-Google-Smtp-Source: AGHT+IE7suHGnf0gmADvcf8XCIbakY8DW6RMnsLPMiGUm8Q8Uz3Olc8CbsWIlctiQlhOphLfBnREyw9QyMVEkJC8WXk=
X-Received: by 2002:a5b:dc3:0:b0:d62:bc43:426e with SMTP id
 t3-20020a5b0dc3000000b00d62bc43426emr7076775ybr.43.1692645213133; Mon, 21 Aug
 2023 12:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-5-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-5-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:50 -0600
Message-ID: <CAPnjgZ20VRYsP=5S5HJWjR2sNvmOudseHiXUcjnZmDCA=0jfnw@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 04/13] dm: video: Add damage tracking
	API
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
> We are going to introduce image damage tracking to fasten up screen
> refresh on large displays. This patch adds damage tracking for up to
> one rectangle of the screen which is typically enough to hold blt or
> text print updates. Callers into this API and a reduced dcache flush
> code path will follow in later patches.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> [Alper: Use xstart/yend, document new fields, return void from
>         video_damage(), declare priv, drop headers, use IS_ENABLED()]
> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Use xstart, ystart, xend, yend as names for damage region
> - Document damage struct and fields in struct video_priv comment
> - Return void from video_damage()
> - Fix undeclared priv error in video_sync()
> - Drop unused headers from video-uclass.c
> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>
> Changes in v4:
> - Move damage clear to patch "dm: video: Add damage tracking API"
> - Simplify first damage logic
> - Remove VIDEO_DAMAGE default for ARM
>
> Changes in v3:
> - Adapt to always assume DM is used
>
> Changes in v2:
> - Remove ifdefs
>
>  drivers/video/Kconfig        | 13 ++++++++++++
>  drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++++---
>  include/video.h              | 32 ++++++++++++++++++++++++++--
>  3 files changed, 81 insertions(+), 5 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

But I suggest an empty static inline in the case where the feature is disabled?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
