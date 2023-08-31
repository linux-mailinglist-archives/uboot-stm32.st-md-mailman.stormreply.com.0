Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E578E4D1
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Aug 2023 04:49:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD01C6B442;
	Thu, 31 Aug 2023 02:49:30 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09CE7C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 02:49:28 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d7cbcfdf137so160204276.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 19:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693450168; x=1694054968;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ab5v3xQTqog23hxV7qH8oPiHUy/XADxQfdfyqt5fSp4=;
 b=MQM33BNbYUP0qWkeu646skqBr0HCHIHzt4H+sh1LYuuCQ8T2jf5V2rD6G6HK1pEwjd
 5Aj82WlNqU071BA0D+YEQAqyATGAqK7Cf5DaxTzsyr67W5VGEMMleALuQTylPKse8myy
 Fxk/GOfloDKXrF3w5+n/oieVyNfVmoTTvp+vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693450168; x=1694054968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ab5v3xQTqog23hxV7qH8oPiHUy/XADxQfdfyqt5fSp4=;
 b=k5nlKkUBDKijgevpgc4XYk+e5jQaTs6qCb1pwTasr0af0jAbB08H42s5Tzg5EsV3pT
 BZ+5ZEN5UaMbaGRghgXH4bslWBP513UAVz9N99kIuGvNFZQQmsXQjN7jqSMJ1T4miqRn
 WoKNOh088s5ZbvsHivpcoxjVd7R6UeptE7a2UBRl8YYR/9Hju+Y+iMClzu4EzKayH32z
 DhRRDeElolU6hi+UQvwFR3gWbe/R+z5xxc/4J5sWAOrngK8L9j25UOzQN4bTXaxHkRof
 WKGcGd2szQM8UPuo74ImNec0wvRrSy4WQLK+qeYT5Z387G8YyiR/2FTtGpqYIpaeucxp
 eY0w==
X-Gm-Message-State: AOJu0YxC6xSlr01KJ3a6WePN1P/klZM6K5AE7w3N/2oYEVx15VIvVND6
 YpLVdgtYeNgN1Fw2Vi35zuEbTUe1jnyaxL6NVrxHZQ==
X-Google-Smtp-Source: AGHT+IFXUjl0hp2/imbwwK7GNNi6W4ZfBrxrIiu+3+NCJvX771IAduEap3T+36O4cgh7ki4jHpSQGjdrkVMED09mGE8=
X-Received: by 2002:a25:d87:0:b0:d71:8729:23b8 with SMTP id
 129-20020a250d87000000b00d71872923b8mr3677269ybn.13.1693450167630; Wed, 30
 Aug 2023 19:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-5-alpernebiyasak@gmail.com>
 <CAPnjgZ20VRYsP=5S5HJWjR2sNvmOudseHiXUcjnZmDCA=0jfnw@mail.gmail.com>
 <3bae5070-e99a-4179-a59c-833c9a2971f5@gmail.com>
In-Reply-To: <3bae5070-e99a-4179-a59c-833c9a2971f5@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 30 Aug 2023 20:49:13 -0600
Message-ID: <CAPnjgZ2EXNJ0-0Yo0ggd8O+h0Vi9bSCsqVO6kMUnE1nzc8L97w@mail.gmail.com>
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

Hi Alper,

On Wed, 30 Aug 2023 at 13:15, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
>
>
> On 2023-08-21 22:11 +03:00, Simon Glass wrote:
> > On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
> >>
> >> From: Alexander Graf <agraf@csgraf.de>
> >>
> >> We are going to introduce image damage tracking to fasten up screen
> >> refresh on large displays. This patch adds damage tracking for up to
> >> one rectangle of the screen which is typically enough to hold blt or
> >> text print updates. Callers into this API and a reduced dcache flush
> >> code path will follow in later patches.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> Reported-by: Da Xue <da@libre.computer>
> >> [Alper: Use xstart/yend, document new fields, return void from
> >>         video_damage(), declare priv, drop headers, use IS_ENABLED()]
> >> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> >> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> >> ---
> >>
> >> Changes in v5:
> >> - Use xstart, ystart, xend, yend as names for damage region
> >> - Document damage struct and fields in struct video_priv comment
> >> - Return void from video_damage()
> >> - Fix undeclared priv error in video_sync()
> >> - Drop unused headers from video-uclass.c
> >> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
> >>
> >> Changes in v4:
> >> - Move damage clear to patch "dm: video: Add damage tracking API"
> >> - Simplify first damage logic
> >> - Remove VIDEO_DAMAGE default for ARM
> >>
> >> Changes in v3:
> >> - Adapt to always assume DM is used
> >>
> >> Changes in v2:
> >> - Remove ifdefs
> >>
> >>  drivers/video/Kconfig        | 13 ++++++++++++
> >>  drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++++---
> >>  include/video.h              | 32 ++++++++++++++++++++++++++--
> >>  3 files changed, 81 insertions(+), 5 deletions(-)
> >>
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
> > But I suggest an empty static inline in the case where the feature is disabled?

>
> You mean with something like #ifdef CONFIG_VIDEO_DAMAGE, right?

Yes

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
