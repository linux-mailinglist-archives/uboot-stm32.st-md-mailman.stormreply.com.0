Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57015BAA4
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 09:16:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DDE0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 08:16:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1AE3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 08:16:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01D8Cwnp011341; Thu, 13 Feb 2020 09:16:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nyrzQgEOFBQvm3WrEq6V4lCcx/RdEqnbX5Db2yFFAfE=;
 b=X2JKyVc0lqLVmjx2TIDCqD9EGMRB49KH/4hWmOFeYSpwI0rZXANtqRk/TymsyEPpZOSx
 aDtdYUghLqJazxlE7iLcfpTyzRUDKB2LUjzQ8uhgP3fRmpuMB3nPEOj+wB6rYs2h26lW
 Kc+X786N/SFP2FejUaAKu9cGifqcyFLgzyj+Wol6iUpG2hvWi9HGG92MJm6LWLiJOYkX
 S5yjdDlcUdtnNfK14CVDSb/3Re5FRZNUvv7F6hDVvfoR9N0kcYGCGA1iTL1vxopWiEl1
 6UzLxxqfAS8/8fua8vDrsooZQysQeOt7I0GFnuWX6s7Rh2QyMxLayLvl3MPtrdD5BIrP BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda3feg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 09:16:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9970F100034;
 Thu, 13 Feb 2020 09:16:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E5DE222CBD;
 Thu, 13 Feb 2020 09:16:41 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 09:16:41 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 09:16:41 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/9] stm32mp1: pwr: use the last binding for pwr
Thread-Index: AQHV1brrwksrRmMNokSQmFXmLYmbi6gYz5wA
Date: Thu, 13 Feb 2020 08:16:40 +0000
Message-ID: <6c3a3ff3-4a9c-92f8-08cb-fb496ed9df9e@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.2.Ic3c189e7da6e6ff909e435d7011057b867559ba2@changeid>
In-Reply-To: <20200128101041.2.Ic3c189e7da6e6ff909e435d7011057b867559ba2@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <D8B2B3020680E44AA5B8A6AC1855FF4B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_01:2020-02-12,
 2020-02-13 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/9] stm32mp1: pwr: use the last binding
	for pwr
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


