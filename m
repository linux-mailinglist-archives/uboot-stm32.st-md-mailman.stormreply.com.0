Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C9660AA9
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:14:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 805F4C69066;
	Sat,  7 Jan 2023 00:14:43 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA484C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:41 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-4c186ff0506so42853207b3.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bd7UBhsAwbyOt1kCOGuYuLUTMIjEItxb7m/t74Qf/W8=;
 b=NrxxP0tZoZBSq0lc9wl44t4nGesWsUHXgqeElcrdqr1uq/OiBKPLlooCbTymV/Ydot
 hsU9FeNNeZIqe64YZ2kzTUI/iPBvmh214hs6GJEJTFU6SPhz013LZrhUbtQVP9WmuWWR
 A6764Ve2IltNrNiwQzSaOsOtpHYC/pUDCnmt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bd7UBhsAwbyOt1kCOGuYuLUTMIjEItxb7m/t74Qf/W8=;
 b=pMzYaqIHJJQumoefBfQbPde81NqK5TlheSZWoUS7jRHqO/+WJQ8/AXMYI990rthlAZ
 Rq0Z2uQo5AwFoO045B6k6EZTcx5svuCrI1oqi7ct0hHmNRF5Fytw0/0FGCE1I0QUQrBW
 5TO/9W/38Nj/8I7LC1lmVz7TZ0A51F4bj9KH9slMUVoeWHfWBuAUk9zKrPkrrIfJv5fQ
 /Ba1UeE+PxwkPIAplDeXFabqJTRBsrH/kd2amfBym7/761gXzk2DMcXCbDziPb39wa1i
 8Rw2t+9CKn+CoXaed8PulXgBufn1cUvRj2jpkHitAnnCUzMpJMSwzqBOpU2+7XEl9duj
 HyyA==
X-Gm-Message-State: AFqh2krlJcPg6ic/PMVqmZzovVDHZL7vHPIP8sAZdQgKf00oBiPPWho9
 qX9x776TJu5YrhyyARGZDDJ3l3s5wYvl6mT3CN61ww==
X-Google-Smtp-Source: AMrXdXs22qREveSuJqURaPM2Rv7Q486X9YH2Q/jLuoODmsnM8PJeMXbX4T11RM4FmGm3GrgyjFarDCjmvL8weesDW4w=
X-Received: by 2002:a05:690c:c07:b0:4b4:ee4f:381e with SMTP id
 cl7-20020a05690c0c0700b004b4ee4f381emr1647145ywb.279.1673050480687; Fri, 06
 Jan 2023 16:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-8-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-8-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:35 -0700
Message-ID: <CAPnjgZ1uDNY4T65Q4EdW-xRnFiGhvWcCs=YtcwLCpRbZpTNJQg@mail.gmail.com>
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

Hi Alexander,

On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> CONFIG_VIDEO_COPY implemented a range based copying mechanism: If we

range-based

> print a single character, it will always copy the full range of bytes
> from the top left corner of the character to the lower right onto the
> uncached frame buffer. This includes pretty much the full line contents
> of the printed character.
>
> Since we now have proper damage tracking, let's make use of that to reduce
> the amount of data we need to copy. With this patch applied, we will only
> copy the tiny rectangle surrounding characters when we print them,
> speeding up the video console.
>
> As a bonus, we remove a lot of code.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v2 -> v3:
>
>   - Rebase
>   - Make CONFIG_COPY always select VIDEO_DAMAGE
> ---
>  drivers/video/Kconfig             |  5 ++
>  drivers/video/console_normal.c    | 14 +----
>  drivers/video/console_rotate.c    | 37 ++-----------
>  drivers/video/console_truetype.c  | 17 +-----
>  drivers/video/vidconsole-uclass.c | 16 ------
>  drivers/video/video-uclass.c      | 91 ++++++++-----------------------
>  drivers/video/video_bmp.c         |  7 ---
>  include/video.h                   | 37 -------------
>  include/video_console.h           | 49 -----------------
>  9 files changed, 37 insertions(+), 236 deletions(-)
>

This feature needs some tests in test/dm/video.c

For sandbox, I think you will need to allow it to be enabled /
disabled at runtime, so the some tests can use it and some not?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
