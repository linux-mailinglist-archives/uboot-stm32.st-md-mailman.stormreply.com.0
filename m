Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15183564981
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Jul 2022 21:23:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D303FC06F81;
	Sun,  3 Jul 2022 19:23:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0479AC035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Jul 2022 19:23:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so4525284wmi.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Jul 2022 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Exm358QyY4NSnN3A+mJY1d0ELS7NK2zdLn5Wg0/vDZk=;
 b=ns7lbVffiaFDqXxyjnhamr76eOTveYX0lFkou/nPBoHw5ZbQZ1V/PW8Y/dCy/ue2NQ
 8GuWcevPmWUPl1qcskWsKounhhMKt3G90LSgpEkVYtYATlkOYjewS8N0o7N7wC/CX++L
 qFoJnH7G0wveQ/epjwvpLk0Af7KBCbNWbf3sPxxpk3tQW2ILUvhYFntLlEulnxUPVUF9
 bTpPeYsUdX8qcxtZdK7ok9unUgc0qyHKVb+PJvp3AIXYMQ2XwR/JXYEx4IP/gN2Nbyqw
 KDxTM23sRRooMn6/KAbDv8ud5XQgQ586ouRScC22NmeqZXTNHmoSd/Mfzl5gB99tKFis
 Uoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Exm358QyY4NSnN3A+mJY1d0ELS7NK2zdLn5Wg0/vDZk=;
 b=TOgUi69TZPbEL4Uov7ipbWTsSBKFifolDkMzAUcnJ+Qs7u5KkL5dB+NPPPn985J2CA
 ORhOkNAtgCm4cDoh8hKyHbG2+tm6VxfgWay6jNL/FA6ItckqA9cEsyl/dPYzjBW0/TF9
 E7fC3fYqWW4tOeLC70X4SdBzcOgAPyTffKyW3FSaIm8kI+NNPeWTEyRUIwPMbU8jdPdx
 ZzCas3ObocfPWk9VzFRMm1UaVaFo7HPuBzSNpceC20N1ddsTgeAsjbbdfszgUNMnE+7n
 QEgEY3rT+Nje83klaW9FWCISDpwHKsFTTtair8cfLsemFTzZB+lkzNZarXzx+2FmINbs
 3Qwg==
X-Gm-Message-State: AJIora/K9BjI81hLkgazUxHIY9PIXW6zSUWLWSDNAFdzFbDD/yKLLjOG
 yPbZZP2h0BwgrKB9wDVVRo0AMQfTY34F4gxMUpnpekq2TD23Gw==
X-Google-Smtp-Source: AGRyM1tSh/FA5BQ6DvpWRxDQKhfc2VMqUcFAOZZKTItJ0GePooeiOso3XhcjWFyQpT+3qwz45mWuLHeqZZHIeqe2jWE=
X-Received: by 2002:a05:600c:3ac4:b0:3a1:8d83:d675 with SMTP id
 d4-20020a05600c3ac400b003a18d83d675mr14456797wms.184.1656876195696; Sun, 03
 Jul 2022 12:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
 <20220630110938.2.I32a23c3e933a9c38ac1407db2b5c7d54e01d58b1@changeid>
In-Reply-To: <20220630110938.2.I32a23c3e933a9c38ac1407db2b5c7d54e01d58b1@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sun, 3 Jul 2022 22:23:03 +0300
Message-ID: <CAGi-RUJi7AhNrh66SARPvpfdAFsEn1ab8crrb71TekPDF2u98w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: cosmetic: reorder
	include files
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

On Thu, Jun 30, 2022 at 12:10 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Reorder include files in the U-Boot expected order.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/net/dwc_eth_qos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 0c2ba206056..97279839baf 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -34,6 +34,7 @@
>  #include <cpu_func.h>
>  #include <dm.h>
>  #include <errno.h>
> +#include <eth_phy.h>
>  #include <log.h>
>  #include <malloc.h>
>  #include <memalign.h>
> @@ -46,7 +47,6 @@
>  #include <asm/cache.h>
>  #include <asm/gpio.h>
>  #include <asm/io.h>
> -#include <eth_phy.h>
>  #ifdef CONFIG_ARCH_IMX8M
>  #include <asm/arch/clock.h>
>  #include <asm/mach-imx/sys_proto.h>
> --
> 2.25.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