On 1/28/20 10:10 AM, Patrick Delaunay wrote:
> Update the driver to use the latest binding from kernel v5.5-rc1:
> no more use syscon or regmap to access to pwr register and
> only one pwr_regulators node with the compatibility "st,stm32mp1,pwr-reg"
> is available.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157-u-boot.dtsi        |  2 +-
>  arch/arm/dts/stm32mp157a-avenger96.dts     |  8 ++--
>  arch/arm/dts/stm32mp157a-dk1.dts           |  8 ++--
>  arch/arm/dts/stm32mp157c-ed1.dts           |  8 ++--
>  arch/arm/dts/stm32mp157c.dtsi              | 46 +++++++++-------------
>  arch/arm/dts/stm32mp15xx-dhcom.dtsi        |  8 ++--
>  arch/arm/mach-stm32mp/include/mach/stm32.h |  1 -
>  arch/arm/mach-stm32mp/pwr_regulator.c      | 23 ++++++-----
>  arch/arm/mach-stm32mp/syscon.c             |  1 -
>  9 files changed, 42 insertions(+), 63 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157-u-boot.dtsi b/arch/arm/dts/stm32mp157-u-boot.dtsi
> index 0d1d387e54..cb8d60e33d 100644
> --- a/arch/arm/dts/stm32mp157-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157-u-boot.dtsi
> @@ -128,7 +128,7 @@
>  	u-boot,dm-pre-reloc;
>  };
>  
> -&pwr {
> +&pwr_regulators {
>  	u-boot,dm-pre-reloc;
>  };
>  
> diff --git a/arch/arm/dts/stm32mp157a-avenger96.dts b/arch/arm/dts/stm32mp157a-avenger96.dts
> index 5b15a4a915..232fe70905 100644
> --- a/arch/arm/dts/stm32mp157a-avenger96.dts
> +++ b/arch/arm/dts/stm32mp157a-avenger96.dts
> @@ -282,11 +282,9 @@
>  	status = "okay";
>  };
>  
> -&pwr {
> -	pwr-regulators {
> -		vdd-supply = <&vdd>;
> -		vdd_3v3_usbfs-supply = <&vdd_usb>;
> -	};
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
>  };
>  
>  &rng1 {
> diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
> index 4652253012..dc61bfc3d5 100644
> --- a/arch/arm/dts/stm32mp157a-dk1.dts
> +++ b/arch/arm/dts/stm32mp157a-dk1.dts
> @@ -397,11 +397,9 @@
>  	status = "okay";
>  };
>  
> -&pwr {
> -	pwr-regulators {
> -		vdd-supply = <&vdd>;
> -		vdd_3v3_usbfs-supply = <&vdd_usb>;
> -	};
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
>  };
>  
>  &rng1 {
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index bc4d7e1ab5..acb59f24cc 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -263,11 +263,9 @@
>  	status = "okay";
>  };
>  
> -&pwr {
> -	pwr-regulators {
> -		vdd-supply = <&vdd>;
> -		vdd_3v3_usbfs-supply = <&vdd_usb>;
> -	};
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
>  };
>  
>  &rng1 {
> diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
> index 28a7e4c08a..22a9386248 100644
> --- a/arch/arm/dts/stm32mp157c.dtsi
> +++ b/arch/arm/dts/stm32mp157c.dtsi
> @@ -1110,36 +1110,26 @@
>  			#reset-cells = <1>;
>  		};
>  
> -		pwr: pwr@50001000 {
> -			compatible = "st,stm32mp1-pwr", "st,stm32-pwr", "syscon", "simple-mfd";
> -			reg = <0x50001000 0x400>;
> -			system-power-controller;
> -			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> -			st,sysrcc = <&rcc>;
> -			clocks = <&rcc PLL2_R>;
> -			clock-names = "phyclk";
> -
> -			pwr-regulators {
> -				compatible = "st,stm32mp1,pwr-reg";
> -				st,tzcr = <&rcc 0x0 0x1>;
> -
> -				reg11: reg11 {
> -					regulator-name = "reg11";
> -					regulator-min-microvolt = <1100000>;
> -					regulator-max-microvolt = <1100000>;
> -				};
> +		pwr_regulators: pwr@50001000 {
> +			compatible = "st,stm32mp1,pwr-reg";
> +			reg = <0x50001000 0x10>;
> +
> +			reg11: reg11 {
> +				regulator-name = "reg11";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +			};
>  
> -				reg18: reg18 {
> -					regulator-name = "reg18";
> -					regulator-min-microvolt = <1800000>;
> -					regulator-max-microvolt = <1800000>;
> -				};
> +			reg18: reg18 {
> +				regulator-name = "reg18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
>  
> -				usb33: usb33 {
> -					regulator-name = "usb33";
> -					regulator-min-microvolt = <3300000>;
> -					regulator-max-microvolt = <3300000>;
> -				};
> +			usb33: usb33 {
> +				regulator-name = "usb33";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>  			};
>  		};
>  
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom.dtsi b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
> index 96661ae783..bed69c97b6 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom.dtsi
> @@ -217,11 +217,9 @@
>  	status = "okay";
>  };
>  
> -&pwr {
> -	pwr-regulators {
> -		vdd-supply = <&vdd>;
> -		vdd_3v3_usbfs-supply = <&vdd_usb>;
> -	};
> +&pwr_regulators {
> +	vdd-supply = <&vdd>;
> +	vdd_3v3_usbfs-supply = <&vdd_usb>;
>  };
>  
>  &qspi {
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 88126b8cdb..f0636005e5 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -37,7 +37,6 @@
>  /* enumerated used to identify the SYSCON driver instance */
>  enum {
>  	STM32MP_SYSCON_UNKNOWN,
> -	STM32MP_SYSCON_PWR,
>  	STM32MP_SYSCON_SYSCFG,
>  };
>  
> diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
> index 9484645dbd..f00e7527c2 100644
> --- a/arch/arm/mach-stm32mp/pwr_regulator.c
> +++ b/arch/arm/mach-stm32mp/pwr_regulator.c
> @@ -6,8 +6,8 @@
>  #include <common.h>
>  #include <dm.h>
>  #include <errno.h>
> -#include <regmap.h>
>  #include <syscon.h>
> +#include <asm/io.h>
>  #include <power/pmic.h>
>  #include <power/regulator.h>
>  
> @@ -26,7 +26,7 @@ struct stm32mp_pwr_reg_info {
>  };
>  
>  struct stm32mp_pwr_priv {
> -	struct regmap *regmap;
> +	fdt_addr_t base;
>  };
>  
>  static int stm32mp_pwr_write(struct udevice *dev, uint reg,
> @@ -38,7 +38,9 @@ static int stm32mp_pwr_write(struct udevice *dev, uint reg,
>  	if (len != 4)
>  		return -EINVAL;
>  
> -	return regmap_write(priv->regmap, STM32MP_PWR_CR3, val);
> +	writel(val, priv->base + STM32MP_PWR_CR3);
> +
> +	return 0;
>  }
>  
>  static int stm32mp_pwr_read(struct udevice *dev, uint reg, uint8_t *buff,
> @@ -49,21 +51,18 @@ static int stm32mp_pwr_read(struct udevice *dev, uint reg, uint8_t *buff,
>  	if (len != 4)
>  		return -EINVAL;
>  
> -	return regmap_read(priv->regmap, STM32MP_PWR_CR3, (u32 *)buff);
> +	*(u32 *)buff = readl(priv->base + STM32MP_PWR_CR3);
> +
> +	return 0;
>  }
>  
>  static int stm32mp_pwr_ofdata_to_platdata(struct udevice *dev)
>  {
>  	struct stm32mp_pwr_priv *priv = dev_get_priv(dev);
> -	struct regmap *regmap;
>  
> -	regmap = syscon_get_regmap_by_driver_data(STM32MP_SYSCON_PWR);
> -	if (IS_ERR(regmap)) {
> -		pr_err("%s: unable to find regmap (%ld)\n", __func__,
> -		       PTR_ERR(regmap));
> -		return PTR_ERR(regmap);
> -	}
> -	priv->regmap = regmap;
> +	priv->base = dev_read_addr(dev);
> +	if (priv->base == FDT_ADDR_T_NONE)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
> index 6070837bf0..3e61ce4097 100644
> --- a/arch/arm/mach-stm32mp/syscon.c
> +++ b/arch/arm/mach-stm32mp/syscon.c
> @@ -9,7 +9,6 @@
>  #include <asm/arch/stm32.h>
>  
>  static const struct udevice_id stm32mp_syscon_ids[] = {
> -	{ .compatible = "st,stm32mp1-pwr", .data = STM32MP_SYSCON_PWR },
>  	{ .compatible = "st,stm32mp157-syscfg",
>  	  .data = STM32MP_SYSCON_SYSCFG },
>  	{ }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
