Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C78812F7
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Aug 2019 09:19:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60E99C35E03
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Aug 2019 07:19:07 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 878F1C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Aug 2019 21:00:18 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id z23so53300722ote.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Aug 2019 14:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlvueoRiOrkr20E1XH3VXJ+VNiXAxkaTL13EQbfTzJc=;
 b=p4p1JwZKDXD+jiY91GYkzxqdQnNDpZ+CyQ+RoNdlgk7FiGyKByx2lNp7QsxuBvFsnT
 zINqEfeSpDeGi6KArHMttxbcC4QxwIkY4szdgyvuV024mEJ7SYm2JSv9Gpknu+51ZOnN
 jlV9stxNWFyiNlc27sN143/AfkPrdRR5reDDDO7rGr7234h7Wg1OdNmLsAnz+96LBvaN
 hdeAASQMjKdEe4WSEg869VPbOt77+Lt2j8BU4oHamBexVCW/37bhos3EnH4Mp0ZRXnQx
 YMpaHQTv0Rd2OPTljwZyF1JFyE5wpOclbQtdhs1LCMxhZsvf3twm0GwZu3gwSl+7JkDM
 Vtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlvueoRiOrkr20E1XH3VXJ+VNiXAxkaTL13EQbfTzJc=;
 b=jEyz2/0k0rUOwFbEVsIXTM+risN1ghd7YGFhEQIazdH70PmJNgsG8PN9tLOzwxYOND
 8XJwPh7haNqlZgNCQGTCEXharyNm6x/PhOUFvSMrIM+LWlt8hReDebi5vtkSGVKu2BAu
 G+5yIrgN6kpqhamAzw7ocYViIzEEHNwQN1rNKQyz23CMaQjlz55Njn9TtdaypWpJh+tb
 MU++gn6y7guMcHwBU0YH1SgJgjVVDaOkpQRf6RuobS5mWA6nTh1eMfnbrYVRjxngDN3n
 KwA52XBUE8fz/FBcqnncmeBiQWUhobpfnz+6oqMqK2d3ZeczxPldai3TJlO412ILKHXA
 mH9A==
X-Gm-Message-State: APjAAAVbi3oCytmGYhn/ftZo2B+q0QI1O4rezNHGGaQEwQ6D/SEp4MMT
 NYiDWVRH+SFFO51kvea3lUzMJrYvgpzXkJSGgsI=
X-Google-Smtp-Source: APXvYqx5b4EtYf9IeA4EzRUOpFXtRckbr7mcansW4SXYe0Txq7CA1iLKn+TGYV61TZAhLL7x1M80kriDTlIHRqrfviU=
X-Received: by 2002:a9d:7d90:: with SMTP id j16mr35338171otn.95.1564866016832; 
 Sat, 03 Aug 2019 14:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sun, 4 Aug 2019 00:00:06 +0300
Message-ID: <CAGi-RU+B6Nh6wonbyzxL5dVmZA7PHr1_a=fBN+9vC208GOE7YQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:19:06 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 1/2] net: dwc_eth_qos: Change
 eqos_ops function to static
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

On Thu, Aug 1, 2019 at 12:31 PM Patrick Delaunay
<patrick.delaunay@st.com> wrote:
>
> This patch solves many warnings when compiling with W=1:
> warning: no previous prototype for '....' [-Wmissing-prototypes]
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/net/dwc_eth_qos.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 07b3667..6df9956 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -621,7 +621,7 @@ err:
>         return ret;
>  }
>
> -void eqos_stop_clks_tegra186(struct udevice *dev)
> +static void eqos_stop_clks_tegra186(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
>
> @@ -636,7 +636,7 @@ void eqos_stop_clks_tegra186(struct udevice *dev)
>         debug("%s: OK\n", __func__);
>  }
>
> -void eqos_stop_clks_stm32(struct udevice *dev)
> +static void eqos_stop_clks_stm32(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
>
> @@ -1290,7 +1290,7 @@ err:
>         return ret;
>  }
>
> -void eqos_stop(struct udevice *dev)
> +static void eqos_stop(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         int i;
> @@ -1344,7 +1344,7 @@ void eqos_stop(struct udevice *dev)
>         debug("%s: OK\n", __func__);
>  }
>
> -int eqos_send(struct udevice *dev, void *packet, int length)
> +static int eqos_send(struct udevice *dev, void *packet, int length)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         struct eqos_desc *tx_desc;
> @@ -1385,7 +1385,7 @@ int eqos_send(struct udevice *dev, void *packet, int length)
>         return -ETIMEDOUT;
>  }
>
> -int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
> +static int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         struct eqos_desc *rx_desc;
> @@ -1409,7 +1409,7 @@ int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
>         return length;
>  }
>
> -int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
> +static int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         uchar *packet_expected;
> --
> 2.7.4
>
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> https://lists.denx.de/listinfo/u-boot
Reviewed-By: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
