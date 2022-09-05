Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570665AEEAC
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 17:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF7BC63325;
	Tue,  6 Sep 2022 15:26:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AB7FC0AA15
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 16:32:14 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so7086752wmk.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date;
 bh=SuRsrQ1ffq2QfHIXWodAGj21RJyBLqOnSuN6oI+rJNk=;
 b=D4K3uYoEed4c+3icGD3Ynyrvt0cWI+DoUvk9KMfPgP8pZ51t+x/VmPBF1ItdVDdrwj
 z8Glc8qywL03ONKlcSKddkkGXEV7TRTIZI6RLRXGLmxIK8OBu3mYGY97fxX5TvNzRXvZ
 E2p2ed52owqN7EYjnlDtV90Cy06oPbzV+J+mpmob9Asdu9xKztHo8fKkwurcY4dMWUro
 zoAoS5IXDW/Fd+UYe3h4UNa6uirIV7zIKyy/KRQRvpWLwDDgyuxfU+kktQXeaZQHZRIJ
 EdXPAJtZbKARQkd1odJ1bAEMy7R+j5r0JBidlcAoRXvdinF1sEAo1chlfbTOhwz571kX
 9HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SuRsrQ1ffq2QfHIXWodAGj21RJyBLqOnSuN6oI+rJNk=;
 b=PkZvfjUg91H3Ylq2G61oc3ursIXAaKwWj2WgEVd37i+XUIm9sIGMbTsX4jyG0/sJuC
 vHVd42ywXVh2ameyb4rIvsYvTBmLmG+OE4cOPgY9ujfmessu/Owcyfk/gIOdGEKzSOUf
 PoUXrIzAcFxdZqNGNCCM4RCfQtKTxLAIrD5XaPhQg4cvmnZrnRmxS6/J7pBwKYufuRxV
 S1MZeA00FiJOw4/DUQsJdVAjNj0VFQDWshMVvATMMdrdQeUAhZeCaZ/Dsr2Y2GdBfrc3
 +Vjo6cdY8s4xQkxWuORRgpKpIsJVoCyWqRdHzKZJLDfdVs4h3vy42MJ8V6Vl1ycrZJxc
 RI9A==
X-Gm-Message-State: ACgBeo0CkG+vbjwIWnGkcQrVuDRNXQMXLs5fnzdwB1fXn9lQdrmUkjcx
 XHJFyHFIIG26z5nHCNbfNOlgsGo+1X8OKg==
X-Google-Smtp-Source: AA6agR4xF0ZmygA2XmcNF6fUwwl7kCB+30dTFTIU4sIEEK6lsDBeEGmrZDSTX0NBUJqqXSV82P5wNg==
X-Received: by 2002:a05:600c:4ece:b0:3a6:28:bc59 with SMTP id
 g14-20020a05600c4ece00b003a60028bc59mr11176375wmq.154.1662395533826; 
 Mon, 05 Sep 2022 09:32:13 -0700 (PDT)
Received: from trex (131.red-83-60-92.dynamicip.rima-tde.net. [83.60.92.131])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a5d595c000000b0021e13efa17esm9427687wri.70.2022.09.05.09.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:32:13 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Mon, 5 Sep 2022 18:32:12 +0200
To: Jorge Ramirez-Ortiz <jorge@foundries.io>
Message-ID: <20220905163212.GA2219123@trex>
References: <20220830195049.1068973-1-jorge@foundries.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830195049.1068973-1-jorge@foundries.io>
X-Mailman-Approved-At: Tue, 06 Sep 2022 15:26:29 +0000
Cc: patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 mike@foundries.io, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp*: reset via
	CONFIG_RESET_SCMI
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

On 30/08/22, Jorge Ramirez-Ortiz wrote:
> Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
> from executing.
> 
> The side effect observed are I2C devices no longer being
> accessible from U-boot after a soft reset.

I think this PR should get a bit more of attention.

The current reset configuration is broken, this is a fix.
Do I need to rename the PR?

TIA
jorge


> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>  configs/stm32mp13_defconfig         | 1 -
>  configs/stm32mp15_defconfig         | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 673b468d31..44cee2e656 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
>  CONFIG_DM_RTC=y
>  CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
> -CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index e5a2996c2c..2ad02f3652 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -133,7 +133,6 @@ CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SPI=y
> -CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index e14668042f..9e24e82920 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -134,7 +134,6 @@ CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
>  CONFIG_STM32_SPI=y
> -CONFIG_SYSRESET_PSCI=y
>  CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  # CONFIG_OPTEE_TA_AVB is not set
> -- 
> 2.34.1
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
