Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C09E300A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Dec 2024 00:44:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9B0DC6DD72;
	Tue,  3 Dec 2024 23:44:30 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA78C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 23:44:23 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20241203234419epoutp03e30b62447568a6c180131fd1d6820a7d~Nz2P3sFAE1874518745epoutp03P
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 23:44:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20241203234419epoutp03e30b62447568a6c180131fd1d6820a7d~Nz2P3sFAE1874518745epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1733269459;
 bh=aSELNagoNvH9LFcWDuTutASp5C4ohhumneftxJzg5Ss=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=oZPMjy2CDFLDJlvWI6ikVO47BN4snHjzYgGFfuPvjJE2OKr6qYhyrtr51c7FaiT3j
 iCDSoRlgtKonfOzqaLNVwx+Bex3/kcbVn18QPE+k6GaQCiClD2MeKP97BRsvQyH8z6
 W5SWiYx6mWpAySjgWnx1OYoY0Yk4kebbjh6DcxP4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241203234419epcas1p11839598b712abaed10f0c7dd5c76389a~Nz2PIUrvV3129931299epcas1p1o;
 Tue,  3 Dec 2024 23:44:19 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.132]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Y2y0x6cyLz4x9Pw; Tue,  3 Dec
 2024 23:44:17 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.F4.23869.1D79F476; Wed,  4 Dec 2024 08:44:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241203234417epcas1p28b77a3c9077368c3b38690b20eeb0dd5~Nz2NoSIgt2977429774epcas1p2K;
 Tue,  3 Dec 2024 23:44:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241203234417epsmtrp16a2affed7cf93c6e0db69a643c05bd3a~Nz2NndO_l1590215902epsmtrp1X;
 Tue,  3 Dec 2024 23:44:17 +0000 (GMT)
