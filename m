Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D7E94CE
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE29DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:21 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FD73C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:20 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id n16so632903oig.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3uUAg/dLVNVrY6ZhUEoPive+/hOSqVdCoWb54awckPw=;
 b=PlTpSKulr8f40uOWxrUMxGiLqjTCBbNGIDJPJi8TiEt48qsxEyByzI/hubLdFuQHyQ
 AdoKqeu2kQmbOLBuwVkEMHaxa7Cyx+BN2j2IAKScjMorYdvroPa7Lr1V4POQUAgcJJWh
 KiOy8g7l5nWNxOHQ3xl+/EBrlnwJp+JWs9e3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3uUAg/dLVNVrY6ZhUEoPive+/hOSqVdCoWb54awckPw=;
 b=Pazpj0JnWYI7EC4sX2+geIN3Eo5VFUv2YaRfFSF2vPmWChPMxgmQrjGnRvWceB9jio
 +z+OlnoLuTUASVW7NsDufV5vKDeGaOwp+sZZDETTGr7QTIcisvr6tjtA8KOVlJg6oMER
 qQQZXhu6XY1v1JKWcm6mSz9HyQAgtcas0Cj0rOhvbiAzDIfOnhEOSV9eGj9FaRCmyVSh
 q+o1j/sUJf94Xx/qKY7jCUMsqu/tC7WAXWkH6Hi3oXiVkcwZNO2TDESIWGUZHAo/IvZL
 PWLJVb5HNsGHRXrcq26jCwRjQAbf1tEWOrzH+fctZKTghVYJ3DN5vXaQ+il4WYfzHv2v
 SUQQ==
X-Gm-Message-State: APjAAAWC0g4JjMnL++Gefk/44A/ueE3gPkW5FNTv1bxzaNTpWvs4AlnL
 r7be4s47+OxH69FkH0xT5DGKf7FQYQZKgNc5vXSR855r
X-Google-Smtp-Source: APXvYqzvKCUmJV7FN0h0QXF5MaFrhNhHcpB2EU15Ec3Q7kn7j7PrKsjq/xB3PtcO3jhFXzV6X83/Yl/l/SxvKGaIFjE=
X-Received: by 2002:aca:3a41:: with SMTP id h62mr3049609oia.97.1572400097584; 
 Tue, 29 Oct 2019 18:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-3-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:05 -0600
Message-ID: <CAPnjgZ1GMK9p0Fd3TMoPmA+ra1u7uvaL5AN-Y0rO6B3vXEpd-w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 02/13] dm: pinctrl: convert pinctrl-single
	to livetree
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

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Convert 'pinctrl-single' using livetree functions
> - ofnode_get_property
> - ofnode_read_u32_default
> - ofnode_read_u32_array
> - ofnode_read_bool
> - dev_read_addr
> and get rid of DECLARE_GLOBAL_DATA_PTR.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-single.c | 33 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 1dfc97dcea..67429d6995 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -9,8 +9,6 @@
>  #include <linux/libfdt.h>
>  #include <asm/io.h>
>
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  struct single_pdata {
>         fdt_addr_t base;        /* first configuration register */
>         int offset;             /* index of last configuration register */
> @@ -117,13 +115,12 @@ static int single_configure_bits(struct udevice *dev,
>  static int single_set_state(struct udevice *dev,
>                             struct udevice *config)
>  {
> -       const void *fdt = gd->fdt_blob;
>         const struct single_fdt_pin_cfg *prop;
>         const struct single_fdt_bits_cfg *prop_bits;
>         int len;
>
> -       prop = fdt_getprop(fdt, dev_of_offset(config), "pinctrl-single,pins",
> -                          &len);
> +       prop = ofnode_get_property(dev_ofnode(dev), "pinctrl-single,pins",
> +                                  &len);

dev_read_prop()

Similarly below

>
>         if (prop) {
>                 dev_dbg(dev, "configuring pins for %s\n", config->name);
> @@ -136,9 +133,9 @@ static int single_set_state(struct udevice *dev,
>         }
>
>         /* pinctrl-single,pins not found so check for pinctrl-single,bits */
> -       prop_bits = fdt_getprop(fdt, dev_of_offset(config),
> -                               "pinctrl-single,bits",
> -                                   &len);
> +       prop_bits = ofnode_get_property(dev_ofnode(dev),
> +                                       "pinctrl-single,bits",
> +                                       &len);
>         if (prop_bits) {
>                 dev_dbg(dev, "configuring pins for %s\n", config->name);
>                 if (len % sizeof(struct single_fdt_bits_cfg)) {
> @@ -160,27 +157,27 @@ static int single_ofdata_to_platdata(struct udevice *dev)
>         int res;
>         struct single_pdata *pdata = dev->platdata;
>
> -       pdata->width = fdtdec_get_int(gd->fdt_blob, dev_of_offset(dev),
> -                                     "pinctrl-single,register-width", 0);
> +       pdata->width = ofnode_read_u32_default(dev_ofnode(dev),
> +                                              "pinctrl-single,register-width",
> +                                              0);
>
> -       res = fdtdec_get_int_array(gd->fdt_blob, dev_of_offset(dev),
> -                                  "reg", of_reg, 2);
> +       res = ofnode_read_u32_array(dev_ofnode(dev), "reg", of_reg, 2);
>         if (res)
>                 return res;
>         pdata->offset = of_reg[1] - pdata->width / 8;
>
> -       addr = devfdt_get_addr(dev);
> +       addr = dev_read_addr(dev);
>         if (addr == FDT_ADDR_T_NONE) {
>                 dev_dbg(dev, "no valid base register address\n");
>                 return -EINVAL;
>         }
>         pdata->base = addr;
>
> -       pdata->mask = fdtdec_get_int(gd->fdt_blob, dev_of_offset(dev),
> -                                    "pinctrl-single,function-mask",
> -                                    0xffffffff);
> -       pdata->bits_per_mux = fdtdec_get_bool(gd->fdt_blob, dev_of_offset(dev),
> -                                             "pinctrl-single,bit-per-mux");
> +       pdata->mask = ofnode_read_u32_default(dev_ofnode(dev),
> +                                             "pinctrl-single,function-mask",
> +                                             0xffffffff);
> +       pdata->bits_per_mux = ofnode_read_bool(dev_ofnode(dev),
> +                                              "pinctrl-single,bit-per-mux");
>
>         return 0;
>  }
> --
> 2.17.1

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
