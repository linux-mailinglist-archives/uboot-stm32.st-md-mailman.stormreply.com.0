Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589354D9C
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 13:28:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE526C0B765
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 11:28:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5F9AC0B763
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 11:28:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PBQ4ZB028318; Tue, 25 Jun 2019 13:28:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bohPxZIMhHaNJ8ZcsuLuVzmdSrlkflPUNKUyICXF2Ys=;
 b=nfTmBhR9/f+KmmxmglqlHKEcVSzUrcMHsnX+zF+Jftwaq596F06UMbtXI54dW6xmwcSi
 v4CvVvNoH54nBDmMxLMjtlPF90J/XRZWi4ywpwYJNUh59RyZg6K+jDY4AzIdlsO/6cfY
 qIUDb/fImSp50ivXRRnhMeqcdfYZ4ValSErGNYldh18xZJZe9D+yzZxxbVbc/Zzb63Ei
 u3ghn1O0p04JUFNHJ+9J8Rkoy6fQhcgfyTkDh1sVGs+gdM94agMZkPETZDz/BEh/S4pf
 b9Z6qrWpXQ2ZPTPjJzZ7bMWBAw4yTdWvn4ZuzO9SJPd8WgXlQ3zBtH41dwzS3tYfWN7w Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2g8x1x-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 13:28:25 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09EAE31;
 Tue, 25 Jun 2019 11:28:25 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D95122846;
 Tue, 25 Jun 2019 11:28:24 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 13:28:24 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 13:28:24 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, "sjg@chromium.org" <sjg@chromium.org>
Thread-Topic: [PATCH 2/2] rtc: Add rtc driver for stm32mp1
Thread-Index: AQHVKzfEQqbZPGuXJEKVfheOIsG4KqasGjwA
Date: Tue, 25 Jun 2019 11:28:24 +0000
Message-ID: <caae5962-4cc2-c11d-fe5e-568d0f7c4a07@st.com>
References: <20190625092401.4573-1-benjamin.gaignard@st.com>
 <20190625092401.4573-3-benjamin.gaignard@st.com>
In-Reply-To: <20190625092401.4573-3-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <0A584FE18CB98B43811535C49C8BEE6A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_08:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] rtc: Add rtc driver for stm32mp1
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

Hi Benjamin

