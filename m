Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFA2172D0
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 17:46:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BE49C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 15:46:38 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77570C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 15:46:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a6so45704857wrm.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qXnUwNbIlu+I0n4z/AJi3VJlT4mXZvOjmmKhQ/YmJvI=;
 b=nNnXfCYb2mtK/3FitETgW/ApbGDZWfHvfvxDV4LlnkIavSgRAwTwF9Ln49RCP1Vgb3
 D0b5sNwkUodJn0QZXV6RjSqOT2ZD+w16s5PH1OM+8uzrEt0aGnBY0zcQscCAGlYuL4Pv
 7SBRbugcZnc1iv9YeWqTS7tzpFiONA/SbXupSMs+GAMsDRmUm3Zj3YCAJkHVrRsIY86F
 pn5aQsxbjxcev/lDYAr9tvYT6uTzYuwXTnLd6liiCKwOubOn7xhPo5GFngK6MgMVWdN9
 W2njd5j/uxoITThq8EZYrkv0F9iY8gd52Q7gRioYarvQWELhAk3Lkr00dOz8BImZ6fjY
 fCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=qXnUwNbIlu+I0n4z/AJi3VJlT4mXZvOjmmKhQ/YmJvI=;
 b=VqkG2TSq37vsSTJloZtQZ7/FhT226RC8Vz0IPXV+spZ/w7X2tNTZP1ehawFbKHA4gM
 J3XDftgJGY1PyMMClSP/5SJZn/p9Kax01CkdzHGd1NLc8xCOHC8Twa0gwMeQUiqyVOIP
 o8rrEQuEH6W7+WnPg3pGneKRzQHuG30Y4/LVRR2NT0jDLhvsR8m3ZmTQVT+mRKQP5ESe
 NgvWYUJrdpsMPxrY7UJ4yn6dmbFDDyY/0RCX5vyqa3D8PNs0WQrIRXHdWzoXw0msTNrX
 jTBaHcH+gvbI0GjmDv3dYZLg3RBz5m9Vx9mzg+u8mEziP1XdesKDKpW0GGSBvBk4YxYm
 JngA==
X-Gm-Message-State: AOAM532Az4Cy/FmSqweskOncA0gd3bdJ7MSGX5YAej53HfgnU+sJf3bi
 vtn3EpzoWudZS60CfDNagDmc3Xo88t67ig==
X-Google-Smtp-Source: ABdhPJxZItaq/s7jj2dBL9Ge/+lmEMQRv6iHy1QOA4UvF8vaZoU/cUMTWLS6rDuVfPso8QJ4L2tIjg==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr56588158wru.142.1594136793408; 
 Tue, 07 Jul 2020 08:46:33 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:54eb:7b69:49b3:9820])
 by smtp.gmail.com with ESMTPSA id q188sm1459676wma.46.2020.07.07.08.46.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Jul 2020 08:46:32 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-8-patrick.delaunay@st.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <fec15eb5-3385-a763-bd2b-c64dd17d9bc6@baylibre.com>
Date: Tue, 7 Jul 2020 17:46:21 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-8-patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot-amlogic@groups.io
Subject: Re: [Uboot-stm32] [PATCH v3 7/7] arm: meson: change trace level for
 phy errors managed by uclass
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

Le 03/07/2020 =E0 17:36, Patrick Delaunay a =E9crit :
> As the error message is now displayed by generic phy functions,
> the pr_err can be change to pr_debug.
> =

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> =

> Changes in v3:
> - add update for mach-meson board-gx: new generic_phy API usage
> =

>  arch/arm/mach-meson/board-gx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-g=
x.c
> index c4cc11f1de..b4fde46fcb 100644
> --- a/arch/arm/mach-meson/board-gx.c
> +++ b/arch/arm/mach-meson/board-gx.c
> @@ -196,8 +196,8 @@ int board_usb_init(int index, enum usb_init_type init)
>  	for (i =3D 0; i < 2; i++) {
>  		ret =3D generic_phy_init(&usb_phys[i]);
>  		if (ret) {
> -			pr_err("Can't init USB PHY%d for %s\n",
> -			       i, ofnode_get_name(dwc2_node));
> +			pr_debug("Can't init USB PHY%d for %s\n",
> +				 i, ofnode_get_name(dwc2_node));
>  			return ret;
>  		}
>  	}
> @@ -205,8 +205,8 @@ int board_usb_init(int index, enum usb_init_type init)
>  	for (i =3D 0; i < 2; i++) {
>  		ret =3D generic_phy_power_on(&usb_phys[i]);
>  		if (ret) {
> -			pr_err("Can't power USB PHY%d for %s\n",
> -			       i, ofnode_get_name(dwc2_node));
> +			pr_debug("Can't power USB PHY%d for %s\n",
> +				 i, ofnode_get_name(dwc2_node));
>  			return ret;
>  		}
>  	}
> =


Acked-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
