Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C15AD7F9
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Sep 2022 19:01:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB20CC0C920;
	Mon,  5 Sep 2022 17:01:16 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA201C0AA15
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 17:01:15 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1272fc7f51aso9316485fac.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 10:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SP8TafyFsPJI4QZlPxMRJEjmV/nH2vHWAzc1yDN78BM=;
 b=nfHiqWfcwziCz/vSsF2OXiOtTRqcvM0fDphNNKrfbFp1P0bPotZnKIaNpKnaFcojMv
 FJQVRRkO0tUtSv88MyNikaR2cX4WfJFz4bYar8VGNKkPGeLATgyQ43N3OtRULPhS/Skn
 anrAKEyx3BcxV0QuWaGohiSIX1LuTPbVBBx6CtYB89lyFeAQQWNe8oH56KqljDiyhkA2
 cb2qs6GkCQwCzJvILGbGR4o3e7wMbjtjqm9Y1+7WFX+jWB6gn3WoVDvFR2udIO1T4JBi
 akmoDHLKpDatai7C5SQ4e5By7C+DLipcFr/WnuP/FZjt4DITgJ9KN0OngDcVZHispmfM
 Jp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SP8TafyFsPJI4QZlPxMRJEjmV/nH2vHWAzc1yDN78BM=;
 b=oqkIplsy+NVXpWQw1PlP745n1G+P3WMRk8QlOkZayGbpr6NB5EzgC3EFIj7TYnxhX7
 4GQ7HqqSsD4j+YvgeNIv5b4XuuLHzDTxXRo2Kmw3RNAGqCsCqCucRD8nT/ec7p/d79u4
 XaU4/7n/vOzqdOVYGyXsLK4QCIPS4rHHeDP1QAI+NNLOIAzR2LStric360lV/od5elcn
 y626kyt+g3jeYuuz/qlFHtFiMeB7k1ZymGouChzt/W+WdV2Ht5KaESSKqRjBCrT4Rp6V
 T2IUF1EjXLYmTUYQhQtfjhUmroHJy4nIKuV6pcUm2rC5FIa+I8SyjjKD30RRgPSH8T78
 4/UA==
X-Gm-Message-State: ACgBeo1jCouJ672HPwUUlFY5S4F2PaGcSiyRQE6Vvr2pgDswyQ9pYYtZ
 2/cyny12p2BqIs9OTz74DSa/vGDcqxopaIvOKhA=
X-Google-Smtp-Source: AA6agR7X1o6jfMu1yo5CYBiwk4bz844wKDG6XN5n5F79z9s4N7Mrp9EoMDRh01gWpHDc7Fpbm+dWCGaM4MhQIsCRmZk=
X-Received: by 2002:a05:6870:5624:b0:127:8ff5:1cb2 with SMTP id
 m36-20020a056870562400b001278ff51cb2mr1564479oao.201.1662397274557; Mon, 05
 Sep 2022 10:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220830195049.1068973-1-jorge@foundries.io>
 <20220905163212.GA2219123@trex>
In-Reply-To: <20220905163212.GA2219123@trex>
From: Oleksandr Suvorov <cryosay@gmail.com>
Date: Mon, 5 Sep 2022 20:01:01 +0300
Message-ID: <CAGgjyvEQNdKvEuxg3qh3i6Ykyx9=fZdwq-Tf0JPhJ7zeLtqaZw@mail.gmail.com>
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
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

Jorge,

I think, renaming the patch to "fix" and adding a field "Fixes:"
should help accept it faster.

On Mon, Sep 5, 2022 at 7:32 PM Jorge Ramirez-Ortiz, Foundries
<jorge@foundries.io> wrote:
>
> On 30/08/22, Jorge Ramirez-Ortiz wrote:
> > Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
> > from executing.
> >
> > The side effect observed are I2C devices no longer being
> > accessible from U-boot after a soft reset.
>
> I think this PR should get a bit more of attention.
>
> The current reset configuration is broken, this is a fix.
> Do I need to rename the PR?
>
> TIA
> jorge
>
>
> >
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > ---
> >  configs/stm32mp13_defconfig         | 1 -
> >  configs/stm32mp15_defconfig         | 1 -
> >  configs/stm32mp15_trusted_defconfig | 1 -
> >  3 files changed, 3 deletions(-)
> >
> > diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> > index 673b468d31..44cee2e656 100644
> > --- a/configs/stm32mp13_defconfig
> > +++ b/configs/stm32mp13_defconfig
> > @@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
> >  CONFIG_DM_RTC=y
> >  CONFIG_RTC_STM32=y
> >  CONFIG_SERIAL_RX_BUFFER=y
> > -CONFIG_SYSRESET_PSCI=y
> >  CONFIG_TEE=y
> >  CONFIG_OPTEE=y
> >  # CONFIG_OPTEE_TA_AVB is not set
> > diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> > index e5a2996c2c..2ad02f3652 100644
> > --- a/configs/stm32mp15_defconfig
> > +++ b/configs/stm32mp15_defconfig
> > @@ -133,7 +133,6 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > -CONFIG_SYSRESET_PSCI=y
> >  CONFIG_TEE=y
> >  CONFIG_OPTEE=y
> >  # CONFIG_OPTEE_TA_AVB is not set
> > diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> > index e14668042f..9e24e82920 100644
> > --- a/configs/stm32mp15_trusted_defconfig
> > +++ b/configs/stm32mp15_trusted_defconfig
> > @@ -134,7 +134,6 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > -CONFIG_SYSRESET_PSCI=y
> >  CONFIG_TEE=y
> >  CONFIG_OPTEE=y
> >  # CONFIG_OPTEE_TA_AVB is not set
> > --
> > 2.34.1
> >



-- 
Best regards
Oleksandr

Oleksandr Suvorov
cryosay@gmail.com
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
