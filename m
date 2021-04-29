Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181736EDE5
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 287B9C58D5A;
	Thu, 29 Apr 2021 16:11:01 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E79FC58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:10:58 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso39337010otl.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nktP/cmzF1LMAhRIb+Ih7SsBr4mS5o0SPohOFyZfI3U=;
 b=k0OZVgJLU8FUTRXxNr7v7F8tLY8L5rrkhOaeLRspPNZNGmDkH7f89mUD59oG8niSI8
 3dah1wpGKvtvL1whS8gRG8/fKEhP5EgByRi/szPwKxnMm+Nl6PBeCyNBVSv68FhZQmBQ
 UjZ9tkq61dqhuAspRxumvTYOG3Gaj/W16MR9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nktP/cmzF1LMAhRIb+Ih7SsBr4mS5o0SPohOFyZfI3U=;
 b=WBNMlhlH33CQN8XdsQWdc09Dp16wzgdqonakjAdA+6KFF4AOE6pSGU+ykiIsZqp7zZ
 8VGCpCAWHVTDDpdMYtr7BPjgqD9RPT0EHs0W/hkosYRIZjBf9NmoP7LV5stUonfaibog
 nTA5MOb8VYNjRYILjNVV37j+/i7fYFjKuwDBrDLtxsOA27t4eTnyF8bJ8S3mMxkKZd+c
 q4E5D1VALtm9NSRJFuMCu2lGnYN6F/IpGksgDpirefoVXMlPRFra+EH7OjWl49d8VHrx
 BPIobfUaZ/krV54QqTNVCPFkGLhRpGfI1Qim+R70aIoWpPGlAonRkAzgoS1VH0HH4r+r
 WVNg==
X-Gm-Message-State: AOAM532hKKssQi5uzL84lAz/SR9ACoJwag6udUJVAL0I8RDcar2dl2RN
 lrX7tcqzPOZDpIKaXi+J/oU8hf4lp3u2uqS+jCpIZA==
X-Google-Smtp-Source: ABdhPJy7j/Y7EurPfDosYV0Mfzhp9HT6q1tNz1y5QJfnwKUKYAaLU+Wq18KDl2jDKYS0+V1aKMIatzGNuPUYapPu1tw=
X-Received: by 2002:a9d:615a:: with SMTP id c26mr153522otk.54.1619712657057;
 Thu, 29 Apr 2021 09:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210427110153.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
In-Reply-To: <20210427110153.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:37 -0700
Message-ID: <CAPnjgZ19RN3gp99D=G22cLPMebh3qMZi7DwaRirckFX1TM1ZMA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: define LOG_CATEGORY for all uclass
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

