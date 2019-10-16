Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98958D977A
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2019 18:34:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44F98C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2019 16:34:16 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2CB0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 16:34:14 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id o16so3265870ilq.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=33w2LZ4tdkSqanFwiRKWkVbJf+Fak7uI95RhVJyiMNc=;
 b=o+7c8DSl4dL4kp0M+48bGy+0TWZcgAPXtqzjbkxPhSfQfgW5mrxIXaKlUjLaJuFvL3
 ktYYIzoSdC7dNNVQUXg8nTyC0bO0gtI7ta2fXMP4WQD2voCvBwNpsW8/W4alkKRqbUgb
 BmTlvribuXBr3DH6x9n+f5vHrpfkhwV34tcBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=33w2LZ4tdkSqanFwiRKWkVbJf+Fak7uI95RhVJyiMNc=;
 b=rNuL+D3WWbSVEBUQH+36GJ+D7r0sfLg5Gl1p6v/WhD4gPB8JwyvVByir01l9658+I4
 Og214Gg8m90QWs7ovLpQ1C7SEfnwF9LX3ucm16AEorhls904uEMSpJzjA0VL8UiEZa3E
 9lqiwTlbWD0ujuAeGf/LDL2Az4BOrEzVtxO2pnYsZ+dufQ9dyGPf+g2AHKGEUgv7HAqA
 MMIBuKOum7LKqsVLKqGy1gg5EFqOUjR/FJuQ+68d/+1L+vA6Mle9kqbIcX8XMN7NJejF
 cK8A6v2C6LS7+GD7hKYt7edevVzypthWezdcgaWRDw47XPDC4GlBXOBikUW9aD/qO5DO
 4Ngw==
X-Gm-Message-State: APjAAAVRsps/liq5B6zApVOoBvOq1NyRzf/tk1cuyVKNvEmsSn3C7MIZ
 eHh4pDudSVKZAX1fcnppkS4BCW2GPBkaGga5suBd8A==
X-Google-Smtp-Source: APXvYqz2NyCOrVETMGYmwHde1VrBGRZrxfNqsmVfX6BnibBrVqmh0l183ArkItRfYR1xv9LTBmkeD4s3g0jxOtO8Sv8=
X-Received: by 2002:a92:b604:: with SMTP id s4mr12950840ili.28.1571243653275; 
 Wed, 16 Oct 2019 09:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190913224242.21054-1-frieder.schrempf@kontron.de>
 <20190913224242.21054-2-frieder.schrempf@kontron.de>
In-Reply-To: <20190913224242.21054-2-frieder.schrempf@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 16 Oct 2019 22:04:01 +0530
Message-ID: <CAMty3ZCZgL4wrZpwXcPLZAaGzG2uMHs2zftoPkjSV8b2geNw8g@mail.gmail.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "lukma@denx.de" <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/3] stm32mp1: configs: Add
	CONFIG_SPL_SPI_FLASH_MTD
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

On Sat, Sep 14, 2019 at 4:18 AM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> As SPI_FLASH_MTD is used in SPL and U-Boot proper, we enable both,
> now that a separate option for SPL was introduced.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  configs/stm32mp15_basic_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 09785b5dc1..390319657f 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -7,10 +7,10 @@ CONFIG_TARGET_STM32MP1=y
>  CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_SPI_SUPPORT=y
>  # CONFIG_ARMV7_VIRT is not set
> +CONFIG_SPL_TEXT_BASE=0x2FFC2500
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> -CONFIG_SPL_TEXT_BASE=0x2FFC2500

Unrelated change wrt to commit message?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
