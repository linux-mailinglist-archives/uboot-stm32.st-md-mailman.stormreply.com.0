Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD3354E34
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Apr 2021 10:01:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 848BBC5718B;
	Tue,  6 Apr 2021 08:01:38 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AE3FC56639
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 08:01:37 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id e14so20396532ejz.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Apr 2021 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HqThpxmDUVQRj7xaoRLNYLqgqwWPyOFug+aajKYqLbk=;
 b=x1aN0enzycvpMTNX/ua9lNNSrLIVf3Xk8mr3W8/Tal4wnO9zk0FkQYicL/kN6OlA9Z
 ZT37SPxJa+AHlarIw1sGGu9ODEILB6qPd+8aTQCT2JUQSVVEysLeBQ78BJZzAVBcSkoK
 9a8XC3u4IVn1fWOd4QsxAZB3CbvBaI47M6klk1ku1a/k9YPaM9VpB82UAPzuA4u8Z57u
 0RTno+mPbkgB1HhdrIe83bjl8IgQT07VDW5ALVwEU/M+rfhAfhC2XiQv8kHSGw9GHzgb
 C64GzR5SwNQT/pFdBOM2oV9E9DZ0KCtZCw5z8aBnph2HZLZq7lkrNt9DF5nBnmQo6CtK
 HFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HqThpxmDUVQRj7xaoRLNYLqgqwWPyOFug+aajKYqLbk=;
 b=qUI62tpXZGE0QSRPGcvx0Zr1zT9PMObZ6qIvMsFidDcvHraFTzIgfBUP3C5s2rOgJw
 93exb6SBBCW83mqc1sRISbuFniIksZ50ghlRwHXr7i9UufhfZ5vBvhsjc3dsScVvgWqk
 zneNir7lA6iexNygU0QX70BPtHODPq8XY3mqcbzev3nLO0wE4d3/ICxpxXCA3dDnLRU/
 Kq6/EJGupQtjIFL/1lHkVTP3nlvNuDsfmOafwREDIWZZjYLv/D78++VQ+VOJCvqlKx8W
 azmjCAo4ldbRC4P/GvwoCpnT+MU9bocPKI4Zj9nvAVcpfoozbvXLsBLsmVIRT13cTGOG
 ga1g==
X-Gm-Message-State: AOAM531gik9v2A5Cv9bB0BaN/5HKcksDZqA8bK+IpI4hbUYYGvUh/zRH
 NMfUO1/newR7VP1o9UW1AlNa9bMFSIdc9CNARkw7cw==
X-Google-Smtp-Source: ABdhPJyhLdvBOp92BNdzR/gP3x11042NsXSDQsXe2CMWKqvWlwG2rnNjfDEmYtDOHzEzc+iDOcdCES+WUNF4vjWw2dw=
X-Received: by 2002:a17:906:3544:: with SMTP id
 s4mr33221212eja.73.1617696097067; 
 Tue, 06 Apr 2021 01:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210406093755.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
In-Reply-To: <20210406093755.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 6 Apr 2021 10:01:25 +0200
Message-ID: <CAN5uoS8mxy6UUGH4L7ZYoHxDNjDYsBquygVRtAniVr1VU1zOFg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH] dm: core: Add address translation in
	fdt_get_resource
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