X-AuditID: b6c32a36-6e9e870000005d3d-fb-674f97d1e0c0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.3A.18729.1D79F476; Wed,  4 Dec 2024 08:44:17 +0900 (KST)
Received: from jh80chung01 (unknown [10.113.111.84]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20241203234417epsmtip2ea49692f72ec617032a6a2d75fd1d61d~Nz2Nbu7Fs0960509605epsmtip2S;
 Tue,  3 Dec 2024 23:44:17 +0000 (GMT)
From: "Jaehoon Chung" <jh80.chung@samsung.com>
To: "'Patrice Chotard'" <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
In-Reply-To: <20241203100611.354468-1-patrice.chotard@foss.st.com>
Date: Wed, 4 Dec 2024 08:44:17 +0900
Message-ID: <000001db45dd$443cdd10$ccb69730$@samsung.com>
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGqifrPAwC6UYr0+eC5Rcad0W/iDwHJXg/ssyhbazA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjk+LIzCtJLcpLzFFi42LZdlhTV/fidP90g69TTCxOvrnKYvGmrZHR
 4ufJ9+wWk9ZfY7dYf3kbu8W3LdsYLaZO2sxu8XZvJ7vFwq3LWRw4Pd4+ncLoMbvhIovHvFkn
 WDye9m9l93h1YBW7x4kJl5g8zt7ZwehxcJ9hAEdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8
 qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0H1KCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul
 1IKUnALTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMn6/PMxY8Eq/42byHpYFxq3AXIyeHhICJ
 xJ31u1i7GLk4hAR2MErMfnSFGcL5xCjx5OMvFpAqIYFvjBKPduXDdPRNfQFVtJdR4urBfUwQ
 zktGica9O5hAqtgE9CT+L1rIDGKLCPhLPJ88gxGkiFlgB5PEti8rwRKcAk4SKz+2sIHYwgKB
 EtMatgI1c3CwCKhITHsmAhLmFbCU6J27kRFis4LEz6fLWCFmWkm8+HYMzGYWEJGY3dkGdpGE
 wEQOiTsLHzBDNLhILPo4mw3CFpZ4dXwLO4QtJfGyv40doqGZUWLpkoOsEE4Po8S/hutQHcYS
 +5dOBruIWUBTYv0ufYhtfBLvvvawgoQlBHglOtqEIKpVJC69fskEM//uk/+sELaHxMv2KcyQ
 YJwKNH5S1QRG+VlI7p6FsGABI9MqRrHUguLc9NRiwwIjeFQm5+duYgQnTC2zHYyT3n7QO8TI
 xMF4iFGCg1lJhHf5eu90Id6UxMqq1KL8+KLSnNTiQ4ymwICcyCwlmpwPTNl5JfGGJpYGJmZG
 xiYWhmaGSuK8Z66UpQoJpCeWpGanphakFsH0MXFwSjUwyW8XficveKGha9Nyw+MpR28y/5+x
 ZgKr1644VpvSrt/tVhbx8pMmLTqhKhL6+C/X06DJyl0JFpWxvww/7M9zU6kXenBY8JdhYZyL
 u6iLTZ7wHmHWndE+K3/O3pWf++Rgm+LJvR2/0jPsplZyc6g5PLfhnnNwzSUev9r/kbEmzdlJ
 6Z/2/056WzBT66e81MF5y1vs+eUPb2T7cersuTvJgjcUme8oHPS9NWvltAPL5hVKGr8JjJiZ
 JHJWyWQ3e8HWmb+7w5N5Kxvf2f2Im/3rbpHs02rmD3fdXl82e+nN6nRTb+YL3x9HKv9c6s//
 eGWl+fxVLf9fzxTO+rgrq8Z1xkEF8VvVYedKXBQ/PvdZocRSnJFoqMVcVJwIALLMm1MhBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO7F6f7pBrNfilucfHOVxeJNWyOj
 xc+T79ktJq2/xm6x/vI2dotvW7YxWkydtJnd4u3eTnaLhVuXszhwerx9OoXRY3bDRRaPebNO
 sHg87d/K7vHqwCp2jxMTLjF5nL2zg9Hj4D7DAI4oLpuU1JzMstQifbsEroyfr88zFjwSr/jZ
 vIelgXGrcBcjJ4eEgIlE39QXzF2MXBxCArsZJc52L2OCSEhJfH46la2LkQPIFpY4fLgYouY5
 o8TxjnPsIDVsAnoS/xctZAaxRQT8JZ5PnsEIUsQssIdJ4nLTV3aIjsmMEp+uPmUBqeIUcJJY
 +bGFDcQWBupovfAGbAOLgIrEtGciIGFeAUuJ3rkbGSGOUJD4+XQZK8QCK4kX346B2cwCIhKz
 O9uYJzAKzELiLmBkXMUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERzwWpo7GLev+qB3
 iJGJg/EQowQHs5II7/L13ulCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYICaQnlqRmp6YW
 pBbBZJk4OKUamLYr+3NyGLfO8N3FHrpsw7l1MYYhd6Zc5KiUCguw3WLt/q/0hX5hrP6hXSct
 C0Tn/Xt8n3+lfsMlH5XCrws/aMx+7Dp5WodM9OkV+qVzvrbulLG+2Rd87dOUj2o2gld9E+ed
 8vHJXXYvpdWk9dDreJYPFz7ctZ0617dnybf/Yl7mt5cqNE682/lma8Hv4PVXQmY6TS4Ptk1Z
 152l1XYxKLricMiTstMPa2v+G9nb7Zp59UNBSkvXSSed+TVXr9b91pLykbgQ1LxMLlN7wRqj
 LdHfoh5OvbXvmnP7NfsfNovFUieFsCS4vHK4t2TyHnOpHJbaWU4HdmcK7tsXX/tUvnoV7424
 iXofBTe1NDr8W6XEUpyRaKjFXFScCAAti7Jo5wIAAA==
X-CMS-MailID: 20241203234417epcas1p28b77a3c9077368c3b38690b20eeb0dd5
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241203101026epcas1p333452efbf04c91a651dc4de99877dbb8
References: <CGME20241203101026epcas1p333452efbf04c91a651dc4de99877dbb8@epcas1p3.samsung.com>
 <20241203100611.354468-1-patrice.chotard@foss.st.com>
Cc: 'Marek Vasut' <marex@denx.de>, 'Tom Rini' <trini@konsulko.com>,
 'Jonas Karlman' <jonas@kwiboo.se>, 'Quentin Schulz' <quentin.schulz@cherry.de>,
 'Simon Glass' <sjg@chromium.org>,
 'U-Boot STM32' <uboot-stm32@st-md-mailman.stormreply.com>,
 'Patrick DELAUNAY' <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] power: regulator: replace some
 debug() by dev_dbg()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



