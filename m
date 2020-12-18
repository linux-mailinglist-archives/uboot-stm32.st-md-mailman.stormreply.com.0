Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CA2DDD41
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Dec 2020 04:24:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2B5DC36B36;
	Fri, 18 Dec 2020 03:24:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F9CAC36B35
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 03:24:41 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id i9so577026wrc.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Dec 2020 19:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BgLjBQjwSwiGApStk+zd1YY0iJTB/WiKkop/vVBoVCA=;
 b=BSXGfB5QZnJ4BMKt5srzzHdFRYs0BWjVG5BPFFGd9FcyhlBdUQP/i1fFA1yZFnQLB8
 O2P9gNbJ++04mhw2QpaLNUqnFxO11DjHH/IrZLEcLxSnmQiYQTcX8cFWi3eGU/SEV65s
 d2/n9ZbFPcRAwg8y/mS2lH99rNEDTlxqeIDas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BgLjBQjwSwiGApStk+zd1YY0iJTB/WiKkop/vVBoVCA=;
 b=e720zUIwRmQNauBpjzHNOki7YrPJlWjFgi6cKg0KrOOKK5Myn5scTEiCIozEcqhTEh
 4SF99Ew8fssF4CP8C3aRXshb/88whZrK2DqhLVCKuMe06UpAxSlqRFQM95dNUC9BIv1B
 a96KuxxNn6yUMipfhfzGi1fS8hKE5nrpCoy2lvWwMWja0394fnE7qhjcj6kk2gF/g2Ao
 XODqW7+sg4TUe8I0gE0nuTu4fQFI7B1QIoqQfydt9uTmQf/3XgdVQCncfEr2QZa8vWaL
 CXwZzvygdRRlD3p9fzCeg/53dvLINuVfNhOj9/j1PdJinDmzycX2CsTviizyOQgxPGfT
 bEmg==
X-Gm-Message-State: AOAM531Bq2jB428IR5XK4derbYNbURr1nq1Z4dpdWEsTwq+oScL0gvf4
 KAFJup1vuErPR4iSXChLP97PlETvvZO0z1wjbpQ/1g==
X-Google-Smtp-Source: ABdhPJxLP6DyyAYQX4UE7xU9X+12yVvFRYli3ReawRstLrVRWVPYw24VMENpra5y3pTmJgcFBd576btwiSKaBzV/Iao=
X-Received: by 2002:adf:8503:: with SMTP id 3mr1954457wrh.56.1608261880581;
 Thu, 17 Dec 2020 19:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20201216152506.119900-1-sjg@chromium.org>
 <20201216082429.16.I5196895f8bbae1068965f8e3b6db19b2bb56e908@changeid>
 <20201217151547.67fwvdsqb2vj2qol@ti.com>
In-Reply-To: <20201217151547.67fwvdsqb2vj2qol@ti.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 17 Dec 2020 20:24:27 -0700
Message-ID: <CAPnjgZ1gEiGEhhho6MDHv9OXEmvjoyGhV7GiEdCd0TEKADq5JQ@mail.gmail.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Marek Vasut <marex@denx.de>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Suneel Garapati <sgarapati@marvell.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Martin Fuzzey <martin.fuzzey@flowbird.group>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Heiko Schocher <hs@denx.de>,
 Stefan Roese <sr@denx.de>, Icenowy Zheng <icenowy@aosc.io>,
 Ye Li <ye.li@nxp.com>, "Park, Aiden" <aiden.park@intel.com>,
 u-boot-amlogic@groups.io, Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Anji J <anji.jagarlmudi@nxp.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Angelo Durgehello <angelo.dureghello@timesys.com>,
 Walter Lozano <walter.lozano@collabora.com>,
 Robert Beckett <bob.beckett@collabora.com>, Michal Simek <monstr@monstr.eu>,
 Anatolij Gustschin <agust@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Thor Thayer <thor.thayer@linux.intel.com>,
 =?UTF-8?Q?Patrik_Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
 Patrice Chotard <patrice.chotard@st.com>, Michael Walle <michael@walle.cc>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Mario Six <mario.six@gdsys.cc>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Pragnesh Patel <Pragnesh.patel@sifive.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [Uboot-stm32] [PATCH 16/18] dm: Use access methods for
	dev/uclass private data
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

Hi Pratyush,


On Thu, 17 Dec 2020 at 08:19, Pratyush Yadav <p.yadav@ti.com> wrote:
>
> [Dropping Jean-Jacques Hiblot because his email will bounce anyway.]
>
> Hi Simon,
>
> On 16/12/20 08:25AM, Simon Glass wrote:
> > Most drivers use these access methods but a few do not. Update them.
> >
> > In some cases the access is not permitted, so mark those with a FIXME tag
> > for the maintainer to check.
>
> Your series does not apply cleanly on the tip of u-boot master
> (a439136599 as of writing this). Is this dependent on some other series
> or branch?

