Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D593BAEC0
	for <lists+uboot-stm32@lfdr.de>; Sun,  4 Jul 2021 22:15:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2566AC5718D;
	Sun,  4 Jul 2021 20:15:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A9D9C424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Jul 2021 20:15:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t15so16060746wry.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Jul 2021 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=m4gy1C2KgHsJShc1/U221gvs3pecUq38ULGfdeqomNw=;
 b=BT8tFEFXJPAeBdzoV+w+3pUa1qHRlH3Wol6vXnwOnav5yT0BduZutbAPoMNfX0sKy7
 8fQzblIkp8UH41r7fDskwW8jtC3IeMJEq1WIo3/0t/PaX80tOH4Yqi/T43uiQTkSt6UT
 2kw69wj+3OGH+5alssQOsk0dZjNIyNzCYSKNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=m4gy1C2KgHsJShc1/U221gvs3pecUq38ULGfdeqomNw=;
 b=aO2FWj5ZIpOJ1C3rSg6cu+S4u+A9OsyQeTafvPInnTzgd7ODqgcUw69hJyjma4loRe
 O0JjkgKuWGyitFf3lRPHMv53z6VfzPRxBNFl2JLTezLvNozJg7T/OZornv1DHPaV8MiW
 3rva8jAG24QIBieMT+99MAtyKS+GCks8KLTxe2zNhT0vsfRjLx2jqPkYCJFh+kAtqPUG
 mY9YTY/pe9ZcJRuYhWG5e3NFxCq0jUHF6nA0VfRK+/OQ6xe8QkhJu1IYWW4ngdvWo80x
 HdZDi27RPjAlSfohLoz8lJsxI505eYHyOfQUL0neZfGqdqFCI0jHMk8pZRrhGfpGxdeM
 P77Q==
X-Gm-Message-State: AOAM533765vAikZxqqem2sr4qw2KB2/vlmBremHJHph8FpFPbt2OjGAl
 rTXyEzC9bjrt6agDdOgwiVAVc9wfhsAg4Lj8VlfeSw==
X-Google-Smtp-Source: ABdhPJwtOGa9YRz4QJzCf1M4LDdbHoP+FU1OpLcTY3vJWhXdJ6y2tJTcZOUXiRps5I5lUmTXVF34++eBdSkdyQn9PBo=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr12327311wri.66.1625429734067; 
 Sun, 04 Jul 2021 13:15:34 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 4 Jul 2021 13:15:32 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ19RN3gp99D=G22cLPMebh3qMZi7DwaRirckFX1TM1ZMA@mail.gmail.com>
References: <CAPnjgZ19RN3gp99D=G22cLPMebh3qMZi7DwaRirckFX1TM1ZMA@mail.gmail.com>
 <20210427110153.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
Date: Sun, 4 Jul 2021 13:15:32 -0700
X-Google-Sender-Auth: sgjq6wogHNme8mOIC-FkMivJHNk
Message-ID: <CAPnjgZ1+b9sb1An5uEFengkhGdey+tcRw3mwG0z-JyN9Tf4kNw@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
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

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
