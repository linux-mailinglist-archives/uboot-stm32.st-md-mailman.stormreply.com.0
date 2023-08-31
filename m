Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD978EA16
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Aug 2023 12:20:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2063C6B442;
	Thu, 31 Aug 2023 10:20:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28583C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 10:20:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so6155555e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Aug 2023 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693477232; x=1694082032;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m4sWkQHAa4Z6ofeDETgOnBbcCGfVfxpvaCqZY7+4P5o=;
 b=rFpHZmq5HwzOgS6PE6j5EseapLlZvtF+Un4p6UPXtYC8xS5ZlD2Dm6cQvOM2vVilwn
 nZE9OIhbSbxewkL1x8Pa9jMAeflV/kW2QEWvLnr6ozg4CDYG8lNJVRWa/XJqv0uRMaIW
 DxXUqPvAB24OZZbb2yFct8TTCDgjkc+llkm84SthvYi/QBOY3kuJe/O3DMHD+dxFtzsm
 yoFwmYPSTRb5mjQEEKRXg4bO7U+6VxlPu3y/zbAooxyQ3hCMpyJCmqexlP1OxECFFHEI
 /rgPCrLk0JRSBqy0WhI2VhxqLkR2SgX7j+koxvIC3Dszr/BqDG7A0mXupGz6IVDWCPRl
 +CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693477232; x=1694082032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m4sWkQHAa4Z6ofeDETgOnBbcCGfVfxpvaCqZY7+4P5o=;
 b=dBthAGGXFO3e9hFXi+8jFk16gUYUoCszrZpavki+aBZcZc7E2AkkLYGqFpt3Vofl4L
 NQqLQFRd/Pq8T+DmV5rnJKul4DcccJIqZyJOf5ScAeVAUf/HJcBhSpzwwAKuKIaLiKPI
 8TX8KMaWSPpGFo8MVQk13NvyiIccCHdN04qHkxALzOaVEZFbZvO4xZSXCryqhsbZeX3K
 Es6QSFhM12gVm4Fe/v/l+wRsOn2+aizIH1yqQaTAl+UpulAMT0LUfwYGd9G5geMQCLVw
 GYfV9gWPNJYSoVJQoKtuo0hZhMY6qz+0MOVz4ObljpPY+NeyqOc8j37RpiEnutH2cWZw
 CsDw==
X-Gm-Message-State: AOJu0YyyoPwbUMEqy9dw1cjyjksxKfQebIlHJCU8XmaJZ9dbif38AQtw
 KdeJPZjuObkAKBjobsyk3+A=
X-Google-Smtp-Source: AGHT+IG6M7KRkvoKt6wjo1NoqAgOf/4/uGrtldDHYF5l8gBOaL+7w9mtPaCYAjKQVxpZdQT5eQqBvQ==
X-Received: by 2002:a05:600c:295:b0:3fb:c9f4:150e with SMTP id
 21-20020a05600c029500b003fbc9f4150emr3872530wmk.14.1693477232261; 
 Thu, 31 Aug 2023 03:20:32 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.1])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05600c00c200b003fe3674bb39sm1497771wmm.2.2023.08.31.03.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 03:20:31 -0700 (PDT)
Message-ID: <d4ce17ae-8b84-4c8a-acaa-287549ec23a3@gmail.com>
Date: Thu, 31 Aug 2023 13:20:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, tr, en-GB
To: Simon Glass <sjg@chromium.org>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
 <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <CAPnjgZ3ejchoWij6C80nVMVr5iOag3Zazf7O_g_yYcw1U_f+cQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Neha Malcom Francis <n-francis@ti.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Ivan Mikhaylov <fr0st61te@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
 extensions for build output
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

On 2023-08-28 20:54 +03:00, Simon Glass wrote:
> Hi Alper,
> 
> On Sun, 27 Aug 2023 at 13:17, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>>
>> On 2023-08-24 06:02 +03:00, Simon Glass wrote:
>>> In this early stage of using binman to produce output files, we are mostly
>>> seeing people using common extensions such as '.bin' and '.rom'
>>>
>>> But unusual extensions appear in some places.
>>>
>>> We would like 'buildman -k' to keep the build outputs, but this is hard if
>>> there is no consistency as to the extension used.
>>>
>>> This series adjusts binman to enforce just 4 extensions for output images:
>>>
>>>    .bin
>>>    .rom
>>>    .itb
>>>    .img
>>>
>>> Other extensions will produce an error. With this rule observed, buildman
>>> can keep the required files.
>>
>> I dislike this limitation. We know what files we will generate, they are
>> listed in binman dtb, so we can add something like `binman build --ls`
>> to print their names/paths for buildman to preserve them.
> 
> Yes, it would be good to have that...
> 
> But why do you dislike the limitation? Do you think extensions provide
> useful information? I suppose one problem is that *.bin might pick up
> private blobs that happen to be in the source directory?

I guess my strongest argument is that people already/will have workflows
that depend on certain filenames or extensions, and shouldn't have to
modify binman code (consider that people may be using the PyPI wheels)
to accommodate those when we are already putting the name in the dtb.

I do want some standardization to the U-Boot build outputs though, but
more like a global binman.dts with like u-boot.rom, u-boot-sdmmc.img
images with well-defined TPL, SPL, U-Boot sections that arch-dtsi files
can fill in.

>> Regarding the output directory suggestion, I think the binman outputs
>> (not temporary/intermediate files) should be in the same directory as
>> make outputs
> 
> Agreed
> 
>> , and the Makefile should default to O=build to achieve the
>> "output dir". I'm not sure if that's going to happen.
> 
> I would quite like the 'non-output' file (i.e. things that are not a
> binman image) to appear in a 'binman-work' subdir of the output dir.
> What do you think?

I'd prefer them to go in a tempfile.TemporaryDirectory() and discarded
at the end of a binman run, and a "--tmpdir <path>" option to use a
given directory instead and preserve things for debugging.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