On Tue, 6 Apr 2021 at 09:38, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Today of_address_to_resource() is called only in
> ofnode_read_resource() for livetree support and
> fdt_get_resource() is called when livetree is not supported.
>
> The fdt_get_resource() doesn't do the address translation
> so when it is required, but the address translation is done
> by ofnode_read_resource() caller, for example in
> drivers/firmware/scmi/smt.c::scmi_dt_get_smt_buffer() {
> ...
>         ret = ofnode_read_resource(args.node, 0, &resource);
>         if (ret)
>                 return ret;
>
>         faddr = cpu_to_fdt32(resource.start);
>         paddr = ofnode_translate_address(args.node, &faddr);
> ...
>
> The both behavior should be aligned and the address translation
> must be called in fdt_get_resource() and removed for each caller.
>
> Fixes: a44810123f9e ("dm: core: Add dev_read_resource() to read device resources")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>

Regards,
Etienne

>
> This patch allows to remove the workaround in smci/smt.c
> introduced by [1].
>
> But it impact with all user of
> - ofnode_read_resource
> - ofnode_read_resource_byname
> - dev_read_resource
> - dev_read_resource_byname
>
> After my first check, the only impacts are in drivers/net/mscc_eswitch
> => I remove the unnecessary translate after code review,
>    this patch need to be verify on real hardware
>
> I proposed to merge the workaround [1] as soon as possible to avoid issue
> on stm32mp1 platform and this patch can be merged when it will be acked
> by mscc_eswitch maintainers and other API users.
>
> [1] "scmi: translate the resource only when livetree is not activated"
>     http://patchwork.ozlabs.org/project/uboot/list/?series=236526&state=*
>
>
>  drivers/firmware/scmi/smt.c               | 12 +-----------
>  drivers/net/mscc_eswitch/jr2_switch.c     |  4 +---
>  drivers/net/mscc_eswitch/ocelot_switch.c  |  4 +---
>  drivers/net/mscc_eswitch/serval_switch.c  |  4 +---
>  drivers/net/mscc_eswitch/servalt_switch.c |  4 +---
>  lib/fdtdec.c                              |  6 +++++-
>  6 files changed, 10 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
> index f1915c0074..e60c2aebc8 100644
> --- a/drivers/firmware/scmi/smt.c
> +++ b/drivers/firmware/scmi/smt.c
> @@ -30,8 +30,6 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
>         int ret;
>         struct ofnode_phandle_args args;
>         struct resource resource;
> -       fdt32_t faddr;
> -       phys_addr_t paddr;
>
>         ret = dev_read_phandle_with_args(dev, "shmem", NULL, 0, 0, &args);
>         if (ret)
> @@ -41,21 +39,13 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
>         if (ret)
>                 return ret;
>
> -       /* TEMP workaround for ofnode_read_resource translation issue */
> -       if (of_live_active()) {
> -               paddr = resource.start;
> -       } else {
> -               faddr = cpu_to_fdt32(resource.start);
> -               paddr = ofnode_translate_address(args.node, &faddr);
> -       }
> -
>         smt->size = resource_size(&resource);
>         if (smt->size < sizeof(struct scmi_smt_header)) {
>                 dev_err(dev, "Shared memory buffer too small\n");
>                 return -EINVAL;
>         }
>
> -       smt->buf = devm_ioremap(dev, paddr, smt->size);
> +       smt->buf = devm_ioremap(dev, resource.start, smt->size);
>         if (!smt->buf)
>                 return -ENOMEM;
>
> diff --git a/drivers/net/mscc_eswitch/jr2_switch.c b/drivers/net/mscc_eswitch/jr2_switch.c
> index 128d7f21ce..bf3e9b56ec 100644
> --- a/drivers/net/mscc_eswitch/jr2_switch.c
> +++ b/drivers/net/mscc_eswitch/jr2_switch.c
> @@ -842,7 +842,6 @@ static int jr2_probe(struct udevice *dev)
>         int i;
>         int ret;
>         struct resource res;
> -       fdt32_t faddr;
>         phys_addr_t addr_base;
>         unsigned long addr_size;
>         ofnode eth_node, node, mdio_node;
> @@ -893,9 +892,8 @@ static int jr2_probe(struct udevice *dev)
>
>                 if (ofnode_read_resource(mdio_node, 0, &res))
>                         return -ENOMEM;
> -               faddr = cpu_to_fdt32(res.start);
>
> -               addr_base = ofnode_translate_address(mdio_node, &faddr);
> +               addr_base = res.start;
>                 addr_size = res.end - res.start;
>
>                 /* If the bus is new then create a new bus */
> diff --git a/drivers/net/mscc_eswitch/ocelot_switch.c b/drivers/net/mscc_eswitch/ocelot_switch.c
> index 19e725c6f9..d1d0a489ab 100644
> --- a/drivers/net/mscc_eswitch/ocelot_switch.c
> +++ b/drivers/net/mscc_eswitch/ocelot_switch.c
> @@ -530,7 +530,6 @@ static int ocelot_probe(struct udevice *dev)
>         struct ocelot_private *priv = dev_get_priv(dev);
>         int i, ret;
>         struct resource res;
> -       fdt32_t faddr;
>         phys_addr_t addr_base;
>         unsigned long addr_size;
>         ofnode eth_node, node, mdio_node;
> @@ -578,9 +577,8 @@ static int ocelot_probe(struct udevice *dev)
>
>                 if (ofnode_read_resource(mdio_node, 0, &res))
>                         return -ENOMEM;
> -               faddr = cpu_to_fdt32(res.start);
>
> -               addr_base = ofnode_translate_address(mdio_node, &faddr);
> +               addr_base = res.start;
>                 addr_size = res.end - res.start;
>
>                 /* If the bus is new then create a new bus */
> diff --git a/drivers/net/mscc_eswitch/serval_switch.c b/drivers/net/mscc_eswitch/serval_switch.c
> index 09ce33452d..c4b81f7529 100644
> --- a/drivers/net/mscc_eswitch/serval_switch.c
> +++ b/drivers/net/mscc_eswitch/serval_switch.c
> @@ -482,7 +482,6 @@ static int serval_probe(struct udevice *dev)
>         struct serval_private *priv = dev_get_priv(dev);
>         int i, ret;
>         struct resource res;
> -       fdt32_t faddr;
>         phys_addr_t addr_base;
>         unsigned long addr_size;
>         ofnode eth_node, node, mdio_node;
> @@ -533,9 +532,8 @@ static int serval_probe(struct udevice *dev)
>
>                 if (ofnode_read_resource(mdio_node, 0, &res))
>                         return -ENOMEM;
> -               faddr = cpu_to_fdt32(res.start);
>
> -               addr_base = ofnode_translate_address(mdio_node, &faddr);
> +               addr_base = res.start;
>                 addr_size = res.end - res.start;
>
>                 /* If the bus is new then create a new bus */
> diff --git a/drivers/net/mscc_eswitch/servalt_switch.c b/drivers/net/mscc_eswitch/servalt_switch.c
> index 4a4e9e4054..f114086ece 100644
> --- a/drivers/net/mscc_eswitch/servalt_switch.c
> +++ b/drivers/net/mscc_eswitch/servalt_switch.c
> @@ -412,7 +412,6 @@ static int servalt_probe(struct udevice *dev)
>         struct servalt_private *priv = dev_get_priv(dev);
>         int i;
>         struct resource res;
> -       fdt32_t faddr;
>         phys_addr_t addr_base;
>         unsigned long addr_size;
>         ofnode eth_node, node, mdio_node;
> @@ -461,9 +460,8 @@ static int servalt_probe(struct udevice *dev)
>
>                 if (ofnode_read_resource(mdio_node, 0, &res))
>                         return -ENOMEM;
> -               faddr = cpu_to_fdt32(res.start);
>
> -               addr_base = ofnode_translate_address(mdio_node, &faddr);
> +               addr_base = res.start;
>                 addr_size = res.end - res.start;
>
>                 /* If the bus is new then create a new bus */
> diff --git a/lib/fdtdec.c b/lib/fdtdec.c
> index 864589193b..4b097fb588 100644
> --- a/lib/fdtdec.c
> +++ b/lib/fdtdec.c
> @@ -942,7 +942,11 @@ int fdt_get_resource(const void *fdt, int node, const char *property,
>
>         while (ptr + na + ns <= end) {
>                 if (i == index) {
> -                       res->start = fdtdec_get_number(ptr, na);
> +                       if (CONFIG_IS_ENABLED(OF_TRANSLATE))
> +                               res->start = fdt_translate_address(fdt, node, ptr);
> +                       else
> +                               res->start = fdtdec_get_number(ptr, na);
> +
>                         res->end = res->start;
>                         res->end += fdtdec_get_number(&ptr[na], ns) - 1;
>                         return 0;
> --
> 2.17.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