On 6/25/19 11:24 AM, Benjamin Gaignard wrote:
> Add support of STM32MP1 rtc driver.
> Enable it for basic and trusted configurations.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  configs/stm32mp15_basic_defconfig   |   2 +
>  configs/stm32mp15_trusted_defconfig |   2 +
>  drivers/rtc/Kconfig                 |   6 +
>  drivers/rtc/Makefile                |   1 +
>  drivers/rtc/stm32_rtc.c             | 321 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 332 insertions(+)
>  create mode 100644 drivers/rtc/stm32_rtc.c
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 4aa184fb5b..6352075307 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -94,6 +94,8 @@ CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_DM_REGULATOR_GPIO=y
>  CONFIG_DM_REGULATOR_STM32_VREFBUF=y
>  CONFIG_DM_REGULATOR_STPMIC1=y
> +CONFIG_DM_RTC=y
> +CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_STM32_SERIAL=y
>  CONFIG_SPI=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 66361c8715..e079adc3c4 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -84,6 +84,8 @@ CONFIG_DM_REGULATOR_FIXED=y
>  CONFIG_DM_REGULATOR_GPIO=y
>  CONFIG_DM_REGULATOR_STM32_VREFBUF=y
>  CONFIG_DM_REGULATOR_STPMIC1=y
> +CONFIG_DM_RTC=y
> +CONFIG_RTC_STM32=y
>  CONFIG_SERIAL_RX_BUFFER=y
>  CONFIG_STM32_SERIAL=y
>  CONFIG_SPI=y
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index fd0009b2e2..a383e632ad 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -110,4 +110,10 @@ config RTC_M41T62
>  	  Enable driver for ST's M41T62 compatible RTC devices (like RV-4162).
>  	  It is a serial (I2C) real-time clock (RTC) with alarm.
>  
> +config RTC_STM32
> +	bool "Enable STM32 RTC driver"
> +	depends on DM_RTC
> +	help
> +	  Enable STM32 RTC driver. This driver supports the rtc that is present
> +	  on some STM32 SoCs.
>  endmenu
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 1724602f1c..90e79fb30d 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -50,5 +50,6 @@ obj-$(CONFIG_RTC_RX8025) += rx8025.o
>  obj-$(CONFIG_RTC_RX8010SJ) += rx8010sj.o
>  obj-$(CONFIG_RTC_S3C24X0) += s3c24x0_rtc.o
>  obj-$(CONFIG_RTC_S35392A) += s35392a.o
> +obj-$(CONFIG_RTC_STM32) += stm32_rtc.o
>  obj-$(CONFIG_SANDBOX) += sandbox_rtc.o
>  obj-$(CONFIG_RTC_X1205) += x1205.o
> diff --git a/drivers/rtc/stm32_rtc.c b/drivers/rtc/stm32_rtc.c
> new file mode 100644
> index 0000000000..5d0ffdbc9f
> --- /dev/null
> +++ b/drivers/rtc/stm32_rtc.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
> + */
> +#include <common.h>
> +#include <clk.h>
> +#include <dm.h>
> +#include <rtc.h>
> +#include <asm/io.h>
> +#include <linux/iopoll.h>
> +
> +#define STM32_RTC_TR		0x00
> +#define STM32_RTC_DR		0x04
> +#define STM32_RTC_ISR		0x0C
> +#define STM32_RTC_PRER		0x10
> +#define STM32_RTC_CR		0x18
> +#define STM32_RTC_WPR		0x24
> +
> +/* STM32_RTC_TR bit fields  */
> +#define STM32_RTC_SEC_SHIFT	0
> +#define STM32_RTC_SEC		GENMASK(6, 0)
> +#define STM32_RTC_MIN_SHIFT	8
> +#define STM32_RTC_MIN		GENMASK(14, 8)
> +#define STM32_RTC_HOUR_SHIFT	16
> +#define STM32_RTC_HOUR		GENMASK(21, 16)
> +
> +/* STM32_RTC_DR bit fields */
> +#define STM32_RTC_DATE_SHIFT	0
> +#define STM32_RTC_DATE		GENMASK(5, 0)
> +#define STM32_RTC_MONTH_SHIFT	8
> +#define STM32_RTC_MONTH		GENMASK(12, 8)
> +#define STM32_RTC_WDAY_SHIFT	13
> +#define STM32_RTC_WDAY		GENMASK(15, 13)
> +#define STM32_RTC_YEAR_SHIFT	16
> +#define STM32_RTC_YEAR		GENMASK(23, 16)
> +
> +/* STM32_RTC_CR bit fields */
> +#define STM32_RTC_CR_FMT	BIT(6)
> +
> +/* STM32_RTC_ISR/STM32_RTC_ICSR bit fields */
> +#define STM32_RTC_ISR_INITS	BIT(4)
> +#define STM32_RTC_ISR_RSF	BIT(5)
> +#define STM32_RTC_ISR_INITF	BIT(6)
> +#define STM32_RTC_ISR_INIT	BIT(7)
> +
> +/* STM32_RTC_PRER bit fields */
> +#define STM32_RTC_PRER_PRED_S_SHIFT	0
> +#define STM32_RTC_PRER_PRED_S		GENMASK(14, 0)
> +#define STM32_RTC_PRER_PRED_A_SHIFT	16
> +#define STM32_RTC_PRER_PRED_A		GENMASK(22, 16)
> +
> +/* STM32_RTC_WPR key constants */
> +#define RTC_WPR_1ST_KEY		0xCA
> +#define RTC_WPR_2ND_KEY		0x53
> +#define RTC_WPR_WRONG_KEY	0xFF
> +
> +struct stm32_rtc_priv {
> +	fdt_addr_t base;
> +};
> +
> +static int stm32_rtc_get(struct udevice *dev, struct rtc_time *tm)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	u32 tr, dr;
> +
> +	tr = readl(priv->base + STM32_RTC_TR);
> +	dr = readl(priv->base + STM32_RTC_DR);
> +
> +	tm->tm_sec = bcd2bin((tr & STM32_RTC_SEC) >> STM32_RTC_SEC_SHIFT);
> +	tm->tm_min = bcd2bin((tr & STM32_RTC_MIN) >> STM32_RTC_MIN_SHIFT);
> +	tm->tm_hour = bcd2bin((tr & STM32_RTC_HOUR) >> STM32_RTC_HOUR_SHIFT);
> +
> +	tm->tm_mday = bcd2bin((dr & STM32_RTC_DATE) >> STM32_RTC_DATE_SHIFT);
> +	tm->tm_mon = bcd2bin((dr & STM32_RTC_MONTH) >> STM32_RTC_MONTH_SHIFT);
> +	tm->tm_year = bcd2bin((dr & STM32_RTC_YEAR) >> STM32_RTC_YEAR_SHIFT);
> +	tm->tm_wday = bcd2bin((dr & STM32_RTC_WDAY) >> STM32_RTC_WDAY_SHIFT);
> +	tm->tm_yday = 0;
> +	tm->tm_isdst = 0;
> +
> +	dev_dbg(dev, "Get DATE: %4d-%02d-%02d (wday=%d)  TIME: %2d:%02d:%02d\n",
> +		tm->tm_year, tm->tm_mon, tm->tm_mday, tm->tm_wday,
> +		tm->tm_hour, tm->tm_min, tm->tm_sec);
> +
> +	return 0;
> +}
> +
> +static void stm32_rtc_unlock(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +
> +	writel(RTC_WPR_1ST_KEY, priv->base + STM32_RTC_WPR);
> +	writel(RTC_WPR_2ND_KEY, priv->base + STM32_RTC_WPR);
> +}
> +
> +static void stm32_rtc_lock(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +
> +	writel(RTC_WPR_WRONG_KEY, priv->base + STM32_RTC_WPR);
> +}
> +
> +static int stm32_rtc_enter_init_mode(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	u32 isr = readl(priv->base + STM32_RTC_ISR);
> +
> +	if (!(isr & STM32_RTC_ISR_INITF)) {
> +		isr |= STM32_RTC_ISR_INIT;
> +		writel(isr, priv->base + STM32_RTC_ISR);
> +
> +		return readl_poll_timeout(priv->base + STM32_RTC_ISR,
> +					  isr,
> +					  (isr & STM32_RTC_ISR_INITF),
> +					  100000);
> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32_rtc_wait_sync(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	u32 isr = readl(priv->base + STM32_RTC_ISR);
> +
> +	isr &= ~STM32_RTC_ISR_RSF;
> +	writel(isr, priv->base + STM32_RTC_ISR);
> +
> +	/*
> +	 * Wait for RSF to be set to ensure the calendar registers are
> +	 * synchronised, it takes around 2 rtc_ck clock cycles
> +	 */
> +	return readl_poll_timeout(priv->base + STM32_RTC_ISR,
> +				  isr, (isr & STM32_RTC_ISR_RSF),
> +				  100000);
> +}
> +
> +static void stm32_rtc_exit_init_mode(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	u32 isr = readl(priv->base + STM32_RTC_ISR);
> +
> +	isr &= ~STM32_RTC_ISR_INIT;
> +	writel(isr, priv->base + STM32_RTC_ISR);
> +}
> +
> +static int stm32_rtc_set_time(struct udevice *dev, u32 time, u32 date)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	stm32_rtc_unlock(dev);
> +
> +	ret = stm32_rtc_enter_init_mode(dev);
> +	if (ret)
> +		goto lock;
> +
> +	writel(time, priv->base + STM32_RTC_TR);
> +	writel(date, priv->base + STM32_RTC_DR);
> +
> +	stm32_rtc_exit_init_mode(dev);
> +
> +	ret = stm32_rtc_wait_sync(dev);
> +
> +lock:
> +	stm32_rtc_lock(dev);
> +	return ret;
> +}
> +
> +static int stm32_rtc_set(struct udevice *dev, const struct rtc_time *tm)
> +{
> +	u32 t, d;
> +
> +	dev_dbg(dev, "Set DATE: %4d-%02d-%02d (wday=%d)  TIME: %2d:%02d:%02d\n",
> +		tm->tm_year, tm->tm_mon, tm->tm_mday, tm->tm_wday,
> +		tm->tm_hour, tm->tm_min, tm->tm_sec);
> +
> +	/* Time in BCD format */
> +	t = (bin2bcd(tm->tm_sec) << STM32_RTC_SEC_SHIFT) & STM32_RTC_SEC;
> +	t |= (bin2bcd(tm->tm_min) << STM32_RTC_MIN_SHIFT) & STM32_RTC_MIN;
> +	t |= (bin2bcd(tm->tm_hour) << STM32_RTC_HOUR_SHIFT) & STM32_RTC_HOUR;
> +
> +	/* Date in BCD format */
> +	d = (bin2bcd(tm->tm_mday) << STM32_RTC_DATE_SHIFT) & STM32_RTC_DATE;
> +	d |= (bin2bcd(tm->tm_mon) << STM32_RTC_MONTH_SHIFT) & STM32_RTC_MONTH;
> +	d |= (bin2bcd(tm->tm_year) << STM32_RTC_YEAR_SHIFT) & STM32_RTC_YEAR;
> +	d |= (bin2bcd(tm->tm_wday) << STM32_RTC_WDAY_SHIFT) & STM32_RTC_WDAY;
> +
> +	return stm32_rtc_set_time(dev, t, d);
> +}
> +
> +static int stm32_rtc_reset(struct udevice *dev)
> +{
> +	dev_dbg(dev, "Reset DATE\n");
> +
> +	return stm32_rtc_set_time(dev, 0, 0);
> +}
> +
> +static int stm32_rtc_init(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	unsigned int prer, pred_a, pred_s, pred_a_max, pred_s_max, cr;
> +	unsigned int rate;
> +	struct clk clk;
> +	int ret;
> +	u32 isr = readl(priv->base + STM32_RTC_ISR);
> +
> +	if (isr & STM32_RTC_ISR_INITS)
> +		return  0;
> +
> +	ret = clk_get_by_index(dev, 1, &clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable(&clk);
> +	if (ret) {
> +		clk_free(&clk);
> +		return ret;
> +	}
> +
> +	rate = clk_get_rate(&clk);
> +
> +	/* Find prediv_a and prediv_s to obtain the 1Hz calendar clock */
> +	pred_a_max = STM32_RTC_PRER_PRED_A >> STM32_RTC_PRER_PRED_A_SHIFT;
> +	pred_s_max = STM32_RTC_PRER_PRED_S >> STM32_RTC_PRER_PRED_S_SHIFT;
> +
> +	for (pred_a = pred_a_max; pred_a + 1 > 0; pred_a--) {
> +		pred_s = (rate / (pred_a + 1)) - 1;
> +
> +		if (((pred_s + 1) * (pred_a + 1)) == rate)
> +			break;
> +	}
> +
> +	/*
> +	 * Can't find a 1Hz, so give priority to RTC power consumption
> +	 * by choosing the higher possible value for prediv_a
> +	 */
> +	if (pred_s > pred_s_max || pred_a > pred_a_max) {
> +		pred_a = pred_a_max;
> +		pred_s = (rate / (pred_a + 1)) - 1;
> +	}
> +
> +	stm32_rtc_unlock(dev);
> +
> +	ret = stm32_rtc_enter_init_mode(dev);
> +	if (ret) {
> +		dev_err(dev,
> +			"Can't enter in init mode. Prescaler config failed.\n");
> +		goto unlock;
> +	}
> +
> +	prer = (pred_s << STM32_RTC_PRER_PRED_S_SHIFT) & STM32_RTC_PRER_PRED_S;
> +	prer |= (pred_a << STM32_RTC_PRER_PRED_A_SHIFT) & STM32_RTC_PRER_PRED_A;
> +	writel(prer, priv->base + STM32_RTC_PRER);
> +
> +	/* Force 24h time format */
> +	cr = readl(priv->base + STM32_RTC_CR);
> +	cr &= ~STM32_RTC_CR_FMT;
> +	writel(cr, priv->base + STM32_RTC_CR);
> +
> +	stm32_rtc_exit_init_mode(dev);
> +
> +	ret = stm32_rtc_wait_sync(dev);
> +
> +unlock:
> +	stm32_rtc_lock(dev);
> +
> +	clk_disable(&clk);
> +	clk_free(&clk);
> +
> +	return ret;
> +}
> +
> +static int stm32_rtc_probe(struct udevice *dev)
> +{
> +	struct stm32_rtc_priv *priv = dev_get_priv(dev);
> +	struct clk clk;
> +	int ret;
> +
> +	priv->base = dev_read_addr(dev);
> +	if (priv->base == FDT_ADDR_T_NONE)
> +		return -EINVAL;
> +
> +	ret = clk_get_by_index(dev, 0, &clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable(&clk);
> +	if (ret) {
> +		clk_free(&clk);
> +		return ret;
> +	}
> +
> +	ret = stm32_rtc_init(dev);
> +
> +	if (ret) {
> +		clk_disable(&clk);
> +		clk_free(&clk);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct rtc_ops stm32_rtc_ops = {
> +	.get = stm32_rtc_get,
> +	.set = stm32_rtc_set,
> +	.reset = stm32_rtc_reset,
> +};
> +
> +static const struct udevice_id stm32_rtc_ids[] = {
> +	{ .compatible = "st,stm32mp1-rtc" },
> +	{ }
> +};
> +
> +U_BOOT_DRIVER(rtc_stm32) = {
> +	.name	= "rtc-stm32",
> +	.id	= UCLASS_RTC,
> +	.probe	= stm32_rtc_probe,
> +	.of_match = stm32_rtc_ids,
> +	.ops	= &stm32_rtc_ops,
> +	.priv_auto_alloc_size = sizeof(struct stm32_rtc_priv),
> +};

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
