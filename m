Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F578DEA2
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 21:15:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E227C6A61A;
	Wed, 30 Aug 2023 19:15:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8DC7C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 19:15:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-401da71b7c5so17981625e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693422937; x=1694027737;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QSrRxP5i12OOCf8bZO6fm7DHUydpNk/O7ILcGjdyQfE=;
 b=fRLeFEEUvI9PrLCSUeHeX24pQ3ZJ6Gqr0BcaTtQojD2NpJNmmMtzRn7DeIYMJAVudw
 NfVxsy6TDHA2YVqplx9+2ZDpriNGWCGVyHmG1K1unyCHk4GpjGSzRgHtC9jsuZDo1uOQ
 byLT1+ytWgax/gdewuSQ8Kernw7kFByznAeutF7C6n7r/ojZtokreh+SsAugrk129SSS
 6klSvmDjqltXPrFvCM/ZNegXnrHzfwJs46gOJyvJKU/69mFXlsQahqvElB8In6Enzxmo
 9XrOUeHpKG48ufhCLd+7HJFTydM9v/NdkheQ5qewXm9Hk+XjTvote+ToaqjMqmqkIvc4
 /wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422937; x=1694027737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QSrRxP5i12OOCf8bZO6fm7DHUydpNk/O7ILcGjdyQfE=;
 b=IWSoVCv6X0VoEiasq5ogNUnhVfaNldCd+AxXFZFgWd2Ctdn2pYItLcxhFVsR6XG98u
 mI0Zwy+nbBDY9YplBeFG6k9AUOnrNqoOES5OmGhPN/fw2btY1GmRup84J6y+SVGAWi4k
 tBhWleWQMKTUVJEdTb6ZzQ1o2/ncAIdtRMrsHeG0HypLJhR5DzOmIMrWS4jjffPqsLwd
 xbzCQ3/xbfYuJ6Ct8QKOJwrKtmDDS0ecMQeju4aalXGmZt4UvtJ+7iE4Ki0kpW0SU6BJ
 prZnhdIpnNuHaxwz9wHlpvmjMmDjxqXXFktImoXl2VWtlM3TYD1aNeHjkCBoAIk0Rwzz
 Q8NQ==
X-Gm-Message-State: AOJu0YzJYIt38D0GrfRxBQUNI0GPfJflpabuNWnjWvFENi+KgRrk5DrV
 7FfTlvjK2UVLsiU8cy6TaMU=
X-Google-Smtp-Source: AGHT+IF8f+KkXGTY9P2CIDKCaXBNmHiiL/A8AE4+KO0xT0Jis9cwP3Usxdq8vKw+vtCz6T1XWL/3Pg==
X-Received: by 2002:a7b:c849:0:b0:3fb:739d:27b2 with SMTP id
 c9-20020a7bc849000000b003fb739d27b2mr2747517wml.8.1693422936880; 
 Wed, 30 Aug 2023 12:15:36 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.1])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003fc0505be19sm3071178wmk.37.2023.08.30.12.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:15:36 -0700 (PDT)
Message-ID: <3bae5070-e99a-4179-a59c-833c9a2971f5@gmail.com>
Date: Wed, 30 Aug 2023 22:15:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, tr, en-GB
To: Simon Glass <sjg@chromium.org>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-5-alpernebiyasak@gmail.com>
 <CAPnjgZ20VRYsP=5S5HJWjR2sNvmOudseHiXUcjnZmDCA=0jfnw@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <CAPnjgZ20VRYsP=5S5HJWjR2sNvmOudseHiXUcjnZmDCA=0jfnw@mail.gmail.com>
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



On 2023-08-21 22:11 +03:00, Simon Glass wrote:
> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>>
>> From: Alexander Graf <agraf@csgraf.de>
>>
>> We are going to introduce image damage tracking to fasten up screen
>> refresh on large displays. This patch adds damage tracking for up to
>> one rectangle of the screen which is typically enough to hold blt or
>> text print updates. Callers into this API and a reduced dcache flush
>> code path will follow in later patches.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reported-by: Da Xue <da@libre.computer>
>> [Alper: Use xstart/yend, document new fields, return void from
>>         video_damage(), declare priv, drop headers, use IS_ENABLED()]
>> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>> ---
>>
>> Changes in v5:
>> - Use xstart, ystart, xend, yend as names for damage region
>> - Document damage struct and fields in struct video_priv comment
>> - Return void from video_damage()
>> - Fix undeclared priv error in video_sync()
>> - Drop unused headers from video-uclass.c
>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>>
>> Changes in v4:
>> - Move damage clear to patch "dm: video: Add damage tracking API"
>> - Simplify first damage logic
>> - Remove VIDEO_DAMAGE default for ARM
>>
>> Changes in v3:
>> - Adapt to always assume DM is used
>>
>> Changes in v2:
>> - Remove ifdefs
>>
>>  drivers/video/Kconfig        | 13 ++++++++++++
>>  drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++++---
>>  include/video.h              | 32 ++++++++++++++++++++++++++--
>>  3 files changed, 81 insertions(+), 5 deletions(-)
>>
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> But I suggest an empty static inline in the case where the feature is disabled?

You mean with something like #ifdef CONFIG_VIDEO_DAMAGE, right?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