It's actually on top of -next

But see u-boot-dm/acc-working for the tree.

>
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> [...]
> > diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
> > index b9868505a3b..00e0282dcc0 100644
> > --- a/drivers/mux/mmio.c
> > +++ b/drivers/mux/mmio.c
> > @@ -12,6 +12,7 @@
> >  #include <regmap.h>
> >  #include <syscon.h>
> >  #include <dm/device.h>
> > +#include <dm/device-internal.h>
> >  #include <dm/device_compat.h>
> >  #include <dm/read.h>
> >  #include <dm/devres.h>
> > @@ -68,7 +69,7 @@ static int mmio_mux_probe(struct udevice *dev)
> >       fields = devm_kmalloc(dev, num_fields * sizeof(*fields), __GFP_ZERO);
> >       if (!fields)
> >               return -ENOMEM;
> > -     dev->priv = fields;
> > +     dev_set_priv(dev, fields);
>
> Ok.
>
> >
> >       mux_reg_masks = devm_kmalloc(dev, num_fields * 2 * sizeof(u32),
> >                                    __GFP_ZERO);
> [...]
> > diff --git a/drivers/spi/cadence_qspi.c b/drivers/spi/cadence_qspi.c
> > index b746501f5ff..67980431ba0 100644
> > --- a/drivers/spi/cadence_qspi.c
> > +++ b/drivers/spi/cadence_qspi.c
> > @@ -27,7 +27,7 @@
> >
> >  static int cadence_spi_write_speed(struct udevice *bus, uint hz)
> >  {
> > -     struct cadence_spi_plat *plat = bus->plat;
> > +     struct cadence_spi_plat *plat = dev_get_plat(bus);
>
> I am confused. Grepping on the current tip of master (a439136599), I see
> no hits for dev_get_plat(). Your series does not introduce it either.
> Patch 18/18 changes it but I don't see it being added anywhere. What am
> I missing?

The dev_get_platdata() was renamed in a previous series to dev_get_plat().

>
> >       struct cadence_spi_priv *priv = dev_get_priv(bus);
> >
> >       cadence_qspi_apb_config_baudrate_div(priv->regbase,
> > @@ -130,7 +130,7 @@ static int spi_calibration(struct udevice *bus, uint hz)
> >
> >  static int cadence_spi_set_speed(struct udevice *bus, uint hz)
> >  {
> > -     struct cadence_spi_plat *plat = bus->plat;
> > +     struct cadence_spi_plat *plat = dev_get_plat(bus);
> >       struct cadence_spi_priv *priv = dev_get_priv(bus);
> >       int err;
> >
> > @@ -165,7 +165,7 @@ static int cadence_spi_set_speed(struct udevice *bus, uint hz)
> >
> >  static int cadence_spi_probe(struct udevice *bus)
> >  {
> > -     struct cadence_spi_plat *plat = bus->plat;
> > +     struct cadence_spi_plat *plat = dev_get_plat(bus);
> >       struct cadence_spi_priv *priv = dev_get_priv(bus);
> >       struct clk clk;
> >       int ret;
> > @@ -212,7 +212,7 @@ static int cadence_spi_remove(struct udevice *dev)
> >
> >  static int cadence_spi_set_mode(struct udevice *bus, uint mode)
> >  {
> > -     struct cadence_spi_plat *plat = bus->plat;
> > +     struct cadence_spi_plat *plat = dev_get_plat(bus);
> >       struct cadence_spi_priv *priv = dev_get_priv(bus);
> >
> >       /* Disable QSPI */
> > @@ -235,7 +235,7 @@ static int cadence_spi_mem_exec_op(struct spi_slave *spi,
> >                                  const struct spi_mem_op *op)
> >  {
> >       struct udevice *bus = spi->dev->parent;
> > -     struct cadence_spi_plat *plat = bus->plat;
> > +     struct cadence_spi_plat *plat = dev_get_plat(bus);
> >       struct cadence_spi_priv *priv = dev_get_priv(bus);
> >       void *base = priv->regbase;
> >       int err = 0;
> > @@ -284,7 +284,7 @@ static int cadence_spi_mem_exec_op(struct spi_slave *spi,
> >
> >  static int cadence_spi_of_to_plat(struct udevice *bus)
> >  {
> > -     struct cadence_spi_plat *plat = bus->plat;
> > +     struct cadence_spi_plat *plat = dev_get_plat(bus);
> >       ofnode subnode;
> >
> >       plat->regbase = (void *)devfdt_get_addr_index(bus, 0);
>
> Anyway, assuming dev_get_plat() looks like:
>
>   void *dev_get_plat(const struct udevice *dev) {
>         return dev->plat;
>   }
>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
>
> for drivers/{mux/mmio.c,spi/cadence_qspi.c}.

Thanks for looking at this.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
