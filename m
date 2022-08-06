Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE658B753
	for <lists+uboot-stm32@lfdr.de>; Sat,  6 Aug 2022 19:45:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72AD8C035BE;
	Sat,  6 Aug 2022 17:45:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AEE7C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 17:45:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 r64-20020a1c4443000000b003a5360f218fso449744wma.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 06 Aug 2022 10:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEnS52gy20Sn2v+3LwdsUPwbaNl26A8EWOL4eAllgZw=;
 b=iRPXxxQEvRu+Ldyek0kCEXiC8C1gIB9YIUqq8KgfouSRhWo9jRinj0S6Jpv27zsUdr
 C57wDjuKr7HPgCc/6vqY56WdO9DmlR3ukK7u+KrHa95J/ZAiYXbQGfflCjMcNoxbLG2G
 tMMQtY3ReqHm3ovcEQIIgXu0ksO4wtGBWSKETAXEZ0h5hw8goiMY+ltFs62Qg6YgYhbB
 +gXGOyRrAqze1yKpdSwFkSWzDgZF+Z4QwYJDCzSBhj7EIz162pQ3+vPJQ862T+CvOQp2
 4n4J9u9FmvkZwwQdsFdjpvOwxtom2a+0WjHiDEB5fEXEgintUeyzPC1qprNckvoXaCZo
 1+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEnS52gy20Sn2v+3LwdsUPwbaNl26A8EWOL4eAllgZw=;
 b=p9KMIVdDnLvx5oJbGEYNRfg6zmsc2UUllopaH89cgJmMXmxdNy0ga/TaDpoIefGonm
 PfN8Zy0IiB80iK+sUOtpSkbYn08+nyxNucG8F1ujvviy+84aAOb4wIdAGjoeJpnzExp+
 lS+4cbJfDiQ6xoq3D+7lpHddNIRC0s3y6qkAHYN9QHWTDxAKwv1wvf+yZK8nad0Q0GzP
 pLYVxo0kgk3xjFlvBNs1OFPM3M7+g/VxNzhRkJsZORsudh3haOLkwjtob9ea/I1zEKxL
 8n85FfgOLkuLYwEvv9JcWoUA7RBYe0PRqBsDoCEQ3m2u1yniMXr3FI5UM5uTxPmzm5rk
 NZSQ==
X-Gm-Message-State: ACgBeo3Z1T4loVENGV0GNicUjzoC/yT1gglPXwLR6woDZ/WtZxlJhCgH
 ppK4dopNvh5khAfXra4uxlzZWPk67wue/iv0cvA=
X-Google-Smtp-Source: AA6agR5cbpP90g8zcO3RIIjIJn21kcKu4iO6PYDMLi6o6HdQPTxOtFuMv+FjXMXfzoVqWXoPNw0h8H4CT7gQoHOf0OM=
X-Received: by 2002:a05:600c:2186:b0:3a5:eb9:593f with SMTP id
 e6-20020a05600c218600b003a50eb9593fmr8027916wme.203.1659807934802; Sat, 06
 Aug 2022 10:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220802085526.272953-1-patrice.chotard@foss.st.com>
In-Reply-To: <20220802085526.272953-1-patrice.chotard@foss.st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 6 Aug 2022 20:45:22 +0300
Message-ID: <CAGi-RUKvZ+dhrxiA16HYX=6R_+R_oYYuUHnaS6V4AO_8Z8NdBg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: Add
	eqos_get_enetaddr callback for tegra186
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
> index c1f2391d63..09d95e4bc3 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -1609,6 +1609,7 @@ static struct eqos_ops eqos_tegra186_ops = {
>         .eqos_calibrate_pads = eqos_calibrate_pads_tegra186,
>         .eqos_disable_calibration = eqos_disable_calibration_tegra186,
>         .eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_tegra186,
> +       .eqos_get_enetaddr = eqos_null_ops,
>         .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_tegra186
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
