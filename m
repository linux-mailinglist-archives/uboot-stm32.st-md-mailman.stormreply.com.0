Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D36EE768DE2
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95D6BC7128C;
	Mon, 31 Jul 2023 07:18:22 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A739C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:36:44 +0000 (UTC)
Received: from [192.168.0.125] (unknown [82.76.24.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 58C426607023;
 Tue, 18 Jul 2023 08:36:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689665803;
 bh=nKEvyCsjjCzCClUKO0fehli+u/RkFJyabRy/TQZdXHo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ak2pIZXxu7LLOzmQiSslHcW3joT5IYZXop6hh1+GZSThkBDEaN1feum/FtFU5ZXHt
 YMmpA1SEoo8NQRmU5a5q9nz94lFqACg0zsvuuCGGhNWGmFisqVuFqc+X33OLgJNikl
 w3NvEDzTBgYsTOK7dBZxfmt//rudUglrKmButApj/pfxR8XPkOdNdnVXcTzceDzT0+
 tEbYL7zvzPvKtfkHi/Hazf/tJpE3CyKchYMFb5yjaUtRzuCf/7mC3AtQfZ19+zneld
 zP034+zZX2a1kKJFzMSS2ily2jLHDM3Gltvu6yJ5m01GtkoZQfOGSSLknKsnpn3ysT
 ipZtKA47e75lw==
Message-ID: <f796704a-900e-2794-89fb-26dde4512ad1@collabora.com>
Date: Tue, 18 Jul 2023 10:36:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Svyatoslav Ryhel <clamor95@gmail.com>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jaehoon Chung
 <jh80.chung@samsung.com>, Anatolij Gustschin <agust@denx.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20230718070504.19810-1-clamor95@gmail.com>
 <20230718070504.19810-2-clamor95@gmail.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230718070504.19810-2-clamor95@gmail.com>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: Re: [Uboot-stm32] [PATCH v1 1/4] power: regulator: expand basic
 reference counter onto all uclass
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Svyatoslav,


On 7/18/23 10:05, Svyatoslav Ryhel wrote:
> Commit is based on 4fcba5d ("regulator: implement basic reference
> counter") but expands the idea to all regulators instead of just
> fixed/gpio regulators.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/power/regulator/regulator-uclass.c | 22 ++++++++++++++++++++++
>   drivers/power/regulator/regulator_common.c | 22 ----------------------
>   drivers/power/regulator/regulator_common.h | 21 ---------------------
>   include/power/regulator.h                  |  2 ++
>   4 files changed, 24 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index 3a6ba69f6d..c9194fe95c 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -172,6 +172,23 @@ int regulator_set_enable(struct udevice *dev, bool enable)
>   	if (!enable && uc_pdata->always_on)
>   		return -EACCES;
>   
> +	/* If previously enabled, increase count */
> +	if (enable && uc_pdata->enable_count > 0) {
> +		uc_pdata->enable_count++;
> +		return -EALREADY;
> +	}
> +
> +	if (!enable) {
> +		if (uc_pdata->enable_count > 1) {
> +			/* If enabled multiple times, decrease count */
> +			uc_pdata->enable_count--;
> +			return -EBUSY;
> +		} else if (!uc_pdata->enable_count) {
> +			/* If already disabled, do nothing */
> +			return -EALREADY;
> +		}
> +	}
> +
>   	if (uc_pdata->ramp_delay)
>   		old_enable = regulator_get_enable(dev);
>   
> @@ -187,6 +204,11 @@ int regulator_set_enable(struct udevice *dev, bool enable)
>   		}
>   	}
>   
> +	if (enable)
> +		uc_pdata->enable_count++;
> +	else
> +		uc_pdata->enable_count--;
> +
>   	return ret;
>   }
>   
> diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
> index e26f5ebec3..d88bc6f6de 100644
> --- a/drivers/power/regulator/regulator_common.c
> +++ b/drivers/power/regulator/regulator_common.c
> @@ -72,23 +72,6 @@ int regulator_common_set_enable(const struct udevice *dev,
>   		return 0;
>   	}
>   
> -	/* If previously enabled, increase count */
> -	if (enable && plat->enable_count > 0) {
> -		plat->enable_count++;
> -		return -EALREADY;
> -	}
> -
> -	if (!enable) {
> -		if (plat->enable_count > 1) {
> -			/* If enabled multiple times, decrease count */
> -			plat->enable_count--;
> -			return -EBUSY;
> -		} else if (!plat->enable_count) {
> -			/* If already disabled, do nothing */
> -			return -EALREADY;
> -		}
> -	}
> -
>   	ret = dm_gpio_set_value(&plat->gpio, enable);
>   	if (ret) {
>   		pr_err("Can't set regulator : %s gpio to: %d\n", dev->name,
> @@ -103,10 +86,5 @@ int regulator_common_set_enable(const struct udevice *dev,
>   	if (!enable && plat->off_on_delay_us)
>   		udelay(plat->off_on_delay_us);
>   
> -	if (enable)
> -		plat->enable_count++;
> -	else
> -		plat->enable_count--;
> -
>   	return 0;
>   }
> diff --git a/drivers/power/regulator/regulator_common.h b/drivers/power/regulator/regulator_common.h
> index d4962899d8..15f1fa4c93 100644
> --- a/drivers/power/regulator/regulator_common.h
> +++ b/drivers/power/regulator/regulator_common.h
> @@ -13,7 +13,6 @@ struct regulator_common_plat {
>   	struct gpio_desc gpio; /* GPIO for regulator enable control */
>   	unsigned int startup_delay_us;
>   	unsigned int off_on_delay_us;
> -	unsigned int enable_count;
>   };
>   
>   int regulator_common_of_to_plat(struct udevice *dev,
> @@ -21,26 +20,6 @@ int regulator_common_of_to_plat(struct udevice *dev,
>   				char *enable_gpio_name);
>   int regulator_common_get_enable(const struct udevice *dev,
>   	struct regulator_common_plat *plat);
> -/*
> - * Enable or Disable a regulator
> - *
> - * This is a reentrant function and subsequent calls that enable will
> - * increase an internal counter, and disable calls will decrease the counter.
> - * The actual resource will be enabled when the counter gets to 1 coming from 0,
> - * and disabled when it reaches 0 coming from 1.
> - *
> - * @dev: regulator device
> - * @plat: Platform data
> - * @enable: bool indicating whether to enable or disable the regulator
> - * @return:
> - * 0 on Success
> - * -EBUSY if the regulator cannot be disabled because it's requested by
> - *        another device
> - * -EALREADY if the regulator has already been enabled or has already been
> - *        disabled
> - * -EACCES if there is no possibility to enable/disable the regulator
> - * -ve on different error situation
> - */

Can't this whole documentation that you are removing be in fact 
integrated into the documentation for the function you moved the 
reference counter housekeeping to ?

>   int regulator_common_set_enable(const struct udevice *dev,
>   	struct regulator_common_plat *plat, bool enable);
>   
> diff --git a/include/power/regulator.h b/include/power/regulator.h
> index ff1bfc2435..727776a8cf 100644
> --- a/include/power/regulator.h
> +++ b/include/power/regulator.h
> @@ -158,6 +158,7 @@ enum regulator_flag {
>    * @name**     - fdt regulator name - should be taken from the device tree
>    * ctrl_reg:   - Control register offset used to enable/disable regulator
>    * volt_reg:   - register offset for writing voltage vsel values
> + * enable_count - counter of enable calls for this regulator
>    *
>    * Note:
>    * *  - set automatically on device probe by the uclass's '.pre_probe' method.
> @@ -184,6 +185,7 @@ struct dm_regulator_uclass_plat {
>   	u8 volt_reg;
>   	bool suspend_on;
>   	u32 suspend_uV;
> +	u32 enable_count;
>   };
>   
>   /* Regulator device operations */

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
