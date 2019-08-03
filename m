Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A9812F6
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Aug 2019 09:19:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69574C35E05
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Aug 2019 07:19:07 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F078CC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Aug 2019 21:08:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id x21so16154531otq.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Aug 2019 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=di3cBJuX80DceX+s6OcONfLi8UQZswlw8/DBsWk7oYA=;
 b=fgGYAFUarFZgBvFPg2UJ9F0skC4EfcjE0lxiXuRNevNg7a0HGeYOn/oZ12XZHmylQt
 oFHpDJbBGUvdRIz0/ih2i1L6yOwKe06cpUnjTeuwwFdwtwAxtE3QUroM3S5L2RmKnUQa
 QkRWy8J7E9+ouCuFjAl3xASLEofElhZqtz4VRFgDiYHb3+BjmFKO7L2QjMJc5Wpqp+cr
 GAE77jrgA/Ydz7px8HPKxwP8KxjnHvUbvwhQvSo4dCmY63N6N7ywRgmRORBqNfXXR+UP
 sNBlnIjFD1gqVxlpty40+khnGGwpLiFigCeNbaNizlhWwsYWqdzSf7ZMkrt58DySQCuG
 bSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=di3cBJuX80DceX+s6OcONfLi8UQZswlw8/DBsWk7oYA=;
 b=kQySfuAsf1WRX6imhucwidVPowfq10a26xBchPWF1eHrjL9jLCy4pKYa+DD/ZE8zv/
 AT0ee1A/D3u/Q4JkYOwMfTJoXEACKXBbstV2smGZNwQcPqJ3MC1qfNaDFeJ63owOk8mp
 kSDTUS9mlNeCTxYJeAn1RUVXOvYidSm2c6ZncJ8Karp9bbcap9IB7nmUWGKi5pDVYSeK
 q190T0nA3DTW4iTY40c6vFMA43WQb7HXyJqRkru2AIcw/oJzdCkMEvktLmjsTYjNH6En
 Vx5GsPXdH46iVwXbb32rtYYq1hO2BeNf7U7DuHh4Rzhjxgy4heIkefzq0i6wOzNBaWWE
 DN3A==
X-Gm-Message-State: APjAAAWcUq8RNNL6EkQV9/JEi3s3yA6hWBT7Vu46Lye10NMJ9OqMPbPM
 EFubUcLmpqPqLmuAhJcoHJ6d00c6RfAhUCLgZtU=
X-Google-Smtp-Source: APXvYqwqAQfoE3KFQaRj+kJG+L08vMzw20pczftdmcUQU8UmQM3VLRdBbMiCBJpII0zPR4jsCR/j/Lr8us4IALbPiHk=
X-Received: by 2002:a05:6830:160c:: with SMTP id
 g12mr53086329otr.231.1564866494189; 
 Sat, 03 Aug 2019 14:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
 <1564651743-28430-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564651743-28430-2-git-send-email-patrick.delaunay@st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sun, 4 Aug 2019 00:08:03 +0300
Message-ID: <CAGi-RU+L_7DtGL9o2mM+8GE5EHayxOKQcQW+Yyz7Gjfd5Lho1g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:19:06 +0000
Cc: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: dwc_et_qos: update weak function
	board_interface_eth_init
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

On Thu, Aug 1, 2019 at 12:32 PM Patrick Delaunay
<patrick.delaunay@st.com> wrote:
>
> Align the board and driver prototype for board_interface_eth_init
> to avoid execution issue (the interface_type parameter is defined
> as int or phy_interface_t).
>
> To have a generic weak function (it should be reused by other driver)
> I change the prototype to use directly udevice.
>
> This prototype is added in netdev.h to allow compilation check
> and avoid warning when compiling with W=1 on file
> board/st/stm32mp1/stm32mp1.c
>
> warning: no previous prototype for 'board_interface_eth_init'\
> [-Wmissing-prototypes]
>      int board_interface_eth_init(int interface_type, ....
>          ^~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 17 +++++++++++++----
>  drivers/net/dwc_eth_qos.c    | 16 +++-------------
>  include/netdev.h             |  3 +++
>  3 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index b99c6c0..2365dd1 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -16,6 +16,7 @@
>  #include <misc.h>
>  #include <mtd.h>
>  #include <mtd_node.h>
> +#include <netdev.h>
>  #include <phy.h>
>  #include <reset.h>
>  #include <syscon.h>
> @@ -560,13 +561,21 @@ void board_quiesce_devices(void)
>         setup_led(LEDST_OFF);
>  }
>
> -/* board interface eth init */
> -/* this is a weak define that we are overriding */
> -int board_interface_eth_init(phy_interface_t interface_type,
> -                            bool eth_clk_sel_reg, bool eth_ref_clk_sel_reg)
> +/* eth init function : weak called in eqos driver */
> +int board_interface_eth_init(struct udevice *dev,
> +                            phy_interface_t interface_type)
>  {
>         u8 *syscfg;
>         u32 value;
> +       bool eth_clk_sel_reg = false;
> +       bool eth_ref_clk_sel_reg = false;
> +
> +       /* Gigabit Ethernet 125MHz clock selection. */
> +       eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
> +
> +       /* Ethernet 50Mhz RMII clock selection */
> +       eth_ref_clk_sel_reg =
> +               dev_read_bool(dev, "st,eth_ref_clk_sel");
>
>         syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 6df9956..4557093 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -1591,8 +1591,8 @@ err_free_reset_eqos:
>  }
>
>  /* board-specific Ethernet Interface initializations. */
> -__weak int board_interface_eth_init(int interface_type, bool eth_clk_sel_reg,
> -                                   bool eth_ref_clk_sel_reg)
> +__weak int board_interface_eth_init(struct udevice *dev,
> +                                   phy_interface_t interface_type)
>  {
>         return 0;
>  }
> @@ -1602,8 +1602,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         int ret;
>         phy_interface_t interface;
> -       bool eth_clk_sel_reg = false;
> -       bool eth_ref_clk_sel_reg = false;
>
>         debug("%s(dev=%p):\n", __func__, dev);
>
> @@ -1614,15 +1612,7 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>                 return -EINVAL;
>         }
>
> -       /* Gigabit Ethernet 125MHz clock selection. */
> -       eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
> -
> -       /* Ethernet 50Mhz RMII clock selection */
> -       eth_ref_clk_sel_reg =
> -               dev_read_bool(dev, "st,eth_ref_clk_sel");
> -
> -       ret = board_interface_eth_init(interface, eth_clk_sel_reg,
> -                                      eth_ref_clk_sel_reg);
> +       ret = board_interface_eth_init(dev, interface);
>         if (ret)
>                 return -EINVAL;
>
> diff --git a/include/netdev.h b/include/netdev.h
> index a40c4ad..68a3fce 100644
> --- a/include/netdev.h
> +++ b/include/netdev.h
> @@ -10,6 +10,7 @@
>
>  #ifndef _NETDEV_H_
>  #define _NETDEV_H_
> +#include <phy_interface.h>
>
>  /*
>   * Board and CPU-specific initialization functions
> @@ -21,6 +22,8 @@
>   */
>
>  int board_eth_init(bd_t *bis);
> +int board_interface_eth_init(struct udevice *dev,
> +                            phy_interface_t interface_type);
>  int cpu_eth_init(bd_t *bis);
>
>  /* Driver initialization prototypes */
> --
> 2.7.4
>

why can you just write a phy driver specific to this board and hook it
to the eth
driver in the dts ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