On Tue, 27 Apr 2021 at 02:02, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Define LOG_CATEGORY for all uclass to allow filtering with
> log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/adc/adc-uclass.c                    | 2 ++
>  drivers/ata/ahci-uclass.c                   | 2 ++
>  drivers/axi/axi-emul-uclass.c               | 2 ++
>  drivers/axi/axi-uclass.c                    | 2 ++
>  drivers/block/blk-uclass.c                  | 2 ++
>  drivers/block/ide.c                         | 2 ++
>  drivers/bootcount/bootcount-uclass.c        | 2 ++
>  drivers/button/button-uclass.c              | 2 ++
>  drivers/cache/cache-uclass.c                | 2 ++
>  drivers/clk/clk-uclass.c                    | 2 ++
>  drivers/core/root.c                         | 2 ++
>  drivers/core/simple-bus.c                   | 2 ++
>  drivers/cpu/cpu-uclass.c                    | 2 ++
>  drivers/crypto/rsa_mod_exp/mod_exp_uclass.c | 2 ++
>  drivers/dma/dma-uclass.c                    | 2 ++
>  drivers/firmware/firmware-uclass.c          | 2 ++
>  drivers/hwspinlock/hwspinlock-uclass.c      | 2 ++
>  drivers/i2c/i2c-emul-uclass.c               | 2 ++
>  drivers/i2c/i2c-uclass.c                    | 2 ++
>  drivers/i2c/muxes/i2c-mux-uclass.c          | 2 ++
>  drivers/input/keyboard-uclass.c             | 2 ++
>  drivers/led/led-uclass.c                    | 2 ++
>  drivers/mailbox/mailbox-uclass.c            | 2 ++
>  drivers/misc/fs_loader.c                    | 3 +++
>  drivers/misc/i2c_eeprom.c                   | 2 ++
>  drivers/misc/misc-uclass.c                  | 2 ++
>  drivers/misc/p2sb-uclass.c                  | 2 ++
>  drivers/misc/pwrseq-uclass.c                | 2 ++
>  drivers/mmc/mmc-uclass.c                    | 2 ++
>  drivers/mtd/mtd-uclass.c                    | 2 ++
>  drivers/mtd/spi/sf-uclass.c                 | 2 ++
>  drivers/mux/mux-uclass.c                    | 2 ++
>  drivers/nvme/nvme-uclass.c                  | 2 ++
>  drivers/pch/pch-uclass.c                    | 2 ++
>  drivers/pci/pci-uclass.c                    | 2 ++
>  drivers/pci_endpoint/pci_ep-uclass.c        | 2 ++
>  drivers/phy/phy-uclass.c                    | 2 ++
>  drivers/pinctrl/pinctrl-uclass.c            | 2 ++
>  drivers/power/domain/power-domain-uclass.c  | 2 ++
>  drivers/power/pmic/pmic-uclass.c            | 2 ++
>  drivers/power/regulator/regulator-uclass.c  | 2 ++
>  drivers/pwm/pwm-uclass.c                    | 2 ++
>  drivers/ram/ram-uclass.c                    | 2 ++
>  drivers/remoteproc/rproc-uclass.c           | 3 +++
>  drivers/reset/reset-uclass.c                | 2 ++
>  drivers/rng/rng-uclass.c                    | 2 ++
>  drivers/rtc/rtc-uclass.c                    | 2 ++
>  drivers/scsi/scsi-uclass.c                  | 2 ++
>  drivers/serial/serial-uclass.c              | 2 ++
>  drivers/smem/smem-uclass.c                  | 2 ++
>  drivers/soc/soc-uclass.c                    | 2 ++
>  drivers/sound/codec-uclass.c                | 2 ++
>  drivers/sound/i2s-uclass.c                  | 2 ++
>  drivers/sound/sound-uclass.c                | 2 ++
>  drivers/spi/spi-emul-uclass.c               | 2 ++
>  drivers/spmi/spmi-uclass.c                  | 2 ++
>  drivers/sysinfo/sysinfo-uclass.c            | 2 ++
>  drivers/tee/tee-uclass.c                    | 2 ++
>  drivers/thermal/thermal-uclass.c            | 2 ++
>  drivers/timer/timer-uclass.c                | 2 ++
>  drivers/ufs/ufs-uclass.c                    | 2 ++
>  drivers/usb/emul/usb-emul-uclass.c          | 2 ++
>  drivers/usb/gadget/udc/udc-uclass.c         | 2 ++
>  drivers/usb/host/usb-uclass.c               | 2 ++
>  drivers/video/backlight-uclass.c            | 2 ++
>  drivers/video/bridge/video-bridge-uclass.c  | 2 ++
>  drivers/video/display-uclass.c              | 2 ++
>  drivers/video/dsi-host-uclass.c             | 2 ++
>  drivers/video/panel-uclass.c                | 2 ++
>  drivers/video/vidconsole-uclass.c           | 2 ++
>  drivers/video/video-uclass.c                | 2 ++
>  drivers/video/video_osd-uclass.c            | 2 ++
>  drivers/virtio/virtio-uclass.c              | 2 ++
>  drivers/w1-eeprom/w1-eeprom-uclass.c        | 2 ++
>  drivers/w1/w1-uclass.c                      | 2 ++
>  drivers/watchdog/wdt-uclass.c               | 2 ++
>  drivers/xen/pvblock.c                       | 3 +++
>  77 files changed, 157 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
