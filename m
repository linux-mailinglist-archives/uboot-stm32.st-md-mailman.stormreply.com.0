Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B178A122
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Aug 2023 21:17:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65327C6B44D;
	Sun, 27 Aug 2023 19:17:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44414C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 19:17:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso1138714f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693163866; x=1693768666;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yKqOrErGq5Vduvi+6POZnt7MsebRO3ojKhurbDdcm/0=;
 b=HYLdo78ge3awQTIyig0xztaP5yeDXRCf8CcPKI6yvXElSFSeX1dgJ61E2dZn8mNdLd
 wvcPHLhR+RBWI1BPLnJpzle0ku02WBW5ldWPpLt/osEbB/eWuroQ0T01ufeXYBWjbyTV
 OZO8kOf4Y+8IenEA3AsRH1IKDfXAorbPqyTbR1N96OSDNtwk8FiZae4yXPWFPlGDNyqf
 6tY0TdyY4mwuH9gYmZW0EOZgfoFJop37bM2JiH0iLYSrmRKd7wL7YqjS1irdB0+K2b8Y
 GTRFJD7xQuO7kiGoJqe4frZIK6bXxpJeIgIlxeF/x0nJU1cIMAFbTESKYy2bC9m6kN6U
 LgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693163866; x=1693768666;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yKqOrErGq5Vduvi+6POZnt7MsebRO3ojKhurbDdcm/0=;
 b=k0kIuVx4bRnf7Y65nyIFSWU/qz8Baqy61orS2YFm6WdVSwvtRZXx5dzLGO7dMDGq2F
 j2Mrec3X3NXECsGOyuFkwSRbz7RhZXaNCZoowY02E8wE3VC2UwtiB3eg5PRd6gECJvLd
 PII1EuiMCuHbWjZe9R2A5F4c2S7pNL/y8YzE/psGHgG5BFD9qWU6DggUSkwyzjRwcV6v
 woWxyvupiMx5bEAJKQ8y6GAWsCidZu3DiZm2iW+bUPijT8yqt2x1rmfTF5Mm86ktVyDu
 cwAu/Ycq5q1Hhnk27qwDhaeBClB8P+egbphS9XgImOUoVqJfZfVJmQ7KtjMMYezd/iQ/
 iRkA==
X-Gm-Message-State: AOJu0YzAekv8vPmTt35ePOtafRzgHjqn80MyPUnWNd2Uv18flnRA60Ps
 UpZNflW+Ana2w/aonji1vNQ=
X-Google-Smtp-Source: AGHT+IHrhehfPDhPcaSaZSk42BBjuHLj7Ceqgb74PIGCoU3COVJN9VszyfnmxODvboA3wQxK2wQieg==
X-Received: by 2002:adf:e584:0:b0:319:7908:cf26 with SMTP id
 l4-20020adfe584000000b003197908cf26mr21490274wrm.26.1693163866608; 
 Sun, 27 Aug 2023 12:17:46 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.1])
 by smtp.gmail.com with ESMTPSA id
 f17-20020adfdb51000000b0031912c0ffebsm8291758wrj.23.2023.08.27.12.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Aug 2023 12:17:46 -0700 (PDT)
Message-ID: <40d6d839-6eaf-4950-bf37-aaad0f2d5e03@gmail.com>
Date: Sun, 27 Aug 2023 22:17:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, tr, en-GB
To: Simon Glass <sjg@chromium.org>
References: <20230824030304.1555547-1-sjg@chromium.org>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <20230824030304.1555547-1-sjg@chromium.org>
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

On 2023-08-24 06:02 +03:00, Simon Glass wrote:
> In this early stage of using binman to produce output files, we are mostly
> seeing people using common extensions such as '.bin' and '.rom'
> 
> But unusual extensions appear in some places.
> 
> We would like 'buildman -k' to keep the build outputs, but this is hard if
> there is no consistency as to the extension used.
> 
> This series adjusts binman to enforce just 4 extensions for output images:
> 
>    .bin
>    .rom
>    .itb
>    .img
> 
> Other extensions will produce an error. With this rule observed, buildman
> can keep the required files.

I dislike this limitation. We know what files we will generate, they are
listed in binman dtb, so we can add something like `binman build --ls`
to print their names/paths for buildman to preserve them.

Regarding the output directory suggestion, I think the binman outputs
(not temporary/intermediate files) should be in the same directory as
make outputs, and the Makefile should default to O=build to achieve the
"output dir". I'm not sure if that's going to happen.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
