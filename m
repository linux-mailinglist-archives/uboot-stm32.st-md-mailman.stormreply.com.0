Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EED22AC200D
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 May 2025 11:46:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E032C7A82B;
	Fri, 23 May 2025 09:46:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9897AC7A823
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 09:46:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so97860755e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747993568; x=1748598368;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=teC5tTMK82CofkrRzx5DnfavRclTncErwK6RSN4Ol6I=;
 b=cHC3IB3wa/yrbHXm7IdvrIYFl0gpJ4t/dlrLg4Go6E3A8sZXZ+IK/+gm4MnNjHwcAQ
 Wphdr5ijD2qI+ObWBzH5nexhZ7b+tKcGWkPA3by8xoEjb9YqV2TW7Bfrg5x8wyOcyGs8
 +fEkCogYXJpSPgFw9h2VQ8e8hNK7iSIskf+HOrlQRHVuY2/pjDAfvwPyQSwqos4CU5QL
 e960MolB0xDpf/UJE05Rg4+RCURWv3VUEoqa5YEUDNcmPeJIQjiuXZQkTsgwpCW2g2e1
 iALSmUg1WEyMLNRPB83XkO4Kz1OC1izxnK0jjXHCs2JrjOoNroECAj6P8vzjSLRFK58h
 G4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747993568; x=1748598368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=teC5tTMK82CofkrRzx5DnfavRclTncErwK6RSN4Ol6I=;
 b=O1GpbJsJDLRHDvX0KPU97eKBhNoPIrSf4h0Webqo0dHajf18b/wvX/TYSkYKSN1eB0
 glKG97zKa1eibhTm8gqmBw0g3C05hWCnv/ytMZtWob9CjPyVYIQ2qFN5uLqvjC80DycA
 q4mKhsnjpOegLzkZz3z52deKcl0HsCAIEPUWGkScGfbT8rEMEa/M9azq/aQJeZeN6oVj
 Urs59G5y5SCSeXMgHaqNBmBT83ndIUJg++BP4Lj7ATUjfykXB0iU28eOA0Yks+GrIICL
 mBJgqPGHg/0Z2BUAfDxVS/XuWD6SQh0pQgL4l+SsdPKt6jDYgcwyhcQNJuTlGXUX3Gjk
 RPIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEnCm1W3fuhl4xPdCfXZSi2d6cHEFPwJSQFpMfM+rZney0X3NS0+tU3QvMA32wrjQeuS1JpWYcNmT/Gw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyfGyPBCUndb5i1XhDdHm5C/G5vZYrp3Ce5vkvaxGErjFx82WGD
 ppfjNruz3cxwSJ5xpDJaYHo5OyWW95TVpbW+jJ6Gf4BwS3gcBvYLeEQJhGsqH2vlcm4=
X-Gm-Gg: ASbGncvCJHdP4jjAuJA5pis8yIV08K2t+R6gunC0p01Opr4VlYpNB8Xt+sI3ugRn4P1
 k32LvTVvRAcNpQGZzO04o+57YfwVTnbHjEFF36tzYpn8c/AzYo60D3wCXpjl/joKtRJG7AcQRR0
 HZ5OAY3M9EW8dIRZ+xEWd/5B7I+Y1hz8aznL7DzsU5+Z4HadccWvhXSaJVLxmtv164WUAct95Cv
 tZ2tOcRXienjN1jmjyCDxmaGHs80CfjYFXdWebpNLoIgjx+ktLT54N3vXlZUZd0rc3h9K8Acntm
 pfyebFxAHY4y+FU1FBQRoailCxLP7Dp54Yi/jO5xJCAgvZopHluD3SKL50I970rfrag5wuG2hLw
 FrApyHLhec5GST6n5BkkruqpN62DdKNQ=
X-Google-Smtp-Source: AGHT+IEzYrAvCYe9EOw17IWuRHxORfMXy6fsCLkOthwyjFg+XWgjqXfy6x2avfhkt2WVMM7mvGy6Pw==
X-Received: by 2002:a05:600c:1e03:b0:43c:e70d:44f0 with SMTP id
 5b1f17b1804b1-44b6d6b69b2mr17824135e9.19.1747993567889; 
 Fri, 23 May 2025 02:46:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3cb:7bb0:ddf4:2a94:8e10:88ff?
 ([2a01:e0a:3cb:7bb0:ddf4:2a94:8e10:88ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef0aadsm133502095e9.12.2025.05.23.02.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 02:46:07 -0700 (PDT)
Message-ID: <d6e1c95d-c571-46e4-aa2b-3d2a2c93bb1c@linaro.org>
Date: Fri, 23 May 2025 11:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250523091140.149298-1-patrick.delaunay@foss.st.com>
 <20250523111100.v2.1.Ie741b1ca358414a1d718dca0667ac44eefc9227b@changeid>
Content-Language: en-US
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <20250523111100.v2.1.Ie741b1ca358414a1d718dca0667ac44eefc9227b@changeid>
Cc: Tom Rini <trini@konsulko.com>, caleb.connolly@linaro.org,
 Casey Connolly <casey.connolly@linaro.org>,
 Adriano Cordova <adrianox@gmail.com>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] lib/uuid.c: restore support of
 system partition type for ESP
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

Hi Patrick,

On 5/23/25 11:11, Patrick Delaunay wrote:
> Add support of optional shortname for parameter 'type' of gpt
> command (limited by UUID_STR_LEN) and a separate 'description'
> for UID format "%pUs" used in 'part list' output.
> 
> When 'description' is absent in list_guid[], the optional
> shortname is used as fallback.
> 
> Many partition types for EFI have no shortcut yet, but only
> description as they are only used to display information.
> 
> This patch also restores the "system" as short name for EFI
> System Partition (ESP).
> 
> Fixes: d54e1004b8b1 ("lib/uuid.c: use unique name for PARTITION_SYSTEM_GUID")
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - change 'string' to 'type' in struct for list_guid[]
> - clarify the usage of struct field 'type' and 'description' in
>   comment and in commit message
> - use 'type' for EFI_XXX description as these string have
>   no space and size is lower than 36 characters.
> - update after V1 review
> 
>  lib/uuid.c | 158 ++++++++++++++++++++++++++++-------------------------
>  1 file changed, 85 insertions(+), 73 deletions(-)

Thanks for cleaning this up. This new uuid/type/description combo makes a lot
of sense.

Acked-by: Jerome Forissier <jerome.forissier@linaro.org>

-- 
Jerome
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
