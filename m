Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E85AEEAE
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 17:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F7DC640F0;
	Tue,  6 Sep 2022 15:26:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D96C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 14:53:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so9771256wmk.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Sep 2022 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date;
 bh=rdokNV7u1vqfMpSAzwNKwSOX13y8cOMHUfrsQt+lVKQ=;
 b=by1n2cM+iwDXID40RJAXEXM8GgSeyqVdHsUf/nSb6SnIDduaS8/Pm9ubm7aiF6gsYA
 l/nC4omQm21sJO/Zer8qT1C1on+pWHquZvs5k6APaYtszI7vEpr4jaA6hs2sn5I14Px/
 1/RMrWwadA+P1LSTgCQRlf/sr/C6pm85yRuKE5vyP077RndnHZO/sodf75T0dA80+y3v
 IhwWJ7UD335azsQPGYF1FZNftpY/mrjmYb4QuBAIuoZqk6Mo67NUAz1TkMpe4vMtJwCF
 UDoH1DZoQOlysShiv/BDuGSu6b3C791QILH2UXZX6CVuaV1IMG8Dd8LcqvabzlD4cPcO
 mW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rdokNV7u1vqfMpSAzwNKwSOX13y8cOMHUfrsQt+lVKQ=;
 b=qdlVvf+6+RQ/ozMcAu/QCGP/ggbl0OMphvoDyRpNcZNM7IAg2PgtUla/N1pZnA0k80
 bAzIRQ2HTI4ESHaPkNiqK7v+QScIzVB5z5dnjXTmghEiwYZFpz/j3adA6oXsVRF7Siyf
 E+pO7WIPvgfKQAqkjRp1tUEqp0AT9vGD8rjde2SAaXE1FqDqvF38FJQkiHUVtc1IjiGv
 Uio3zIi+JjWIt9fnd9umZZDad6y9gWecdn8DWDy7Z8OzBIL/ow6IC6gYGdhh9oz0gKSV
 c728julgM6MuqCBAydLw/LN5ZBUoLenHPpVMrxXsG7pSi+D44HB87zO0PeNMNbs48vbA
 AW6Q==
X-Gm-Message-State: ACgBeo3/cBEkyEmhHhiYUPeCnycwvOZTC0bIjeQe/pi26RmbEerL/S7C
 McNcAQvNu26QWsWLAI4+O3Ziyw==
X-Google-Smtp-Source: AA6agR7AEm4l1PE3vdDDe9EKprjKUSul8lnGmqoIphZzhyBcbg9SZBUgokPkpvG/fJcAETFuPRMdqA==
X-Received: by 2002:a05:600c:444b:b0:3a6:6b99:239a with SMTP id
 v11-20020a05600c444b00b003a66b99239amr14340119wmn.41.1662476007266; 
 Tue, 06 Sep 2022 07:53:27 -0700 (PDT)
Received: from trex (131.red-83-60-92.dynamicip.rima-tde.net. [83.60.92.131])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003a84375d0d1sm23237243wmq.44.2022.09.06.07.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:53:26 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Tue, 6 Sep 2022 16:53:25 +0200
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220906145325.GA2015520@trex>
References: <20220905173357.2231466-1-jorge@foundries.io>
 <04ba2a69-9c29-dd84-547c-76043b017e0b@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04ba2a69-9c29-dd84-547c-76043b017e0b@foss.st.com>
X-Mailman-Approved-At: Tue, 06 Sep 2022 15:26:29 +0000
Cc: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, alain.volmat@foss.st.com,
 cryosay@gmail.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp*: fix system reset
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

