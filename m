Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E215D33B
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 08:55:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FA19C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 07:55:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 834EFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 07:55:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E7tBZ8030193; Fri, 14 Feb 2020 08:55:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rvJNsggN/5d/dnYwcnoP9FAUjtQu2/03sAd0a/Wqvng=;
 b=SgtfrhT/oTFT+Z33+5S5iInYA/5AFEhz60IKHNfuUTU2o/Lq3ba3KASy4r649pAZ+f4e
 hKcLbe3MunoNHOsRLJ8NXnAVDfPOtCUQLF1VL1y0hFd/co3KtSk3oAt2HT8qnnx2gKZ0
 hLK1potR2kEz1pmhC41NP/2sKmkoQAE8kNnzXPFFX28zMDQWuGNriwaZYZp5UWPdUfzu
 6XOG4SucMy7SyFxpiZ9t7+CHC4MgpHKzz1RTv769PSGfOodG7REbIDLRuWieN2IYmapn
 X4wxT9vWFxaPFn+DQ2w4BQRCtPCWxSp6SlSrdOF9pr2EkX1MDKs+BzmzXht0Cq1bQJeK Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhtbt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 08:55:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AED13100048;
 Fri, 14 Feb 2020 08:55:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A543221F169;
 Fri, 14 Feb 2020 08:55:39 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 08:55:39 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 08:55:39 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/4] pinctrl: stmfx: update the result type of
 dm_i2c_reg_read
Thread-Index: AQHV1b+DwVbljmXowkm8rz2ZT7QG2qgaXAiA
Date: Fri, 14 Feb 2020 07:55:39 +0000
Message-ID: <6358b73a-2cb5-eb71-d702-7d9963c4b6d2@st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
 <20200128094415.5768-4-patrick.delaunay@st.com>
In-Reply-To: <20200128094415.5768-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <8838746F274D3B458EE2F394E3A8F886@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] pinctrl: stmfx: update the result
 type of dm_i2c_reg_read
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


On 1/28/20 10:44 AM, Patrick Delaunay wrote:
> Use int as result of dm_i2c_reg_read to avoid warning with
> W=1 (warning: comparison is always false due to limited range
> of data type [-Wtype-limits])
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-stmfx.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 0b5a0433cd..0def27166e 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -351,11 +351,12 @@ static int stmfx_chip_init(struct udevice *dev)
>  	int ret;
>  	struct dm_i2c_chip *chip = dev_get_parent_platdata(dev);
>  
> -	id = dm_i2c_reg_read(dev, STMFX_REG_CHIP_ID);
> -	if (id < 0) {
> -		dev_err(dev, "error reading chip id: %d\n", id);
> +	ret = dm_i2c_reg_read(dev, STMFX_REG_CHIP_ID);
> +	if (ret < 0) {
> +		dev_err(dev, "error reading chip id: %d\n", ret);
>  		return ret;
>  	}
> +	id = (u8)ret;
>  	/*
>  	 * Check that ID is the complement of the I2C address:
>  	 * STMFX I2C address follows the 7-bit format (MSB), that's why

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
