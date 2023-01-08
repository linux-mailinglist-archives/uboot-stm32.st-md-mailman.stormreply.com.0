Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA312661650
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Jan 2023 16:49:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B687C65E58;
	Sun,  8 Jan 2023 15:49:00 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC26BC65E45
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 15:48:59 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id qk9so14459658ejc.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Jan 2023 07:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a+JOWs4wj4/oiFUG6FbaopMRN1qj7IG0blzXydEiJR0=;
 b=GSFFlwRxl8Hy4q2YdmnWXzVH4kQeG4JQBbWE33zyYMrj5hDlbEmgKocNFota7LPiJf
 gaARsgTZSK7EnaNQPIfsFPvsjx+ZUBTXxSdj8WbdAvOUbJpwMh4WbubhXL2nSZwyD2BV
 maIGJWauWAUgaB/jY3nXPwUw83HmFAASpGqzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a+JOWs4wj4/oiFUG6FbaopMRN1qj7IG0blzXydEiJR0=;
 b=rAxdPQz6hpVhip3Gn18ZrZF0M5Z7mTLQJVuk3B65CR3AGBuAX/LKBqlVsJTlRHYcsq
 IkS6fmB/skm69UcQVbOHe2+RJbhY/Cf5wVem1wmWda7lkJuq34ph9gVp+fZntiks6DFR
 5tnC5c/y2p0Uz0DCqJUusoZcrgYESXY4pIhK7LKCmkUoZ7yyYQuxjQiCkWoW2kRGs5gb
 hqeW0RwgH02K0o6ZMQQQUpppUUThYawhxbCMNA58GdsMVE15x00iiR01kpqHUe/5ogkQ
 U8Z972ROFPRjdMXn2HkrklOzb1ufzjf3QLz+yPopMPF2EA4nd6FShyTjyj2xGLBGdF0y
 VuxQ==
X-Gm-Message-State: AFqh2kog0Hvy7sk4XImYKC88z+dL7/HOkxqtXc9cTy7tXeFnVZ7sqjSL
 PW5+qG9esU8I9VQn27QBcuA3sOQwLs2Pk4uyONI8Pg==
X-Google-Smtp-Source: AMrXdXt9GVN471F9OVv/yjc4ArEeIYJbacvSNSh6r0E4gL7oMuKUZyJ2hp7Cv45KLW2QJSqNr71X931I31yc+5I3DUI=
X-Received: by 2002:a17:906:cb85:b0:7ea:608f:23bd with SMTP id
 mf5-20020a170906cb8500b007ea608f23bdmr6757334ejb.221.1673192938979; Sun, 08
 Jan 2023 07:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-8-agraf@csgraf.de>
 <CAPnjgZ1uDNY4T65Q4EdW-xRnFiGhvWcCs=YtcwLCpRbZpTNJQg@mail.gmail.com>
 <b03e611b-2150-9bf9-0cb1-b15752ef9ae5@gmx.de>
In-Reply-To: <b03e611b-2150-9bf9-0cb1-b15752ef9ae5@gmx.de>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 8 Jan 2023 08:48:47 -0700
Message-ID: <CAPnjgZ0Bw9=oVC5gy_d4x5DeWHWJt_Uyq2EdXoxbY1o1Zmzw5Q@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 7/9] video: Use VIDEO_DAMAGE for
	VIDEO_COPY
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

Hi Heinrich,

On Sat, 7 Jan 2023 at 16:22, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 1/7/23 01:13, Simon Glass wrote:
> > Hi Alexander,
> >
> > On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> CONFIG_VIDEO_COPY implemented a range based copying mechanism: If we
> >
> > range-based
> >
> >> print a single character, it will always copy the full range of bytes
> >> from the top left corner of the character to the lower right onto the
> >> uncached frame buffer. This includes pretty much the full line contents
> >> of the printed character.
> >>
> >> Since we now have proper damage tracking, let's make use of that to reduce
> >> the amount of data we need to copy. With this patch applied, we will only
> >> copy the tiny rectangle surrounding characters when we print them,
> >> speeding up the video console.
> >>
> >> As a bonus, we remove a lot of code.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >>
> >> ---
> >>
> >> v2 -> v3:
> >>
> >>    - Rebase
> >>    - Make CONFIG_COPY always select VIDEO_DAMAGE
> >> ---
> >>   drivers/video/Kconfig             |  5 ++
> >>   drivers/video/console_normal.c    | 14 +----
> >>   drivers/video/console_rotate.c    | 37 ++-----------
> >>   drivers/video/console_truetype.c  | 17 +-----
> >>   drivers/video/vidconsole-uclass.c | 16 ------
> >>   drivers/video/video-uclass.c      | 91 ++++++++-----------------------
> >>   drivers/video/video_bmp.c         |  7 ---
> >>   include/video.h                   | 37 -------------
> >>   include/video_console.h           | 49 -----------------
> >>   9 files changed, 37 insertions(+), 236 deletions(-)
> >>
> >
> > This feature needs some tests in test/dm/video.c
> >
> > For sandbox, I think you will need to allow it to be enabled /
> > disabled at runtime, so the some tests can use it and some not?
>
> It should be good enough to enable the feature in one of the sandbox
> defconfigs and disable it in another.

Yes that would work, e.g. enable in sandbox but not sandbox_flattree

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
