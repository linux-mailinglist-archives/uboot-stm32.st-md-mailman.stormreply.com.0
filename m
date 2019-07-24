Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C394072915
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 09:35:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D897CFAC67
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 07:35:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45FDBC32EAB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 07:35:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O7VZJe031042; Wed, 24 Jul 2019 09:35:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EeiGUgkOuDtO3lBUoMTvTYb4Ac0AsZIMXBcL+THoqQA=;
 b=x19IFwNW7lQxafrsjkXvSpdsNUQpYiQcilhaIGDED0wtGnAHhx62mmQPaV74rIFiIYYS
 yes4mui9HWID4hcHSVaHmoaINNvc65qmVqKyWkUTHvWGHlrE+xoyi2PDTk+Yiguja0tU
 AwCbnM+5MejM+N/jHcxxUonBoqfoZqi2AU7qjYNcJwAxKD534AgXgcv0LVsXZxlwX6z/
 GTS4PlSWF4hjdTxKpfVfVUPjxBp1/BfzCqKprHRmaH4LhrtESKiMmkrglgA8aDGhw4PZ
 H5PSzULZ4UPLqWDutLD4dNk++BMjdTLyUetyqyBFBepZ+bQAmfziayGxJP5zO5zramxZ 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tx607ur9t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 24 Jul 2019 09:35:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBDD634;
 Wed, 24 Jul 2019 07:35:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4C53247E;
 Wed, 24 Jul 2019 07:35:11 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jul
 2019 09:35:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 24 Jul 2019 09:35:11 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Peng Fan <peng.fan@nxp.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
Thread-Index: AQHVQTlwi5Ywb4bRrE6HjID/WHalcabY6P2AgABXr4A=
Date: Wed, 24 Jul 2019 07:35:11 +0000
Message-ID: <96f73b58-1e72-9cbc-5be7-916dbe72d2d5@st.com>
References: <20190723093128.22007-1-patrice.chotard@st.com>
 <AM0PR04MB4481C5FF5CC7517AAF41467588C60@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4481C5FF5CC7517AAF41467588C60@AM0PR04MB4481.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <58E13600FE3C9A4ABA9E7855093499E7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg()
	call.
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

Hi Peng

On 7/24/19 4:21 AM, Peng Fan wrote:
>> Subject: [PATCH] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
>>
>> host->mmc and host->mmc->dev must be set before calling
>> sdhci_setup_cfg() to avoid hang during mmc initialization.
>>
>> Thanks to commit 3d296365e4e8
>> ("mmc: sdhci: Add support for sdhci-caps-mask") which put this issue into
>> evidence.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> ---
>>
>>  drivers/mmc/sti_sdhci.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mmc/sti_sdhci.c b/drivers/mmc/sti_sdhci.c index
>> 8ed47e113d..c7f1947edd 100644
>> --- a/drivers/mmc/sti_sdhci.c
>> +++ b/drivers/mmc/sti_sdhci.c
>> @@ -97,14 +97,14 @@ static int sti_sdhci_probe(struct udevice *dev)
>>  		       SDHCI_QUIRK_NO_HISPD_BIT;
>>
>>  	host->host_caps = MMC_MODE_DDR_52MHz;
>> +	host->mmc = &plat->mmc;
>> +	host->mmc->dev = dev;
>>
>>  	ret = sdhci_setup_cfg(&plat->cfg, host, 50000000, 400000);
>>  	if (ret)
>>  		return ret;
>>
>> -	host->mmc = &plat->mmc;
>>  	host->mmc->priv = host;
> Should this line also be moved?

Currently this field is not needed in sdhci_setup_cfg(), but ok, i will move it also

if it can avoid issue in the future.

Thanks

Patrice


>
> Regards,
> Peng
>
>> -	host->mmc->dev = dev;
>>  	upriv->mmc = host->mmc;
>>
>>  	return sdhci_probe(dev);
>> --
>> 2.17.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
