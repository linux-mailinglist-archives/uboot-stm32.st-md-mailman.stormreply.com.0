Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267F1CDC19
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:54:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83872C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:54:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4503DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:54:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDRwcp007378; Mon, 11 May 2020 15:54:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JShhd6RBjpaZLkOpnkrNQEzbvQlDrIJcKpA6eRU/CE0=;
 b=cLUZHBm6w4aACJ+BqAZ6q1KKeqGboqxqR1+EmVJDhwu4DLNEUPYrDpzF/S1KTP2HHGXV
 cT7jzPuzYuosxoTTa2niZqdmqq4qDfJT4KRYQ/KNlXVpbcND9spEQl2MDmZ367nQnm4d
 Ye8RPQFB4cpOWaIYShvG+dSMhTpgnbKhwy/RifjUb1xCgphieadFzvRdXwZWES51Ah0S
 zoiOtPvoty6n1JUEWxACzFsdIt8EVJBnfVQS+qyihcgGW1C0WR/E6KUD7+OtVo2iHdZA
 ZkjwlJS6Oava7FV0GSHEsjJ3COWc3mE9o0Z/+Gm3rJeLcKurFAWBRp9GjdHycb6qIwhc Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj01tw6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:54:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92A5110002A;
 Mon, 11 May 2020 15:54:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 870252A9769;
 Mon, 11 May 2020 15:54:10 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:54:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:54:10 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 7/9] board: st: stpmic1: add function
 stmpic_buck1_set
Thread-Index: AQHWJ5ulLNzMgH8jv0GoSS1BaOZbJA==
Date: Mon, 11 May 2020 13:54:10 +0000
Message-ID: <a9abcaf4-40eb-5eca-e6c7-1661100dd958@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.7.Ibcf2b148dc7ba271546063667955e82cf997d7ee@changeid>
In-Reply-To: <20200421171123.7.Ibcf2b148dc7ba271546063667955e82cf997d7ee@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <59DDC9BCAC89B343AEC414884D95D5C0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 7/9] board: st: stpmic1: add function
 stmpic_buck1_set
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

Hi Patrick

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> Add a function stmpic_buck1_set to configure buck1 voltage
> in SPL as regulator framework is not available.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/stpmic1.c | 24 ++++++++++++++++++++++++
>  board/st/common/stpmic1.h |  6 ++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 board/st/common/stpmic1.h
>
> diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
> index ca10a2246b..a912242ad9 100644
> --- a/board/st/common/stpmic1.c
> +++ b/board/st/common/stpmic1.c
> @@ -9,6 +9,30 @@
>  #include <power/pmic.h>
>  #include <power/stpmic1.h>
>  
> +int stmpic_buck1_set(u32 voltage_mv)
> +{
> +	struct udevice *dev;
> +	int ret;
> +	u32 value;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_PMIC,
> +					  DM_GET_DRIVER(pmic_stpmic1), &dev);
> +	if (ret)
> +		return ret;
> +
> +	/* VDDCORE= STMPCI1 BUCK1 ramp=+25mV, 5 => 725mV, 36 => 1500mV */
> +	value = ((voltage_mv - 725) / 25) + 5;
> +	if (value < 5)
> +		value = 5;
> +	if (value > 36)
> +		value = 36;
> +
> +	return pmic_clrsetbits(dev,
> +			       STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK1),
> +			       STPMIC1_BUCK_VOUT_MASK,
> +			       STPMIC1_BUCK_VOUT(value));
> +}
> +
>  int board_ddr_power_init(enum ddr_type ddr_type)
>  {
>  	struct udevice *dev;
> diff --git a/board/st/common/stpmic1.h b/board/st/common/stpmic1.h
> new file mode 100644
> index 0000000000..a020dddbe0
> --- /dev/null
> +++ b/board/st/common/stpmic1.h
> @@ -0,0 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> + */
> +
> +int stmpic_buck1_set(u32 voltage_mv);


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