> -----Original Message-----
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> Sent: Tuesday, December 3, 2024 7:06 PM
> To: u-boot@lists.denx.de
> Cc: Patrice CHOTARD <patrice.chotard@foss.st.com>; Patrick DELAUNAY <patrick.delaunay@foss.st.com>; U-
> Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; Jaehoon Chung <jh80.chung@samsung.com>; Jonas
> Karlman <jonas@kwiboo.se>; Marek Vasut <marex@denx.de>; Quentin Schulz <quentin.schulz@cherry.de>;
> Simon Glass <sjg@chromium.org>; Tom Rini <trini@konsulko.com>
> Subject: [PATCH v2 1/2] power: regulator: replace some debug() by dev_dbg()
>
> Replace some debug() by dev_dbg() when dev variable
> is available/valid.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

>
> ---
>
> Changes in v2:
>       - rework dev_dbg() message to avoid printing twice dev->name.
>
>  drivers/power/regulator/regulator-uclass.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
> index decd0802c84..80ea5e65d48 100644
> --- a/drivers/power/regulator/regulator-uclass.c
> +++ b/drivers/power/regulator/regulator-uclass.c
> @@ -9,6 +9,7 @@
>  #include <errno.h>
>  #include <dm.h>
>  #include <log.h>
> +#include <dm/device_compat.h>
>  #include <dm/uclass-internal.h>
>  #include <linux/delay.h>
>  #include <power/pmic.h>
> @@ -43,8 +44,7 @@ static void regulator_set_value_ramp_delay(struct udevice *dev, int old_uV,
>  {
>  	int delay = DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
>
> -	debug("regulator %s: delay %u us (%d uV -> %d uV)\n", dev->name, delay,
> -	      old_uV, new_uV);
> +	dev_dbg(dev, "delay %u us (%d uV -> %d uV)\n", delay, old_uV, new_uV);
>
>  	udelay(delay);
>  }
> @@ -263,7 +263,7 @@ int regulator_get_by_platname(const char *plat_name, struct udevice **devp)
>  	for (ret = uclass_find_first_device(UCLASS_REGULATOR, &dev); dev;
>  	     ret = uclass_find_next_device(&dev)) {
>  		if (ret) {
> -			debug("regulator %s, ret=%d\n", dev->name, ret);
> +			dev_dbg(dev, "ret=%d\n", ret);
>  			continue;
>  		}
>
> @@ -439,16 +439,15 @@ static int regulator_post_bind(struct udevice *dev)
>  	/* Regulator's mandatory constraint */
>  	uc_pdata->name = dev_read_string(dev, property);
>  	if (!uc_pdata->name) {
> -		debug("%s: dev '%s' has no property '%s'\n",
> -		      __func__, dev->name, property);
> +		dev_dbg(dev, "has no property '%s'\n", property);
>  		uc_pdata->name = dev_read_name(dev);
>  		if (!uc_pdata->name)
>  			return -EINVAL;
>  	}
>
>  	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
> -		debug("'%s' of dev: '%s', has nonunique value: '%s\n",
> -		      property, dev->name, uc_pdata->name);
> +		dev_dbg(dev, "'%s' has nonunique value: '%s\n",
> +			property, uc_pdata->name);
>  		return -EINVAL;
>  	}
>
> --
> 2.25.1



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
