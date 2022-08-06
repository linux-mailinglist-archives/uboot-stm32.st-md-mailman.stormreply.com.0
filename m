Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30BC58B752
	for <lists+uboot-stm32@lfdr.de>; Sat,  6 Aug 2022 19:45:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A037C035BE;
	Sat,  6 Aug 2022 17:45:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE18EC035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 17:45:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z16so6405600wrh.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 06 Aug 2022 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bkle/bbVg/P9DGJKleHsNQQo80z8KdSgB0rdqER8zvI=;
 b=kjJL/loOY6uaD7bo/FUaGk4UIlOyDwGdpPkQhANp1gLE08u5Aajkk4O0I1CiCcxpwT
 RFkmVcSxxi30QkMqCOAH7r0GrM33DA18B30UftvoTVodaEJu5U7SK4dAV3RabhecJ3BL
 OObLmPIs6M0Y3SmuRwQj9/SOyCgk9g4Cnd4ZjUncFuQcRrWweqUt2ekF/PcHDB+Kw4YA
 0q6Nuk36Fnw/6HWPHhiR9JAKATvqbV1uXYpcTzYs4JQp0Gsp3LcHUvHSo2M/+i2NZ2P3
 1yUJRVTArMCqkGk/wsgZD0D6FcAfb/YuspxwFoUkDMI4hPKJfPTIqPIQIJCP9nB0ETnB
 xdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bkle/bbVg/P9DGJKleHsNQQo80z8KdSgB0rdqER8zvI=;
 b=0miUGtdjPLBNjG9AwVBMy6hlfppC2JRR8p2o9D2xpqUo9tsCh0NlTcB9ehX4Q9a654
 WwXrP9nJN7wO38O3dsz/s81k6lxuz1kRJ1e9psklGngsWVfu7hU53QaHpe9J3IvcYhn5
 6KO7Lb9hqFABvFXwcNC0hXiZ8Bw975/bhceoBfO4CD/GJvjdEBEkVLgAOpKPMuKvqec0
 U35yOOI2hXzSlVGlgnQgxfKNKkCNZwn/1PKq7Crmu0bqVH7/JW/Z+76jvkO4dSqWD6qZ
 dvS4U5gnxVcVNkttMkxSN3VAi9sFlo2dpSSPf97HGdTnmmC+LXMGRho7RsT8gcKWIXNW
 /uaQ==
X-Gm-Message-State: ACgBeo3qFhvuEWqJvDdUgAp59yRoZbSbSVsLD6UA5IjocAOqv2iRe4Va
 O5kShEnwEaeEn945Uq7Bcn8J+WuIjifauD8Qbzs=
X-Google-Smtp-Source: AA6agR6ks4z9l4KLOCu+24DXsrlkTTtrzAfZubK/va6WMpDvuswpQ6FtJ3nicxU+blx6pBxDYmEgeZBsymuMSisf2II=
X-Received: by 2002:a5d:60d0:0:b0:220:4e23:9934 with SMTP id
 x16-20020a5d60d0000000b002204e239934mr7308198wrt.474.1659807914305; Sat, 06
 Aug 2022 10:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220802085526.272953-1-patrice.chotard@foss.st.com>
 <20220802085526.272953-2-patrice.chotard@foss.st.com>
In-Reply-To: <20220802085526.272953-2-patrice.chotard@foss.st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 6 Aug 2022 20:45:02 +0300
Message-ID: <CAGi-RUKjbdhHqFMLu3+Wqtma+ghptxhHDYFUq5CDX9dUtp4F-w@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: Add
	eqos_get_enetaddr callback for stm32
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

On Tue, Aug 2, 2022 at 11:56 AM Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Add .eqos_get_enetaddr callback defined as eqos_null_ops() to avoid
> illegal access.
>
> Fixes: a624251461bf ("net: dwc_eth_qos: introduce eqos hook eqos_get_enetaddr")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>  drivers/net/dwc_eth_qos.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 09d95e4bc3..5b2e7cba14 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -1638,6 +1638,7 @@ static struct eqos_ops eqos_stm32_ops = {
>         .eqos_calibrate_pads = eqos_null_ops,
>         .eqos_disable_calibration = eqos_null_ops,
>         .eqos_set_tx_clk_speed = eqos_null_ops,
> +       .eqos_get_enetaddr = eqos_null_ops,
>         .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
>  };
>
> --
> 2.25.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
