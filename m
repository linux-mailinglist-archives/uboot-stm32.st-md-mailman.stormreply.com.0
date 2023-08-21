Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 656857830DC
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E58D6C6B477;
	Mon, 21 Aug 2023 19:13:41 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F058BC6B44B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:39 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d73ee75a796so3685258276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wrHPGPV+rJ0zVUExLA2bPtPFKxsZ1tfddRhCzAQvQDw=;
 b=b9lpHhJE/mYtNcE4zAx/3kFf0oa9jJSlumD2iUc3hIsM7LnYKhz92Lix9luQdZYDwm
 6I8W/vfyIABAS+RiImGMo6eJWxFZv0Z43qCFqTdhg/1aBNfccVQdi69WJ+7uDSGbIK2/
 HZWJVwBX5vknWNbOLQCQNpBXlGGkhFLINWlgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrHPGPV+rJ0zVUExLA2bPtPFKxsZ1tfddRhCzAQvQDw=;
 b=Gyjf2tT+qEjgiYXCqMnL3yrZpfbs6u/PlSEjGzPej9IcGBwcEpmZxhWifFZrnjsbC5
 2Mm3+oM+0oHWozF8AJHL4cBinGWuV1kKxQSsgIamEp000nLSyIxGGUewsGlsvQD1nbkR
 L+nDizlQrsbbRsCb1JwY9XjBnt9G21L/K1m82p3bklXJNtautLiA0t8jRgrmWFnakWGk
 IR02oE7rOacYSKQ5bN0KfSlIsvitUo81RWwgcHNGS5zskl0JgwZ+PP/mvbDYIyD5/Jcz
 Ov6fbF3GjV66AB5KM5F2TnmLqOvTUEFC12o+9kA5BMDs5qSLBwRIty7ugH0W8vbFYTej
 KLBQ==
X-Gm-Message-State: AOJu0YyBSUgzabuW18JOMSohi8YCgWFhOIXdIo7mUKGUoGyntC7uDFWw
 zTgU+u5AY/GZ6t5v1DTeVz+ofoSeIBpmuVRgZhmRig==
X-Google-Smtp-Source: AGHT+IHUSWDesZbAxqSOnsa4OXjDVG6/61Y8rTwnQJnak052erAbLStEX39cLZAwcROdtMdPCdncwprS9FU6Z/+hluE=
X-Received: by 2002:a5b:c0e:0:b0:d23:d12:edf5 with SMTP id
 f14-20020a5b0c0e000000b00d230d12edf5mr8140214ybq.44.1692645218723; 
 Mon, 21 Aug 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-11-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-11-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:57 -0600
Message-ID: <CAPnjgZ2_9s_n9RWO_t_UUJWK1uvjDQSHikpMg7VbpmCn9uuk5g@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 10/13] video: Only dcache flush damaged
	lines
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

Hi Alper,

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> From: Alexander Graf <agraf@csgraf.de>
>
> Now that we have a damage area tells us which parts of the frame buffer
> actually need updating, let's only dcache flush those on video_sync()
> calls. With this optimization in place, frame buffer updates - especially
> on large screen such as 4k displays - speed up significantly.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> [Alper: Use damage.xstart/yend, IS_ENABLED()]
> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Use xstart, ystart, xend, yend as names for damage region
> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>
> Changes in v2:
> - Fix dcache range; we were flushing too much before
> - Remove ifdefs
>
>  drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 5 deletions(-)

This is a little strange, since flushing the whole cache will only
actually write out data that was actually written (to the display). Is
there a benefit to this patch, in terms of performance?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