On 06/09/22, Patrick DELAUNAY wrote:
> Hi,
> 
> On 9/5/22 19:33, Jorge Ramirez-Ortiz wrote:
> > Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
> > from executing.
> > 
> > The side effect observed are I2C devices no longer being
> > accessible from U-boot after a soft reset.
> > 
> > Fixes: 11517ccc8c52 ("configs: add stm32mp13 defconfig")
> > Fixes: 17aeb589fa9d ("stm32mp15: remove configs dependency on
> >                        CONFIG_TFABOOT")
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > ---
> >   configs/stm32mp13_defconfig         | 1 -
> >   configs/stm32mp15_defconfig         | 1 -
> >   configs/stm32mp15_trusted_defconfig | 1 -
> >   3 files changed, 3 deletions(-)
> 
> 
> The reset driver (used to managed Hardware device reset with RCC)
> 
> based on RCC register or on SCMI for 'system' / 'secured' ressource
> 
> and the sysret for global platform based on PSCI are indendent.

Yes. But AFAICS in the trace only one executes during the sys reset walk and
PSCI gets in first (so SCMI doesnt run when U-boot reboots).

> 
> Deactivate CONFIG_SYSRESET_PSCI only prevent soft reset support
> with the command reset or after crash.

Also AFAICS, the kernel only uses SCMI for reset (which probably explains why
OP-TEE controlled I2C devices still work when the board reboots).

> 
> 
> I don't think it is the correct solution if the I2C devices is no longer accessible
> after SW reset.
> 
> i think that it is more a bug / problem for reinit of I2C in STM32 driver
> so the configuration is not correct after a SW reset.

Not sure about that...but lets find out because something is wrong for sure.

> 
> 
> We have not detect this issue for I2C communication to PMIC after SW reset.

that could be because the PMIC uses the only I2C mode that works with
OP-TEE (the master transfer mode is broken until my fixes are merged...hopefully
soon)

> 
> 
> Can you provide more information for your use-case, for reproduction on my
> side
> 
> - platform used (STM32MP13 or STM32MP15), board used

STM32MP15

> 
> - I2C instance used and I2C device connected

NXPSE050 - i2c in master xfer mode, accessible only from OP-TEE
https://www.nxp.com/docs/en/data-sheet/SE050-DATASHEET.pdf

> 
> - version of TF-A / OP-TEE used

OP-TEE: 3.18
TF-A: 2.7.0

> 
> 
> Patrick
> 
> 
> > diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> > index 673b468d31..44cee2e656 100644
> > --- a/configs/stm32mp13_defconfig
> > +++ b/configs/stm32mp13_defconfig
> > @@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
> >   CONFIG_DM_RTC=y
> >   CONFIG_RTC_STM32=y
> >   CONFIG_SERIAL_RX_BUFFER=y
> > -CONFIG_SYSRESET_PSCI=y
> >   CONFIG_TEE=y
> >   CONFIG_OPTEE=y
> >   # CONFIG_OPTEE_TA_AVB is not set
> > diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> > index e5a2996c2c..2ad02f3652 100644
> > --- a/configs/stm32mp15_defconfig
> > +++ b/configs/stm32mp15_defconfig
> > @@ -133,7 +133,6 @@ CONFIG_SPI=y
> >   CONFIG_DM_SPI=y
> >   CONFIG_STM32_QSPI=y
> >   CONFIG_STM32_SPI=y
> > -CONFIG_SYSRESET_PSCI=y
> >   CONFIG_TEE=y
> >   CONFIG_OPTEE=y
> >   # CONFIG_OPTEE_TA_AVB is not set
> > diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> > index e14668042f..9e24e82920 100644
> > --- a/configs/stm32mp15_trusted_defconfig
> > +++ b/configs/stm32mp15_trusted_defconfig
> > @@ -134,7 +134,6 @@ CONFIG_SPI=y
> >   CONFIG_DM_SPI=y
> >   CONFIG_STM32_QSPI=y
> >   CONFIG_STM32_SPI=y
> > -CONFIG_SYSRESET_PSCI=y
> >   CONFIG_TEE=y
> >   CONFIG_OPTEE=y
> >   # CONFIG_OPTEE_TA_AVB is not set
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
